unit l3MemorySizeUtilsPrim;
{$Include l3Define.inc}

interface

type
 Tl3MemorySizeFunc = function (aPtr: Pointer): Integer;
 {$If not defined(XE)}
function L3MemorySizeDelphi7(aPtr: Pointer): Integer;
   {* функция для получения размера куска памяти }
 {$IfEnd} //not XE
 {$If defined(XE)}
function L3MemorySizeXE(aPtr: Pointer): Integer;
   {* функция для получения размера куска памяти }
 {$IfEnd} //XE

implementation

uses
  l3MemorySizeUtils
  ;

// unit methods

{$If not defined(XE)}
function L3MemorySizeDelphi7(aPtr: Pointer): Integer;
//#UC START# *51DAD8DC00B2_51DADE55035E_var*
const
  cThisUsedFlag = 2;
  cPrevFreeFlag = 1;
  cFillerFlag   = Integer($80000000);
  cFlags        = cThisUsedFlag or cPrevFreeFlag or cFillerFlag;

type
  PUsed = ^TUsed;
  TUsed = packed record
    sizeFlags: Integer;
  end;//TUsed

//#UC END# *51DAD8DC00B2_51DADE55035E_var*
begin
//#UC START# *51DAD8DC00B2_51DADE55035E_impl*
 if (aPtr = nil) then
  Result := 0
 else
  Result := PUsed(PMem(aPtr)-SizeOf(TUsed)).sizeFlags and not cFlags - sizeof(TUsed);
//  Result := (PLong(Long(aP) - 4)^ AND not cFlags) - 4;
//#UC END# *51DAD8DC00B2_51DADE55035E_impl*
end;//L3MemorySizeDelphi7
{$IfEnd} //not XE

{$If defined(XE)}
function L3MemorySizeXE(aPtr: Pointer): Integer;
//#UC START# *51DADA9600F9_51DADE55035E_var*

