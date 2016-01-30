unit l3MemUtils;
{$Include l3Define.inc}

interface

uses
  Windows,
  Refcounted
  ;

type
 Rl3MemUtils = class of Tl3MemUtils;

 Tl3MemUtils = class(TRefcounted)
 protected
 // protected methods
   class procedure CheckMaxes; virtual;
     {* Сигнатура метода CheckMaxes }
   class procedure StatMemAlloc(aSize: Integer;
     aL3: Boolean); virtual;
   class procedure DownBegins;
 public
 // public methods
   class procedure ReallocLocalMem(var P;
     NewSize: Cardinal);
     {* перераспределить кусок локальной памяти }
   class procedure FreeLocalMem(var P);
     {* освободить кусок локальной памяти }
   class function IsDown: Boolean;
   class procedure GetLocalMem(var P;
     Size: Cardinal);
   class procedure GetLocalMemZ(var P;
     Size: Cardinal);
   class function GlobalSize(aMem: THandle): Cardinal; overload; 
   class function GlobalSize(aMem: Pointer): Cardinal; overload; 
   class function GlobalFreePtr(var Mem: Pointer): THandle;
   class function GlobalAllocPtr(Bytes: Integer): Pointer;
 end;//Tl3MemUtils

var
   l3MemU : Rl3MemUtils = Tl3MemUtils;
var
   f_LocalMemUsed : Integer = 0;
var
   f_GlobalMemUsed : Integer = 0;

implementation

uses
  l3MemorySizeUtils,
  l3Interlocked
  ;

var
   g_IsDown : Boolean = false;

// start class Tl3MemUtils

class procedure Tl3MemUtils.ReallocLocalMem(var P;
  NewSize: Cardinal);
//#UC START# *51DD561502D9_51DD554C0205_var*
{$IfDef XE}
 {$Define XECheck}
{$EndIf XE}

{$IfDef XECheck}
type
 PLong = ^Integer;
var
 l_Old : AnsiChar;
 l_OldSize : Integer;
 l_OldBorder : Integer;
{$EndIf XECheck}
//#UC END# *51DD561502D9_51DD554C0205_var*
begin
//#UC START# *51DD561502D9_51DD554C0205_impl*
 l3InterlockedExchangeAdd(f_LocalMemUsed, -l3MemorySize(Pointer(P)));
 {$IfDef l3DirectUseSystemMemManager}
 if (Pointer(P) = nil) then
 begin
  l3MemU.StatMemAlloc(NewSize, true);
  Pointer(P) := SysGetMem(NewSize)
 end//Pointer(P) = nil
 else
 if (NewSize > 0) then
 begin
  l3MemU.StatMemAlloc(NewSize, true);
  Pointer(P) := SysReallocMem(Pointer(P), NewSize);
 end//NewSize > 0
 else
 begin
  SysFreeMem(Pointer(P));
  Pointer(P) := nil;
 end;//NewSize > 0
 {$Else  l3DirectUseSystemMemManager}
 {$IfDef XECheck}
 if (Pointer(P) <> nil) then
 begin
  l_OldSize := l3MemorySize(Pointer(P));
  l_Old := PAnsiChar(P)^;
  l_OldBorder := 0;
  if (l_OldSize > 4) then
   l_OldBorder := PLong(PAnsiChar(P) + l_OldSize - 4)^;
  System.ReallocMem(Pointer(P), NewSize);
  if (NewSize = 0) then
   Assert(Pointer(P) = nil)
  else
  begin
   Assert(PAnsiChar(P)^ = l_Old);
   if (NewSize > l_OldSize) then
   begin
    if (PLong(PAnsiChar(P) + l_OldSize - 4)^ <> l_OldBorder) then
    begin
     assert(false, 'Emba epic fail');
     PLong(PAnsiChar(P) + l_OldSize - 4)^ := l_OldBorder;
    end;
   end;//NewSize > l_OldSize
  end;//NewSize = 0
 end//P <> nil
 else
 {$EndIf XECheck}
  System.ReallocMem(Pointer(P), NewSize);
 {$EndIf l3DirectUseSystemMemManager}
 NewSize := l3MemorySize(Pointer(P));
 l3InterlockedExchangeAdd(f_LocalMemUsed, NewSize);
 l3MemU.CheckMaxes;
//#UC END# *51DD561502D9_51DD554C0205_impl*
end;//Tl3MemUtils.ReallocLocalMem

class procedure Tl3MemUtils.FreeLocalMem(var P);
//#UC START# *51DD62110253_51DD554C0205_var*
//#UC END# *51DD62110253_51DD554C0205_var*
begin
//#UC START# *51DD62110253_51DD554C0205_impl*
 if (Pointer(P) <> nil) then
 begin
  l3InterlockedExchangeAdd(f_LocalMemUsed, -l3MemorySize(Pointer(P)));
  {$IfDef l3DirectUseSystemMemManager}
  SysFreeMem(Pointer(P));
  {$Else  l3DirectUseSystemMemManager}
  System.FreeMem(Pointer(P));
  {$EndIf l3DirectUseSystemMemManager}
 end;//Pointer(P) <> nil
 Pointer(P) := nil;
//#UC END# *51DD62110253_51DD554C0205_impl*
end;//Tl3MemUtils.FreeLocalMem

class procedure Tl3MemUtils.CheckMaxes;
//#UC START# *51DD686A03A3_51DD554C0205_var*
//#UC END# *51DD686A03A3_51DD554C0205_var*
begin
//#UC START# *51DD686A03A3_51DD554C0205_impl*
 // - ничего пока не делаем
