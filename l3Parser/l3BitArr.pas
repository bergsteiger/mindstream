unit l3BitArr;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3BitArr -                  }
{ Начат: 26.03.1998 15:57             }
{ $Id: l3BitArr.pas,v 1.47 2015/01/16 15:51:51 lulin Exp $ }

// $Log: l3BitArr.pas,v $
// Revision 1.47  2015/01/16 15:51:51  lulin
// - рисуем на модели.
//
// Revision 1.46  2015/01/16 13:53:35  lulin
// - рисуем на модели.
//
// Revision 1.45  2014/05/12 16:06:18  lulin
// - чистим код.
//
// Revision 1.44  2013/07/08 16:43:15  lulin
// - выделяем работу с размером куска памяти.
//
// Revision 1.43  2013/04/09 17:40:34  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.42  2013/04/04 11:22:01  lulin
// - портируем.
//
// Revision 1.41  2009/07/17 12:42:04  lulin
// {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.40  2009/07/15 15:39:02  lulin
// - убираем ненужный параметр.
//
// Revision 1.39  2009/02/26 08:25:36  lulin
// - чистка кода.
//
// Revision 1.38  2007/09/05 09:33:06  lulin
// - убран лишний параметр.
//
// Revision 1.37  2007/09/04 16:57:27  lulin
// - убран ненужный параметр.
//
// Revision 1.36  2007/09/04 16:49:32  lulin
// - cleanup.
//
// Revision 1.34  2007/09/04 16:35:48  lulin
// - переименована структура данных.
//
// Revision 1.33  2007/09/04 16:20:56  lulin
// - убран ненужный параметр.
//
// Revision 1.32  2007/09/04 15:54:22  lulin
// - убран ненужный параметр.
//
// Revision 1.31  2007/09/04 15:45:16  lulin
// - убран ненужный параметр.
//
// Revision 1.30  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.29  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.28  2006/12/08 08:49:27  lulin
// - оптимизированы битовые операции для коротких масок.
//
// Revision 1.27  2006/11/25 16:50:34  lulin
// - удалена запись,чтение маски заполненных тегов.
//
// Revision 1.26  2006/06/27 08:52:56  lulin
// - cleanup.
//
// Revision 1.25  2004/09/20 16:11:51  lulin
// - для Немезиса уменьшен размер пула объектов.
//
// Revision 1.24  2004/05/31 10:02:55  law
// - включен define _l3BoxedBitArray - так вроде с ним все заработало.
//
// Revision 1.23  2004/05/31 09:16:20  law
// - bug fix: данные сдвигались после перераспределения памяти в меньшую сторону, что в корне неверно.
//
// Revision 1.22  2004/05/28 18:03:35  law
// - new define: _l3BoxedBitArray - пока выключен.
//
// Revision 1.21  2004/05/28 15:06:14  law
// - change: распределение памяти выделено в отдельные методы.
//
// Revision 1.20  2004/05/28 13:49:06  law
// - отключил директивы _l3OldSetBit, _l3OldClearBit.
//
// Revision 1.19  2003/04/15 13:26:49  law
// - new unit: evUnits.
//
// Revision 1.18  2002/04/25 12:11:57  law
// - optimization: изменяем методику распределения памяти.
//
// Revision 1.17  2001/08/29 07:01:09  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.16  2001/06/19 09:28:13  law
// - cleanup.
//
// Revision 1.15  2001/05/31 09:23:40  law
// - cleanup: убрана работа со старой логикой масок тегов.
//
// Revision 1.14  2000/12/15 15:18:59  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  l3Types
  ;

{.$Define _l3OldSetBit}
{.$Define _l3OldClearBit}  