const
  {----------------------------Block type flags---------------------------}
  {The lower 3 bits in the dword header of small blocks (4 bits in medium and
   large blocks) are used as flags to indicate the state of the block}
  {Set if the block is not in use}
  IsFreeBlockFlag = 1;
  {Set if this is a medium block}
  IsMediumBlockFlag = 2;
  {Set if it is a medium block being used as a small block pool. Only valid if
   IsMediumBlockFlag is set.}
  IsSmallBlockPoolInUseFlag = 4;
  {Set if it is a large block. Only valid if IsMediumBlockFlag is not set.}
  IsLargeBlockFlag = 4;
  {Is the medium block preceding this block available?}
  PreviousMediumBlockIsFreeFlag = 8;
  {Is this large block segmented? I.e. is it actually built up from more than
   one chunk allocated through VirtualAlloc? (Only used by large blocks.)}
  LargeBlockIsSegmented = 8;
  {The flags masks for small blocks}
  DropSmallFlagsMask = -8;
  ExtractSmallFlagsMask = 7;
  {The flags masks for medium and large blocks}
  DropMediumAndLargeFlagsMask = -16;
  ExtractMediumAndLargeFlagsMask = 15;
{------------------------------Private types------------------------------}
type
 
  {Move procedure type}
  TMoveProc = procedure(const ASource; var ADest; ACount: NativeInt);
 
  {-----------------------Small block structures--------------------------}
 
  {Pointer to the header of a small block pool}
  PSmallBlockPoolHeader = ^TSmallBlockPoolHeader;
 
  {Small block type (Size = 32 bytes for 32-bit, 64 bytes for 64-bit).}
  PSmallBlockType = ^TSmallBlockType;
  TSmallBlockType = record
    {True = Block type is locked}
    BlockTypeLocked: Boolean;
    {Bitmap indicating which of the first 8 medium block groups contain blocks
     of a suitable size for a block pool.}
    AllowedGroupsForBlockPoolBitmap: Byte;
    {The block size for this block type}
    BlockSize: Word;
    {The minimum and optimal size of a small block pool for this block type}
    MinimumBlockPoolSize: Word;
    OptimalBlockPoolSize: Word;
    {The first partially free pool for the given small block. This field must
     be at the same offset as TSmallBlockPoolHeader.NextPartiallyFreePool.}
    NextPartiallyFreePool: PSmallBlockPoolHeader;
    {The last partially free pool for the small block type. This field must
     be at the same offset as TSmallBlockPoolHeader.PreviousPartiallyFreePool.}
    PreviousPartiallyFreePool: PSmallBlockPoolHeader;
    {The offset of the last block that was served sequentially. The field must
     be at the same offset as TSmallBlockPoolHeader.FirstFreeBlock.}
    NextSequentialFeedBlockAddress: Pointer;
    {The last block that can be served sequentially.}
    MaxSequentialFeedBlockAddress: Pointer;
    {The pool that is current being used to serve blocks in sequential order}
    CurrentSequentialFeedPool: PSmallBlockPoolHeader;
{$ifdef UseCustomFixedSizeMoveRoutines}
    {The fixed size move procedure used to move data for this block size when
     it is upsized. When a block is downsized (which usually does not occur
     that often) the variable size move routine is used.}
    UpsizeMoveProcedure: TMoveProc;
{$else}
    Reserved1: Pointer;
{$endif}
{$if SizeOf(Pointer) = 8}
    {Pad to 64 bytes for 64-bit}
    Reserved2: Pointer;
{$ifend}
  end;
 
  {Small block pool (Size = 32 bytes for 32-bit, 48 bytes for 64-bit).}
  TSmallBlockPoolHeader = record
    {BlockType}
    BlockType: PSmallBlockType;
{$if SizeOf(Pointer) <> 8}
    {Align the next fields to the same fields in TSmallBlockType and pad this
     structure to 32 bytes for 32-bit}
    Reserved1: Cardinal;
{$ifend}
    {The next and previous pool that has free blocks of this size. Do not
     change the position of these two fields: They must be at the same offsets
     as the fields in TSmallBlockType of the same name.}
    NextPartiallyFreePool: PSmallBlockPoolHeader;
    PreviousPartiallyFreePool: PSmallBlockPoolHeader;
    {Pointer to the first free block inside this pool. This field must be at
     the same offset as TSmallBlockType.NextSequentialFeedBlockAddress.}
    FirstFreeBlock: Pointer;
    {The number of blocks allocated in this pool.}
    BlocksInUse: Cardinal;
    {Small block pool signature. Used by the leak checking mechanism to
     determine whether a medium block is a small block pool or a regular medium
     block.}
    SmallBlockPoolSignature: Cardinal;
    {The pool pointer and flags of the first block}
    FirstBlockPoolPointerAndFlags: NativeUInt;
  end;
 
  {Small block layout:
   At offset -SizeOf(Pointer) = Flags + address of the small block pool.
   At offset BlockSize - SizeOf(Pointer) = Flags + address of the small block
   pool for the next small block.
  }
 
  {------------------------Medium block structures------------------------}
 
  {The medium block pool from which medium blocks are drawn. Size = 16 bytes
   for 32-bit and 32 bytes for 64-bit.}
  PMediumBlockPoolHeader = ^TMediumBlockPoolHeader;
  TMediumBlockPoolHeader = record
    {Points to the previous and next medium block pools. This circular linked
     list is used to track memory leaks on program shutdown.}
    PreviousMediumBlockPoolHeader: PMediumBlockPoolHeader;
    NextMediumBlockPoolHeader: PMediumBlockPoolHeader;
    {Padding}
    Reserved1: NativeUInt;
    {The block size and flags of the first medium block in the block pool}
    FirstMediumBlockSizeAndFlags: NativeUInt;
  end;
 
  {Medium block layout:
   Offset: -2 * SizeOf(Pointer) = Previous Block Size (only if the previous block is free)
   Offset: -SizeOf(Pointer) = This block size and flags
   Offset: 0 = User data / Previous Free Block (if this block is free)
   Offset: SizeOf(Pointer) = Next Free Block (if this block is free)
   Offset: BlockSize - 2*SizeOf(Pointer) = Size of this block (if this block is free)
   Offset: BlockSize - SizeOf(Pointer) = Size of the next block and flags
 
  {A medium block that is unused}
  PMediumFreeBlock = ^TMediumFreeBlock;
  TMediumFreeBlock = record
    PreviousFreeBlock: PMediumFreeBlock;
    NextFreeBlock: PMediumFreeBlock;
  end;
 
  {-------------------------Large block structures------------------------}
 
  {Large block header record (Size = 16 for 32-bit, 32 for 64-bit)}
  PLargeBlockHeader = ^TLargeBlockHeader;
  TLargeBlockHeader = record
    {Points to the previous and next large blocks. This circular linked
     list is used to track memory leaks on program shutdown.}
    PreviousLargeBlockHeader: PLargeBlockHeader;
    NextLargeBlockHeader: PLargeBlockHeader;
    {The user allocated size of the Large block}
    UserAllocatedSize: NativeUInt;
    {The size of this block plus the flags}
    BlockSizeAndFlags: NativeUInt;
  end; 

{---------------------------Private constants-----------------------------}
const
  {The size of the block header in front of small and medium blocks}
  BlockHeaderSize = SizeOf(Pointer);
  {The size of a small block pool header}
  SmallBlockPoolHeaderSize = SizeOf(TSmallBlockPoolHeader);
  {The size of a medium block pool header}
  MediumBlockPoolHeaderSize = SizeOf(TMediumBlockPoolHeader);
  {The size of the header in front of Large blocks}
  LargeBlockHeaderSize = SizeOf(TLargeBlockHeader);
  (*
  {This memory manager}
  ThisMemoryManager: TMemoryManagerEx = (
    GetMem: SysGetMem;
    FreeMem: SysFreeMem;
    ReallocMem: SysReallocMem;
    AllocMem: SysAllocMem;
    RegisterExpectedMemoryLeak: SysRegisterExpectedMemoryLeak;
    UnregisterExpectedMemoryLeak: SysUnregisterExpectedMemoryLeak);
   *)
   
var
 lBlockHeader: Cardinal;
 LPSmallBlockType: PSmallBlockType;
 LOldAvailableSize: Cardinal;
//#UC END# *51DADA9600F9_51DADE55035E_var*
begin
//#UC START# *51DADA9600F9_51DADE55035E_impl*
 if (aPtr = nil) then
   Result := 0
 else
 begin
 {Get the block header: Is it actually a small block?}
   LBlockHeader := PNativeUInt(PByte(aPtr) - BlockHeaderSize)^;
   {Is it a small block that is in use?}
   if LBlockHeader and (IsFreeBlockFlag or IsMediumBlockFlag or IsLargeBlockFlag) = 0 then
   begin
     {----------------------------Small block------------------------------}
     {The block header is a pointer to the block pool: Get the block type}
     LPSmallBlockType := PSmallBlockPoolHeader(LBlockHeader).BlockType;
     {Get the available size inside blocks of this type.}
     Result := LPSmallBlockType.BlockSize - BlockHeaderSize;
   end
   else
   begin
     {Is this a medium block or a large block?}
     if LBlockHeader and (IsFreeBlockFlag or IsLargeBlockFlag) = 0 then
     begin
      Result:= (LBlockHeader and DropMediumAndLargeFlagsMask) - BlockHeaderSize;
     end
     else
     begin
       {Is this a valid large block?}
       if LBlockHeader and (IsFreeBlockFlag or IsMediumBlockFlag) = 0 then
       begin
         {-----------------------Large block------------------------------}
         {Get the block header}
         //LBlockHeader := PNativeUInt(PByte(aP) - BlockHeaderSize)^;
         {Subtract the overhead to determine the useable size in the large block.}
         Result := (LBlockHeader and DropMediumAndLargeFlagsMask) - (LargeBlockHeaderSize + BlockHeaderSize);
       end
       else
       begin
         {-----------------------Invalid block------------------------------}
         {Bad pointer: probably an attempt to reallocate a free memory block.}
         Result := 0;
         assert(false);
       end;
     end;
   end;
 end;
//#UC END# *51DADA9600F9_51DADE55035E_impl*
end;//L3MemorySizeXE
{$IfEnd} //XE

end.