unit l3BoxMemoryManagerPrim;

{$Include l3Define.inc}

interface

uses
  l3BaseBoxMemoryManager
  ;

type
 Tl3BoxMemoryManagerPrim = class(Tl3BaseBoxMemoryManager)
 private
 // private fields
   f_Freed : PAnsiChar;
   f_LowIndex : Integer;
   f_HighIndex : Integer;
   f_SizeSize : Cardinal;
 protected
 // realized methods
   function SizeSize: Cardinal; override;
   function Size2Index(aSize: Cardinal): Integer; override;
   function AlignSize(aSize: Cardinal): Cardinal; override;
   function GetPSz(aPt: PAnsiChar): Cardinal; override;
   procedure SetPSz(aPt: PAnsiChar;
     aValue: Cardinal); override;
   function HasFreed: Boolean; override;
   procedure InitFreed; override;
     {* Сигнатура метода InitFreed }
   procedure ClearFreed; override;
     {* Сигнатура метода ClearFreed }
   function IsValidIndex(anIndex: Integer): Boolean; override;
   function GetFreed(anIndex: Integer): Pointer; override;
   procedure SetFreed(anIndex: Integer;
     aValue: Pointer); override;
 public
 // public methods
   constructor Create(aBlockSize: Integer;
     aHighIndex: Integer = 8;
     aLowIndex: Integer = 0); reintroduce;
 end;//Tl3BoxMemoryManagerPrim

implementation

uses
  l3MinMax,
  l3MemUtils
  ;

const
   { Constants }
  cStep = 4;

// start class Tl3BoxMemoryManagerPrim

constructor Tl3BoxMemoryManagerPrim.Create(aBlockSize: Integer;
  aHighIndex: Integer = 8;
  aLowIndex: Integer = 0);
//#UC START# *54B6A30003E2_54B69FAC0256_var*
//#UC END# *54B6A30003E2_54B69FAC0256_var*
begin
//#UC START# *54B6A30003E2_54B69FAC0256_impl*
 inherited Create(aBlockSize);
 f_SizeSize := 1;
 f_LowIndex := aLowIndex;
 f_HighIndex := aHighIndex;
//#UC END# *54B6A30003E2_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.Create

function Tl3BoxMemoryManagerPrim.SizeSize: Cardinal;
//#UC START# *54B6A043017E_54B69FAC0256_var*
//#UC END# *54B6A043017E_54B69FAC0256_var*
begin
//#UC START# *54B6A043017E_54B69FAC0256_impl*
 Result := f_SizeSize;
//#UC END# *54B6A043017E_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.SizeSize

function Tl3BoxMemoryManagerPrim.Size2Index(aSize: Cardinal): Integer;
//#UC START# *54B6A06A00AF_54B69FAC0256_var*
//#UC END# *54B6A06A00AF_54B69FAC0256_var*
begin
//#UC START# *54B6A06A00AF_54B69FAC0256_impl*
 Result := ((aSize - 1) div cStep) - 1;
//#UC END# *54B6A06A00AF_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.Size2Index

function Tl3BoxMemoryManagerPrim.AlignSize(aSize: Cardinal): Cardinal;
//#UC START# *54B6A0850253_54B69FAC0256_var*
//#UC END# *54B6A0850253_54B69FAC0256_var*
begin
//#UC START# *54B6A0850253_54B69FAC0256_impl*
 Result := (((aSize - 1) div cStep) + 1) * cStep;
//#UC END# *54B6A0850253_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.AlignSize

function Tl3BoxMemoryManagerPrim.GetPSz(aPt: PAnsiChar): Cardinal;
//#UC START# *54B6A0A50097_54B69FAC0256_var*
//#UC END# *54B6A0A50097_54B69FAC0256_var*
begin
//#UC START# *54B6A0A50097_54B69FAC0256_impl*
 Case SizeSize of
  1: Result := PByte(aPt)^;
  2: Result := PWord(aPt)^;
  4: Result := PInteger(aPt)^;
  else
  begin
   Result := 0;
   Assert(false);
  end;//else
 end;//Case SizeSize
//#UC END# *54B6A0A50097_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.GetPSz

procedure Tl3BoxMemoryManagerPrim.SetPSz(aPt: PAnsiChar;
  aValue: Cardinal);
//#UC START# *54B6A0F1005C_54B69FAC0256_var*
//#UC END# *54B6A0F1005C_54B69FAC0256_var*
begin
//#UC START# *54B6A0F1005C_54B69FAC0256_impl*
 Case SizeSize of
  1: PByte(aPt)^ := aValue;
  2: PWord(aPt)^ := aValue;
  4: PInteger(aPt)^ := aValue;
  else
   Assert(false);
 end;//Case SizeSize
//#UC END# *54B6A0F1005C_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.SetPSz

function Tl3BoxMemoryManagerPrim.HasFreed: Boolean;
//#UC START# *54B6A11301EC_54B69FAC0256_var*
//#UC END# *54B6A11301EC_54B69FAC0256_var*
begin
//#UC START# *54B6A11301EC_54B69FAC0256_impl*
 Result := (f_Freed <> nil);
//#UC END# *54B6A11301EC_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.HasFreed

procedure Tl3BoxMemoryManagerPrim.InitFreed;
//#UC START# *54B6A1290134_54B69FAC0256_var*
//#UC END# *54B6A1290134_54B69FAC0256_var*
begin
//#UC START# *54B6A1290134_54B69FAC0256_impl*
 if (f_Freed = nil) then
  Tl3MemUtils.GetLocalMemZ(f_Freed, (f_HighIndex - f_LowIndex + 1) * SizeOf(Pointer));
//#UC END# *54B6A1290134_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.InitFreed

procedure Tl3BoxMemoryManagerPrim.ClearFreed;
//#UC START# *54B6A138006E_54B69FAC0256_var*
//#UC END# *54B6A138006E_54B69FAC0256_var*
begin
//#UC START# *54B6A138006E_54B69FAC0256_impl*
 Tl3MemUtils.FreeLocalMem(f_Freed);
//#UC END# *54B6A138006E_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.ClearFreed

function Tl3BoxMemoryManagerPrim.IsValidIndex(anIndex: Integer): Boolean;
//#UC START# *54B6A14B000C_54B69FAC0256_var*
//#UC END# *54B6A14B000C_54B69FAC0256_var*
begin
//#UC START# *54B6A14B000C_54B69FAC0256_impl*
 Result := (anIndex >= f_LowIndex) AND (anIndex <= f_HighIndex); 
//#UC END# *54B6A14B000C_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.IsValidIndex

function Tl3BoxMemoryManagerPrim.GetFreed(anIndex: Integer): Pointer;
//#UC START# *54B6A16703DD_54B69FAC0256_var*
//#UC END# *54B6A16703DD_54B69FAC0256_var*
begin
//#UC START# *54B6A16703DD_54B69FAC0256_impl*
 Result := PPointer(f_Freed + (anIndex - f_LowIndex) * SizeOf(Pointer))^;
//#UC END# *54B6A16703DD_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.GetFreed

procedure Tl3BoxMemoryManagerPrim.SetFreed(anIndex: Integer;
  aValue: Pointer);
//#UC START# *54B6A1830090_54B69FAC0256_var*
//#UC END# *54B6A1830090_54B69FAC0256_var*
begin
//#UC START# *54B6A1830090_54B69FAC0256_impl*
 PPointer(f_Freed + (anIndex - f_LowIndex) * SizeOf(Pointer))^ := aValue;
//#UC END# *54B6A1830090_54B69FAC0256_impl*
end;//Tl3BoxMemoryManagerPrim.SetFreed

end.