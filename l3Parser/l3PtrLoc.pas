unit l3PtrLoc;

{$Include l3Define.inc}

interface

uses
  l3MemorySizeUtils
  ;

type
 Tl3PtrLoc = {$IfDef XE4}record{$Else}object{$EndIf}
 private
   f_AsPointer : PMem;
 public
    function Init(aSize: Integer): Boolean;
    function GetSize: Integer;
    procedure SetSize(aSize: Integer);
    procedure Clear;
    function Read(anOfs: Integer;
     aBuf: PMem;
     aBufSize: Integer): Integer;
    function Write(anOfs: Integer;
     aBuf: PMem;
     aBufSize: Integer): Integer;
  public
   property AsPointer: PMem
     read f_AsPointer;
 end;//Tl3PtrLoc

implementation

uses
  l3MemUtils
  ;

// start class Tl3PtrLoc

function Tl3PtrLoc.Init(aSize: Integer): Boolean;
//#UC START# *51DD5D1903C3_51DD567A01B5_var*
//#UC END# *51DD5D1903C3_51DD567A01B5_var*
begin
//#UC START# *51DD5D1903C3_51DD567A01B5_impl*
 f_AsPointer := nil;
 SetSize(aSize);
 Result := (f_AsPointer <> nil);
//#UC END# *51DD5D1903C3_51DD567A01B5_impl*
end;//Tl3PtrLoc.Init

function Tl3PtrLoc.GetSize: Integer;
//#UC START# *51DD5D3800F3_51DD567A01B5_var*
//#UC END# *51DD5D3800F3_51DD567A01B5_var*
begin
//#UC START# *51DD5D3800F3_51DD567A01B5_impl*
 Result := l3MemorySize(f_AsPointer);
//#UC END# *51DD5D3800F3_51DD567A01B5_impl*
end;//Tl3PtrLoc.GetSize

procedure Tl3PtrLoc.SetSize(aSize: Integer);
//#UC START# *51DD5D4F004A_51DD567A01B5_var*
//#UC END# *51DD5D4F004A_51DD567A01B5_var*
begin
//#UC START# *51DD5D4F004A_51DD567A01B5_impl*
 if (aSize = 0) then
  l3MemU.FreeLocalMem(f_AsPointer)
 else 
 if (GetSize < aSize) then
 begin
  // - раньше было <> - сейчас решил попробовать не уменьшать размер памяти
  //   дабы не плодить дефрагментацию.
  if (aSize < 10) then
   l3MemU.ReallocLocalMem(f_AsPointer, aSize)
  else
   l3MemU.ReallocLocalMem(f_AsPointer, (aSize + $F) and $FFFFFFF0);
 end;//GetSize < aSize
//#UC END# *51DD5D4F004A_51DD567A01B5_impl*
end;//Tl3PtrLoc.SetSize

procedure Tl3PtrLoc.Clear;
//#UC START# *51DD5D6F0304_51DD567A01B5_var*
//#UC END# *51DD5D6F0304_51DD567A01B5_var*
begin
//#UC START# *51DD5D6F0304_51DD567A01B5_impl*
 SetSize(0);
//#UC END# *51DD5D6F0304_51DD567A01B5_impl*
end;//Tl3PtrLoc.Clear

function Tl3PtrLoc.Read(anOfs: Integer;
  aBuf: PMem;
  aBufSize: Integer): Integer;
//#UC START# *51DD5E2203B0_51DD567A01B5_var*
//#UC END# *51DD5E2203B0_51DD567A01B5_var*
begin
//#UC START# *51DD5E2203B0_51DD567A01B5_impl*
 Result := 0;
 Assert(false, 'Не реализовано пока');
(* Result := Min(GetSize - anOfs, aBufSize);
 if (Result > 0) then
  l3Move((P + anOfs)^, aBuf^, Result)
 else
  Result := 0;*)
//#UC END# *51DD5E2203B0_51DD567A01B5_impl*
end;//Tl3PtrLoc.Read

function Tl3PtrLoc.Write(anOfs: Integer;
  aBuf: PMem;
  aBufSize: Integer): Integer;
//#UC START# *51DD5E5F02E1_51DD567A01B5_var*
(*var
 OldSize : Integer;
 NewSize : Integer;*)
//#UC END# *51DD5E5F02E1_51DD567A01B5_var*
begin
//#UC START# *51DD5E5F02E1_51DD567A01B5_impl*
 Result := 0;
 Assert(false, 'Не реализовано пока');
(* OldSize := GetSize;
 NewSize := Ofs + BufSize;
 if (NewSize > OldSize) then SetSize(NewSize);
 Result := BufSize;
 l3Move(Buf^, (P + Ofs)^, Result);*)
//#UC END# *51DD5E5F02E1_51DD567A01B5_impl*
end;//Tl3PtrLoc.Write

end.