type
  Tl3LowLevelPtrBitArray = packed object
    private
    // internal fields
      f_Bits : PAnsiChar;
    private
    // internal methods
      procedure AllocBits(var aBits: PAnsiChar; aSize: Cardinal);
        {-}
      procedure FreeBits(var aBits: PAnsiChar);
        {-}
      procedure ReallocBits(var aBits: PAnsiChar; aNewSize: Cardinal);
        {-}
    public
    // public methods
      function  Empty: Boolean;
        {-}
      procedure Clear(Action: Tl3IteratorAction; MaskSize: Long);
        {-}
      function  SetBit(BitNum: Long; Action: Tl3FreeAction; const Data; var MaskSize : Byte): Pointer;
        {-}
        { Action - указатель на локальную процедуру: function(P: Pointer): Bool; far;}
      function  CheckBit(BitNum: Long): LongBool;
        {-}
      function  GetBitData(BitNum: Long; MaskSize: Long): Pointer;
        {-}
      procedure ClearBit(BitNum: Long; Action: Tl3FreeAction; var MaskSize: Byte);
        {-}
        { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
      {$IfDef l3BorlandMemoryManager}
      function  MemAllocated: Long;
      {$Else  l3BorlandMemoryManager}
      function  MemAllocated(MaskSize, DataSize: Long): Long;
      //function  MemAllocated(MaskSize: Long): Long;
      {$EndIf l3BorlandMemoryManager}
        {-}
      function  BitCount(MaskSize: Long): Long;
        {-}
      procedure Store(MaskSize, DataSize: Long; Action: Tl3IteratorAction);
        {-}
        { Action - указатель на локальную процедуру: function(P: Pointer; BitNum: Long): Bool; far;}
  end;//Tl3LowLevelPtrBitArray

  Tl3PtrHash = packed object(Tl3LowLevelPtrBitArray)
    private
    // internal fields
      f_MaskSize : Byte;
    public
    // public methods
      function  SetItem(ItemIndex: Long; Action: Tl3FreeAction; const Data): Pointer;
        {-}
      function  GetItem(ItemIndex: Long): Pointer;
        {-}
      procedure Clear(Action: Tl3IteratorAction);
        {-}
      procedure DeleteItem(ItemIndex: Long; Action: Tl3FreeAction);
        {-}
        { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
      function  CheckItem(ItemIndex: Long): LongBool;
        {-}
      function  BitCount: Long;
        {-}
      procedure Store(Action: Tl3IteratorAction);
        {-}
        { Action - указатель на локальную процедуру: function(P: Pointer; BitNum: Long): Bool; far;}
      procedure StoreF(Action: Tl3IteratorAction);
        {-}
      procedure Init;
        {-}
      function  MaskSize: Byte;
        {-}
      {$IfNDef l3BorlandMemoryManager}
      function  MemAllocated: Long;
        {-}
      {$EndIf  l3BorlandMemoryManager}
  end;//Tl3PtrHash

  Tl3OneBytePtrHash = packed object(Tl3LowLevelPtrBitArray)
    private
    // internal methods
      function  MaskSize: Byte;
        {-}
    public
    // public methods
      function  SetItem(ItemIndex: Long; Action: Tl3FreeAction; const Data): Pointer;
        {-}
      function  GetItem(ItemIndex: Long): Pointer;
        {-}
      procedure Clear(Action: Tl3IteratorAction);
        {-}
      procedure DeleteItem(ItemIndex: Long; Action: Tl3FreeAction);
        {-}
        { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
      function  CheckItem(ItemIndex: Long): LongBool;
        {-}
      function  BitCount: Long;
        {-}
      procedure Store(Action: Tl3IteratorAction);
        {-}
        { Action - указатель на локальную процедуру: function(P: Pointer; BitNum: Long): Bool; far;}
      procedure StoreF(Action: Tl3IteratorAction);
        {-}
      procedure Init;
        {-}
      {$IfNDef l3BorlandMemoryManager}
      function  MemAllocated: Long;
        {-}
      {$EndIf  l3BorlandMemoryManager}
  end;//Tl3OneBytePtrHash

  Tl3PtrArray = packed object
    private
    // internal fields
      f_Data : PAnsiChar;
    public
    // public methods
      function  Empty: Boolean;
        {-}
      function  SetItem(ItemIndex: Long; Action: Tl3FreeAction; const Data): Pointer;
        {-}
      function  GetItem(ItemIndex: Long): Pointer;
        {-}
      procedure Clear(Action   : Tl3IteratorAction;
                      aBuffers : Pointer = nil);
        {-}
      procedure DeleteItem(ItemIndex: Long; Action: Tl3FreeAction);
        {-}
        { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
      function  CheckItem(ItemIndex: Long): LongBool;
        {-}
      function  BitCount: Long;
        {-}
      procedure Store(Action: Tl3IteratorAction);
        {-}
        { Action - указатель на локальную процедуру: function(P: Pointer; BitNum: Long): Bool; far;}
      procedure StoreF(Action: Tl3IteratorAction);
        {-}
      procedure Init(Size     : Byte;
                     aBuffers : Pointer = nil);
        {-}
  end;//Tl3PtrArray

function l3Bit2Index(Mask: Pointer; BitNum: Long): Long;
  {-}
function l3CheckBit(Mask: Pointer; BitNum: Long): LongBool;
  {-}
procedure l3ClearBit(Mask: Pointer; BitNum: Long);
  {-}
procedure l3SetBit(Mask: Pointer; BitNum: Long);
  {-}
procedure l3InvertBit(Mask: Pointer; BitNum: Long);
  {-}

implementation

uses
  SysUtils,
  l3MinMax,
  l3Const,
  l3Base,
  l3Bits,
  l3MemorySizeUtils,
  l3Memory
  {$IfDef l3BoxedBitArray}
  ,
  l3BoxMemoryManager
  {$EndIf l3BoxedBitArray}
  ;

{ --- Bit Functions --- }

function l3Bit2IndexOld(Mask: Pointer; BitNum: Long): Long; register;
                    {eax,           edx}
asm
       push    esi
       mov     esi, eax
       mov     ecx, edx
       push    ebx
       xor     ebx, ebx
       push    edi
       xor     edi, edi
       xor     edx, edx
       inc     ecx
@@lp:  dec     ecx
       or      edx, edx
       jne     @@2
       lodsd
       mov     edx, 32
       cmp     ecx, edx
       jge     @@2
       bt      eax, ecx
       jc      @@5
       inc     edi
@@5:
@@2:
       jecxz   @@4
       inc     ecx
       
       dec     edx
       shr     eax, 1
       jnc     @@1
       inc     ebx
@@1:   loop    @@lp
@@4:   mov     eax, ebx
       or      edi, edi
       jz      @@3
       not     eax
@@3:   pop     edi
       pop     ebx
       pop     esi
end;

{$IfOpt Q+}
 {$Define Q_Plus}
 {$Q-}
{$EndIf Q+}

{$IfOpt R+}
 {$Define R_Plus}
 {$R-}
{$EndIf R+}

const
 l3BitMask : array [0..31] of Cardinal =
  (
   0,
   (1 shl 1) - 1,
   (1 shl 2) - 1,
   (1 shl 3) - 1,
   (1 shl 4) - 1,
   (1 shl 5) - 1,
   (1 shl 6) - 1,
   (1 shl 7) - 1,
   (1 shl 8) - 1,
   (1 shl 9) - 1,
   (1 shl 10) - 1,
   (1 shl 11) - 1,
   (1 shl 12) - 1,
   (1 shl 13) - 1,
   (1 shl 14) - 1,
   (1 shl 15) - 1,
   (1 shl 16) - 1,
   (1 shl 17) - 1,
   (1 shl 18) - 1,
   (1 shl 19) - 1,
   (1 shl 20) - 1,
   (1 shl 21) - 1,
   (1 shl 22) - 1,
   (1 shl 23) - 1,
   (1 shl 24) - 1,
   (1 shl 25) - 1,
   (1 shl 26) - 1,
   (1 shl 27) - 1,
   (1 shl 28) - 1,
   (1 shl 29) - 1,
   (1 shl 30) - 1,
   $7FFFFFFF
  );

function l3Bit2Index(Mask: Pointer; BitNum: Long): Long;
                    {eax,           edx}
{$IfNDef XE}
  register;
  {-}
asm
 cmp  edx, 32
 jnl  l3Bit2IndexOld
 mov  eax, [eax]
 or   eax, eax
 jnz  @@NotNull
 mov  eax, -1
 jmp  @@ret
@@NotNull:
 bt   eax, edx
 jnc  @@BitSet
 and  eax, dword ptr [l3BitMask + edx * 4]
 jmp  l3BitCountF
@@BitSet:
 and  eax, dword ptr [l3BitMask + edx * 4]
 call l3BitCountF
 not  eax
@@ret:
end;//asm
{$Else XE}
var
 l_Mask : Long;
begin
 if (BitNum < 32) then
 begin
  l_Mask := PLong(Mask)^;
  if (l_Mask = 0) then
   Result := not(0)
  else
  if l3TestBit(l_Mask, BitNum) then
   Result := l3BitCountF(l_Mask AND l3BitMask[BitNum])
  else
   Result := not(l3BitCountF(l_Mask AND l3BitMask[BitNum]));
 end//BitNum < 32
 else
  Result := l3Bit2IndexOld(Mask, BitNum);
end;
{$EndIf XE}

{$IfDef Q_Plus}
 {$Q+}
 {$UnDef Q_Plus}
{$EndIf Q_Plus}

{$IfDef R_Plus}
 {$R+}
 {$UnDef R_Plus}
{$EndIf R_Plus}

function _l3CheckBit(Mask: Pointer; BitNum: Long): LongBool; register;
                   {eax,           edx}
asm
       push    esi
       mov     esi, eax
       mov     eax, edx
       xor     edx, edx
       mov     ecx, 32
       div     ecx
       shl     eax, 2
       add     esi, eax
       lodsd
       bt      eax, edx
       jc      @@1
       xor     eax, eax
@@1:
       pop     esi
end;

function l3CheckBit(Mask: Pointer; BitNum: Long): LongBool; register;
                   {eax,           edx}
asm
 cmp  edx, 32
 jnl  _l3CheckBit 
 mov  eax, [eax]
 jmp  l3TestBit
end;///asm 
{begin
 if (BitNum < 32) then
  Result := l3TestBit(PLong(Mask)^, BitNum)
 else
  Result := _l3CheckBit(Mask, BitNum);
end;}

procedure l3ClearBit(Mask: Pointer; BitNum: Long); register;
                    {eax,           edx}
asm
       push    esi
       mov     esi, eax
       mov     eax, edx
       xor     edx, edx
       mov     ecx, 32
       div     ecx
       shl     eax, 2
       add     esi, eax
       btr     [esi], edx
@@1:   pop     esi
end;

procedure _l3SetBit(Mask: Pointer; BitNum: Long); register;
                    {eax,           edx}
asm
       push    esi
       mov     esi, eax
       mov     eax, edx
       xor     edx, edx
       mov     ecx, 32
       div     ecx
       shl     eax, 2
       add     esi, eax
       bts     [esi], edx
@@1:   pop     esi
end;

procedure l3SetBit(Mask: Pointer; BitNum: Long); register;
                  {eax,           edx}
asm
 cmp  edx, 32
 jnl  _l3SetBit
 bts  [eax], edx
 //jmp  l3Bits.l3SetBit
end;///asm
{begin
 if (BitNum < 32) then
  l3Bits.l3SetBit(PLong(Mask)^, BitNum)
 else
  _l3SetBit(Mask, BitNum);
end;}

procedure l3InvertBit(Mask: Pointer; BitNum: Long); register;
                     {eax,           edx}
asm
       push    esi
       mov     esi, eax
       mov     eax, edx
       xor     edx, edx
       mov     ecx, 32
       div     ecx
       shl     eax, 2
       add     esi, eax
       btc     [esi], edx
@@1:   pop     esi
end;

// start object Tl3PtrArray

function Tl3PtrArray.Empty: Boolean;
  {-}
begin
 Result := (f_Data = nil);
end;

procedure Tl3PtrArray.Init(Size     : Byte;
                          aBuffers : Pointer = nil);
  {-}
var
 i : Long;
 P : PAnsiChar;
begin
 if (aBuffers = nil) then
  l3System.GetLocalMem(f_Data, Size shl 2)
 else
  Pl3MemoryChain(aBuffers).AllocItem(Pointer(f_Data), Size shl 2);
 P := f_Data;
 for i := 0 to Pred(l3MemorySize(P) div SizeOf(Pointer)) do
 begin
  PLong(P)^ := l3NilLong;
  Inc(P, SizeOf(Long));
 end;
end;

function Tl3PtrArray.SetItem(ItemIndex: Long; Action: Tl3FreeAction; const Data): Pointer;
  {-}
var
 Res : Bool;
begin
 if (f_Data = nil) then
  Result := nil
 else
 begin
  Res := true;
  Result := f_Data + ItemIndex shl 2;
  if Assigned(Action) AND (PLong(Result)^ <> l3NilLong) then
   Res := Action(Result);
  if Res then
   l3Move(Data, Result^, 1 shl 2)
  else
   Result := nil;
 end;//f_Data = nil
end;

function Tl3PtrArray.GetItem(ItemIndex: Long): Pointer;
  {-}
begin
 if (f_Data = nil) then
  Result := nil
 else
 begin
  Result := f_Data + ItemIndex shl 2;
  if (PLong(Result)^ = l3NilLong) then
   Result := nil;
 end;//f_Data = nil
end;

procedure Tl3PtrArray.Clear(Action   : Tl3IteratorAction;
                           aBuffers : Pointer = nil);
  {-}
begin
 Store(Action);
 if (aBuffers = nil) then
  l3System.FreeLocalMem(f_Data)
 else
  Pl3MemoryChain(aBuffers).FreeItem(Pointer(f_Data));
end;

procedure Tl3PtrArray.DeleteItem(ItemIndex: Long; Action: Tl3FreeAction);
  {-}
  { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
var
 P : PAnsiChar;
begin
 if (f_Data <> nil) then
 begin
  P := f_Data + ItemIndex shl 2;
  if (PLong(P)^ <> l3NilLong) then
  begin
   if Assigned(Action) then
    Action(P);
   PLong(P)^ := l3NilLong;
  end;//PLong(P)^ <> l3NilLong
 end;//Data <> nil
end;

function  Tl3PtrArray.CheckItem(ItemIndex: Long): LongBool;
  {-}
begin
 Result := (f_Data <> nil) AND (PLong(f_Data + ItemIndex shl 2)^ <> l3NilLong);
end;

function Tl3PtrArray.BitCount: Long;
  {-}
var
 i : Long;
 P : PAnsiChar;
begin
 Result := 0;
 P := f_Data;
 if (P <> nil) then
 begin
  for i := 0 to Pred(l3MemorySize(P) div SizeOf(Pointer)) do
  begin
   if (PLong(P)^ <> l3NilLong) then Inc(Result);
   Inc(P, SizeOf(Long));
  end;//for i
 end;//P <> nil
end;

procedure Tl3PtrArray.Store(Action: Tl3IteratorAction);
  {-}
  { Action - указатель на локальную процедуру: function(P: Pointer; BitNum: Long): Bool; far;}
var
 i   : Long;
 P   : PAnsiChar;
begin
 if Assigned(Action) AND (f_Data <> nil) then
 begin
  P := f_Data;
  for i := 0 to Pred(l3MemorySize(P) div SizeOf(Pointer)) do
   if (PLong(P)^ <> l3NilLong) AND not Action(P, i) then
    break
   else
    Inc(P, 4);
 end;//Action <> nil
end;

procedure Tl3PtrArray.StoreF(Action: Tl3IteratorAction);
  {-}
begin
 try
  Store(Action);
 finally
  l3FreeIA(Action);
 end;//try..finally
end;

// start object Tl3PtrHash 

function Tl3PtrHash.SetItem(ItemIndex: Long; Action: Tl3FreeAction; const Data): Pointer;
  {-}
begin
 Result := SetBit(ItemIndex, Action, Data, f_MaskSize);
end;

function Tl3PtrHash.GetItem(ItemIndex: Long): Pointer; {Self, CS:IP}
  {-}
begin
 if (f_MaskSize > 0) AND ((ItemIndex shr 5) < f_MaskSize) then
  Result := GetBitData(ItemIndex, f_MaskSize)
 else
  Result := nil; 
end;

procedure Tl3PtrHash.Clear(Action: Tl3IteratorAction); {Self, CS:IP}
  {-}
begin
 inherited Clear(Action, MaskSize);
end;

procedure Tl3PtrHash.DeleteItem(ItemIndex: Long; Action: Tl3FreeAction); {Self, CS:IP}
  { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
begin
 if (f_MaskSize > 0) AND ((ItemIndex shr 5) < f_MaskSize) then
  ClearBit(ItemIndex, Action, f_MaskSize);
end;

function  Tl3PtrHash.CheckItem(ItemIndex: Long): LongBool;
  {-}
begin
 if (f_MaskSize > 0) AND ((ItemIndex shr 5) < f_MaskSize) then
  Result := CheckBit(ItemIndex)
 else
  Result := false;
end;

function Tl3PtrHash.BitCount: Long; {Self, CS:IP }
  {-}
begin
 if (f_MaskSize > 0) then
  Result := inherited BitCount(f_MaskSize)
 else
  Result := 0;
end;

procedure Tl3PtrHash.Store(Action: Tl3IteratorAction); {Self, CS:IP}
  { Action - указатель на локальную процедуру: procedure(P: Pointer; BitNum: Long); far;}
begin
 inherited Store(MaskSize, 1, Action);
end;

procedure Tl3PtrHash.StoreF(Action: Tl3IteratorAction);
  {-}
begin
 try
  Store(Action);
 finally
  l3FreeIA(Action);
 end;//try..finally
end;

procedure Tl3PtrHash.Init;
  {-}
begin
 f_Bits := nil;
 f_MaskSize := 0;
end;

function Tl3PtrHash.MaskSize: Byte;
  {-}
begin
 Result := f_MaskSize;
end;

{$IfNDef l3BorlandMemoryManager}
function Tl3PtrHash.MemAllocated: Long;
  {-}
begin
 Result := inherited MemAllocated(MaskSize, 1);
end;
{$EndIf  l3BorlandMemoryManager}

// start object Tl3LowLevelPtrBitArray

procedure Tl3LowLevelPtrBitArray.AllocBits(var aBits: PAnsiChar; aSize: Cardinal);
  {-}
{$IfDef l3BoxedBitArray}
var
 l_MM : Tl3BoxMemoryManager;
{$EndIf l3BoxedBitArray}
begin
 {$IfDef l3BoxedBitArray}
 l_MM := l3System.GetBoxMM;
 l_MM.GetMem(aBits, aSize);
 {$Else  l3BoxedBitArray}
 g_l3System.GetLocalMem(aBits, aSize);
 {$EndIf l3BoxedBitArray}
end;

procedure Tl3LowLevelPtrBitArray.FreeBits(var aBits: PAnsiChar);
  {-}
{$IfDef l3BoxedBitArray}
var
 l_MM : Tl3BoxMemoryManager;
{$EndIf l3BoxedBitArray}
begin
 {$IfDef l3BoxedBitArray}
 l_MM := l3System.GetBoxMM;
 l_MM.FreeMem(aBits);
 {$Else  l3BoxedBitArray}
 g_l3System.FreeLocalMem(aBits);
 {$EndIf l3BoxedBitArray}
end;

procedure Tl3LowLevelPtrBitArray.ReallocBits(var aBits: PAnsiChar; aNewSize: Cardinal);
  {-}
{$IfDef l3BoxedBitArray}
var
 l_MM : Tl3BoxMemoryManager;
{$EndIf l3BoxedBitArray}
begin
 {$IfDef l3BoxedBitArray}
 l_MM := l3System.GetBoxMM;
 l_MM.ReallocMem(aBits, aNewSize);
 {$Else  l3BoxedBitArray}
 g_l3System.ReallocLocalMem(aBits, aNewSize);
 {$EndIf l3BoxedBitArray}
end;

function Tl3LowLevelPtrBitArray.Empty: Boolean;
  {-}
begin
 Result := (f_Bits = nil);
end;

procedure Tl3LowLevelPtrBitArray.Clear(Action: Tl3IteratorAction; MaskSize: Long);
  {-}
begin
 Store(MaskSize, 1, Action);
 FreeBits(f_Bits);
end;

function Tl3LowLevelPtrBitArray.SetBit(BitNum: Long; Action: Tl3FreeAction; const Data; var MaskSize : Byte): Pointer;
  {-}
const
 l_ElementSize = SizeOf(Long);
var
 i             : Long;
 {$IfDef _l3OldSetBit}
 P             : PAnsiChar;
 {$EndIf _l3OldSetBit}
 NewSize       : Long;
 OldSize       : Long;
 OMS           : Long;
 NMS           : Long;
 CBN           : Long;
begin
 Result := nil;
 if (f_Bits = nil) then
 begin
  MaskSize := Succ(BitNum div 32);
  i := MaskSize * SizeOf(Long);
  NewSize := i + l_ElementSize;
  AllocBits(f_Bits, NewSize);
  l3FillChar(f_Bits^, i, 0);
  Result := f_Bits + i;
  l3Move(Data, Result^, l_ElementSize);
  l3SetBit(f_Bits, BitNum);
 end//f_Bits = nil
 else
 begin
  OMS := MaskSize;
  NMS := Max(OMS, Succ(BitNum div 32));
  if (NMS > OMS) then
  begin
   CBN := Pred(OMS * 32);
   MaskSize := NMS;
   i := l3Bit2Index(f_Bits, CBN);
   if (i >= 0) then
   begin
    Inc(i);
    i := not i;
   end;//i >= 0
  end//NMS > OMS
  else
  begin
   CBN := BitNum;
   i := l3Bit2Index(f_Bits, CBN);
  end;//NMS > OMS
  if (i < 0) then
  begin
   {$IfDef l3BorlandMemoryManager}
   OldSize := MemAllocated;
   {$Else  l3BorlandMemoryManager}
   OldSize := MemAllocated(OMS, 1);
   {$EndIf l3BorlandMemoryManager}
   NewSize := OldSize;
   NMS := NMS * SizeOf(Long);
   i := NMS + (not i) * l_ElementSize;
   Inc(NewSize, l_ElementSize);
   if (CBN = BitNum) then
   begin
    {-вставляем данные в середину}
    {$IfDef _l3OldSetBit}
    AllocBits(P, NewSize);
    l3Move(f_Bits^, P^, i);
    l3Move(f_Bits[i], P[i + l_ElementSize], OldSize - i); {-раздвигаем элементы}
    {$Else  _l3OldSetBit}
    ReallocBits(f_Bits, NewSize); {-перераспределяем память для новых данных}
    l3Move(f_Bits[i], f_Bits[i + l_ElementSize], OldSize - i); {-раздвигаем элементы}
    {$EndIf _l3OldSetBit}
   end//CBN = BitNum
   else
   begin
    {-добавляем данные в конец}
    OMS := OMS * SizeOf(Long);
    Inc(NewSize, NMS);
    Dec(NewSize, OMS);
    {$IfDef _l3OldSetBit}
    AllocBits(P, NewSize);
    l3FillChar(P[OMS], NMS-OMS, 0);
    l3Move(f_Bits^, P^, OMS); {копируем старую маску}
    l3Move(f_Bits[OMS], P[NMS], OldSize - OMS);
    {$Else  _l3OldSetBit}
    ReallocBits(f_Bits, NewSize); {-перераспределяем память для новых данных}
    l3Move(f_Bits[OMS], f_Bits[NMS], OldSize - OMS); {-свигаем данные}
    l3FillChar(f_Bits[OMS], NMS-OMS, 0); {-чистим новое место маски}
    {$EndIf _l3OldSetBit}
   end;
   {$IfDef _l3OldSetBit}
   FreeBits(f_Bits);
   f_Bits := P;
   {$EndIf _l3OldSetBit}
   Result := f_Bits + i;
   l3Move(Data, Result^, l_ElementSize);
   l3SetBit(f_Bits, BitNum);
  end//i < 0
  else
  begin
   Result := f_Bits + MaskSize * SizeOf(Long) + i * l_ElementSize;
   if not Assigned(Action) OR Action(Result) then
    l3Move(Data, Result^, l_ElementSize);
  end;//i < 0
 end;//f_Bits = nil
end;

function Tl3LowLevelPtrBitArray.CheckBit(BitNum: Long): Longbool;
                                     {edx}
  register;
  {-}
asm
       mov     eax, [eax].Tl3LowLevelPtrBitArray.f_Bits
       or      eax, eax
       jz      @@ret

       call    l3CheckBit
@@ret:
end;//asm

function Tl3LowLevelPtrBitArray.GetBitData(BitNum: Long; MaskSize: Long): Pointer;
                                           {edx,    ecx}
  register;
  {-}
(*asm
@@NotNullData:
    mov  eax, [eax].Tl3LowLevelPtrBitArray.f_Bits
    or   eax, eax
    jz   @@ret

    push eax
    push ecx
    call l3Bit2Index
    or   eax, eax
    jnl  @@BitSet

    pop  eax
    pop  eax
    xor  eax, eax
    jmp  @@ret

@@BitSet:
    pop  ecx
    pop  edx
    add  eax, ecx
    shl  eax, 2
    add  eax, edx

@@ret:
end;//asm
*)
var
 i : Long;
begin
 Result := nil;
 if (f_Bits <> nil) then
 begin
  i := l3Bit2Index(f_Bits, BitNum);
  if (i < 0) then Exit;
  Result := f_Bits + (MaskSize + i) * SizeOf(Long);
 end;//f_Bits <> nil
end;

procedure Tl3LowLevelPtrBitArray.ClearBit(BitNum: Long; Action: Tl3FreeAction; var MaskSize: Byte);
  {-}
const
 l_ElementSize = SizeOf(Long);
var
 i                 : Long;
 l_MaskSizeInBytes : Long;
 {$IfDef _l3OldClearBit}
 P                 : PAnsiChar;
 {$EndIf _l3OldClearBit}
 OldSize           : Long;
 NewSize           : Long;
begin
 {$IfDef l3BorlandMemoryManager}
 OldSize := MemAllocated;
 {$Else  l3BorlandMemoryManager}
 OldSize := MemAllocated(MaskSize, 1);
 {$EndIf l3BorlandMemoryManager}
 NewSize := OldSize;
 if (f_Bits <> nil) then
 begin
  i := l3Bit2Index(f_Bits, BitNum);    {-ищем данные для бита BitNum}
  if (i < 0) then Exit;                {-данных нет - выходим}
  l_MaskSizeInBytes := Long(MaskSize) * SizeOf(Long);
  i := i * l_ElementSize;
  Inc(i, l_MaskSizeInBytes);   {-получаем смещение до элемента данных}
  Dec(NewSize, l_ElementSize); {-новые данные - на размер одного элемента меньше}
  {$IfDef _l3OldClearBit}
  P := f_Bits + i;             {-P - указатель на данные бита BitNum}
  if Assigned(Action) then Action(P);
  {$Else  _l3OldClearBit}
  if Assigned(Action) then Action(f_Bits + i);
  {$EndIf _l3OldClearBit}
  if (NewSize = l_MaskSizeInBytes) then
  begin
   MaskSize := 0;
   FreeBits(f_Bits);
  end//NewSize = l_MaskSizeInBytes
  else
  begin
   {$IfDef _l3OldClearBit}
   AllocBits(P, NewSize);
   l3Move(f_Bits^, P^, i);
   l3Move(f_Bits[i + l_ElementSize], P[i], OldSize - i - l_ElementSize);
   FreeBits(f_Bits);
   f_Bits := P;
   {$Else  _l3OldClearBit}
   l3Move(f_Bits[i + l_ElementSize], f_Bits[i], OldSize - i - l_ElementSize); {-сдвигаем элементы}
   ReallocBits(f_Bits, NewSize);
   {$EndIf _l3OldClearBit}
   l3ClearBit(f_Bits, BitNum);
  end;//NewSize = l_MaskSizeInBytes
 end;//f_Bits <> nil
end;

{$IfDef l3BorlandMemoryManager}
function Tl3LowLevelPtrBitArray.MemAllocated: Long;
  {-}
{$IfDef l3BoxedBitArray}
var
 l_MM : Tl3BoxMemoryManager;
{$EndIf l3BoxedBitArray}
begin
 {$IfDef l3BoxedBitArray}
 l_MM := l3System.GetBoxMM;
 Result := l_MM.GetSize(f_Bits);
 {$Else  l3BoxedBitArray}
 Result := l3MemorySize(f_Bits);
 {$EndIf l3BoxedBitArray}
end;
{$Else  l3BorlandMemoryManager}
function Tl3LowLevelPtrBitArray.MemAllocated(MaskSize, DataSize: Long): Long;
  register;
  {-}                                    {edx,      ecx}
asm
       mov     eax, [eax].Tl3LowLevelPtrBitArray.f_Bits
       or      eax, eax
       jz      @@ret

       push    edx
       push    ecx

       shl     edx, 5
{       dec     edx}
{!!!}
       call    l3Bit2Index
       or      eax, eax
       jge     @@1
       not     eax
@@1:
       pop     ecx
       mul     ecx
       pop     ecx
       add     eax, ecx
       shl     eax, 2
@@ret:
end;//asm
{$EndIf l3BorlandMemoryManager}

function Tl3LowLevelPtrBitArray.BitCount(MaskSize: Long): Long;
  register;
  {-}                                {edx}
asm
       mov     eax, [eax].Tl3LowLevelPtrBitArray.f_Bits
       or      eax, eax
       jz      @@ret

       shl     edx, 5
{       dec     edx}
{!!!}
       call    l3Bit2Index
       or      eax, eax
       jge     @@ret
       not     eax
@@ret:
end;//asm

procedure Tl3LowLevelPtrBitArray.Store(MaskSize: Long; DataSize: Long; Action: Tl3IteratorAction);
                                       {edx,      ecx}
  register;
  {-}
  { Action - указатель на локальную процедуру: procedure(P: Pointer; BitNum: Long); far;}
var
 OldEBX : Long;
asm
       mov     OldEBX, ebx

       mov     ebx, Action
       or      ebx, ebx
       jz      @@ret1

       push    edi
       mov     edi, [eax].Tl3LowLevelPtrBitArray.f_Bits

       or      edi, edi
       jz      @@ret2

       push    esi
       mov     esi, edi           { f_Bits -> esi             }

@@next11:
       or      ecx, ecx           { DataSize = 0 ?            }
       jz      @@ret3             { then @@ret3               }

       mov     ebx, ecx           { DataSize -> ebx           }
       shl     ebx, 2             { ebx *= 4                  }
       mov     ecx, edx           { MaskSize -> ecx           }
       shl     edx, 2             { edx *= 4                  }
       add     edi, edx           { edi - pointer to bit data }
       cld                        { look forward              }
       xor     edx, edx           { edx - bit num counter     }
@@lp:                             {-цикл по словам            }
       push    ecx
       lodsd
       mov     ecx, 32
@@blp:                            {-цикл по битам             }
       push    ecx
       sub     ecx, 32
       neg     ecx
       bt      eax, ecx
       jnc     @@1

       pushad
       mov     eax, edi
       mov     ebx, OldEBX
       call    Action
       popad

       add     edi, ebx
@@1:
       pop     ecx
       inc     edx
       loop    @@blp
       pop     ecx
       loop    @@lp
@@ret3:       
       pop     esi
@@ret2:
       pop     edi
@@ret1:
       mov     ebx, OldEBX
end;//asm

// start object Tl3OneBytePtrHash

function Tl3OneBytePtrHash.MaskSize: Byte;
  {-}
begin
 if (f_Bits = nil) then
  Result := 0
 else
  Result := 1;
end;

function Tl3OneBytePtrHash.SetItem(ItemIndex: Long; Action: Tl3FreeAction; const Data): Pointer;
  {-}
var
 l_MS : Byte;
begin
 l_MS := MaskSize;
 Result := SetBit(ItemIndex, Action, Data, l_MS);
 Assert(l_MS <= 1);
end;

function Tl3OneBytePtrHash.GetItem(ItemIndex: Long): Pointer; {Self, CS:IP}
  {-}
var
 l_MS : Byte;
begin
 l_MS := MaskSize;
 if (l_MS > 0) AND ((ItemIndex shr 5) < l_MS) then
  Result := GetBitData(ItemIndex, l_MS)
 else
  Result := nil;
end;

procedure Tl3OneBytePtrHash.Clear(Action: Tl3IteratorAction); {Self, CS:IP}
  {-}
begin
 inherited Clear(Action, MaskSize);
end;

procedure Tl3OneBytePtrHash.DeleteItem(ItemIndex: Long; Action: Tl3FreeAction); {Self, CS:IP}
  { Action - указатель на локальную процедуру: procedure(P: Pointer); far;}
var
 l_MS : Byte;
begin
 l_MS := MaskSize;
 if (l_MS > 0) AND ((ItemIndex shr 5) < l_MS) then
  ClearBit(ItemIndex, Action, l_MS);
 Assert(l_MS <= 1);
end;

function  Tl3OneBytePtrHash.CheckItem(ItemIndex: Long): LongBool;
  {-}
var
 l_MS : Byte;
begin
 l_MS := MaskSize;
 if (l_MS > 0) AND ((ItemIndex shr 5) < l_MS) then
  Result := CheckBit(ItemIndex)
 else
  Result := false;
end;

function Tl3OneBytePtrHash.BitCount: Long; {Self, CS:IP }
  {-}
var
 l_MS : Byte;
begin
 l_MS := MaskSize;
 if (l_MS > 0) then
  Result := inherited BitCount(l_MS)
 else
  Result := 0;
end;

procedure Tl3OneBytePtrHash.Store(Action: Tl3IteratorAction); {Self, CS:IP}
  { Action - указатель на локальную процедуру: procedure(P: Pointer; BitNum: Long); far;}
begin
 inherited Store(MaskSize, 1, Action);
end;

procedure Tl3OneBytePtrHash.StoreF(Action: Tl3IteratorAction);
  {-}
begin
 try
  Store(Action);
 finally
  l3FreeIA(Action);
 end;//try..finally
end;

procedure Tl3OneBytePtrHash.Init;
  {-}
begin
 f_Bits := nil;
end;

{$IfNDef l3BorlandMemoryManager}
function Tl3OneBytePtrHash.MemAllocated: Long;
  {-}
begin
 Result := inherited MemAllocated(MaskSize, 1);
end;
{$EndIf  l3BorlandMemoryManager}

end.