//#UC END# *51DD686A03A3_51DD554C0205_impl*
end;//Tl3MemUtils.CheckMaxes

class procedure Tl3MemUtils.StatMemAlloc(aSize: Integer;
  aL3: Boolean);
//#UC START# *51DD6DCE00DF_51DD554C0205_var*
//#UC END# *51DD6DCE00DF_51DD554C0205_var*
begin
//#UC START# *51DD6DCE00DF_51DD554C0205_impl*
 // - ничего пока не делаем
//#UC END# *51DD6DCE00DF_51DD554C0205_impl*
end;//Tl3MemUtils.StatMemAlloc

class function Tl3MemUtils.IsDown: Boolean;
//#UC START# *545CF2260294_51DD554C0205_var*
//#UC END# *545CF2260294_51DD554C0205_var*
begin
//#UC START# *545CF2260294_51DD554C0205_impl*
 Result := g_IsDown;
//#UC END# *545CF2260294_51DD554C0205_impl*
end;//Tl3MemUtils.IsDown

class procedure Tl3MemUtils.DownBegins;
//#UC START# *545CF241012F_51DD554C0205_var*
//#UC END# *545CF241012F_51DD554C0205_var*
begin
//#UC START# *545CF241012F_51DD554C0205_impl*
 g_IsDown := true;
//#UC END# *545CF241012F_51DD554C0205_impl*
end;//Tl3MemUtils.DownBegins

class procedure Tl3MemUtils.GetLocalMem(var P;
  Size: Cardinal);
//#UC START# *54B6A7D401EA_51DD554C0205_var*
//#UC END# *54B6A7D401EA_51DD554C0205_var*
begin
//#UC START# *54B6A7D401EA_51DD554C0205_impl*
 {$IfDef l3DirectUseSystemMemManager}
 l3MemU.StatMemAlloc(Size, true);
 Pointer(P) := SysGetMem(Size);
 {$Else  l3DirectUseSystemMemManager}
 System.GetMem(Pointer(P), Size);
 {$EndIf l3DirectUseSystemMemManager}
 Size := l3MemorySize(Pointer(P));
 l3InterlockedExchangeAdd(l3MemUtils.f_LocalMemUsed, Size);
 l3MemU.CheckMaxes;
//#UC END# *54B6A7D401EA_51DD554C0205_impl*
end;//Tl3MemUtils.GetLocalMem

class procedure Tl3MemUtils.GetLocalMemZ(var P;
  Size: Cardinal);
//#UC START# *54B6A7FE02E7_51DD554C0205_var*
//#UC END# *54B6A7FE02E7_51DD554C0205_var*
begin
//#UC START# *54B6A7FE02E7_51DD554C0205_impl*
 GetLocalMem(P, Size);
 //l3ZeroMemory(Pointer(P), Size);
 System.FillChar(Pointer(P)^, Size, 0);
//#UC END# *54B6A7FE02E7_51DD554C0205_impl*
end;//Tl3MemUtils.GetLocalMemZ

class function Tl3MemUtils.GlobalSize(aMem: THandle): Cardinal;
//#UC START# *54B9291A01AE_51DD554C0205_var*
//#UC END# *54B9291A01AE_51DD554C0205_var*
begin
//#UC START# *54B9291A01AE_51DD554C0205_impl*
 Result := Windows.GlobalSize(aMem);
//#UC END# *54B9291A01AE_51DD554C0205_impl*
end;//Tl3MemUtils.GlobalSize

class function Tl3MemUtils.GlobalSize(aMem: Pointer): Cardinal;
//#UC START# *54B9293E006D_51DD554C0205_var*
//#UC END# *54B9293E006D_51DD554C0205_var*
begin
//#UC START# *54B9293E006D_51DD554C0205_impl*
 Result := GlobalSize(GlobalHandle(aMem));
//#UC END# *54B9293E006D_51DD554C0205_impl*
end;//Tl3MemUtils.GlobalSize

class function Tl3MemUtils.GlobalFreePtr(var Mem: Pointer): THandle;
//#UC START# *54B929840238_51DD554C0205_var*
var
 Sz : LongInt;
//#UC END# *54B929840238_51DD554C0205_var*
begin
//#UC START# *54B929840238_51DD554C0205_impl*
 if (Mem <> nil) then
 begin
  Sz := GlobalSize(GlobalHandle(Mem));
  Result := Windows.GlobalFreePtr(Mem);
  if (Result = 0) then
  begin
   l3InterlockedExchangeAdd(f_GlobalMemUsed, -Sz);
   Mem := nil;
  end;
 end//Mem <> nil
 else
  Result := 0;
//#UC END# *54B929840238_51DD554C0205_impl*
end;//Tl3MemUtils.GlobalFreePtr

class function Tl3MemUtils.GlobalAllocPtr(Bytes: Integer): Pointer;
//#UC START# *54B929E501F5_51DD554C0205_var*
var
 Sz : LongInt;
//#UC END# *54B929E501F5_51DD554C0205_var*
begin
//#UC START# *54B929E501F5_51DD554C0205_impl*
 Result := Windows.GlobalAllocPtr(gmem_Fixed, Bytes);
 if (Result = nil) then
  Exit;
 Assert(Result <> nil);
 Sz := GlobalSize(GlobalHandle(Result));
 l3InterlockedExchangeAdd(f_GlobalMemUsed, Sz);
 l3MemU.CheckMaxes;
//#UC END# *54B929E501F5_51DD554C0205_impl*
end;//Tl3MemUtils.GlobalAllocPtr

end.