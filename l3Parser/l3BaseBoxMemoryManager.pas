unit l3BaseBoxMemoryManager;

{$Include l3Define.inc}

interface

uses
  l3SimpleMemoryManager
  ;

type
 Tl3BaseBoxMemoryManager = {abstract} class(Tl3SimpleMemoryManager)
 private
 // private fields
   f_Lost : Integer;
 protected
 // overridden protected methods
   procedure FreeBlocks; override;
     {* Сигнатура метода FreeBlocks }
   procedure DoGetMem(var P;
     aSize: Cardinal); override;
   procedure DoFreeMem(var P); override;
 protected
 // protected methods
   function SizeSize: Cardinal; virtual; abstract;
   function Size2Index(aSize: Cardinal): Integer; virtual; abstract;
   function AlignSize(aSize: Cardinal): Cardinal; virtual; abstract;
   function GetPSz(aPt: PAnsiChar): Cardinal; virtual; abstract;
   procedure SetPSz(aPt: PAnsiChar;
     aValue: Cardinal); virtual; abstract;
   function HasFreed: Boolean; virtual; abstract;
   procedure InitFreed; virtual; abstract;
     {* Сигнатура метода InitFreed }
   procedure ClearFreed; virtual; abstract;
     {* Сигнатура метода ClearFreed }
   function IsValidIndex(anIndex: Integer): Boolean; virtual; abstract;
   function GetFreed(anIndex: Integer): Pointer; virtual; abstract;
   procedure SetFreed(anIndex: Integer;
     aValue: Pointer); virtual; abstract;
 public
 // public methods
   constructor Create(aBlockSize: Cardinal); reintroduce;
     {* создает менеджер }
   function GetSize(aPt: Pointer): Cardinal;
   procedure ReallocMem(var P;
     aNewSize: Cardinal);
 end;//Tl3BaseBoxMemoryManager

implementation

uses
  l3MinMax
  ;

// start class Tl3BaseBoxMemoryManager

constructor Tl3BaseBoxMemoryManager.Create(aBlockSize: Cardinal);
//#UC START# *54B6A1AA02CE_54B69F9700DE_var*
//#UC END# *54B6A1AA02CE_54B69F9700DE_var*
begin
//#UC START# *54B6A1AA02CE_54B69F9700DE_impl*
 inherited Create(aBlockSize);
//#UC END# *54B6A1AA02CE_54B69F9700DE_impl*
end;//Tl3BaseBoxMemoryManager.Create

function Tl3BaseBoxMemoryManager.GetSize(aPt: Pointer): Cardinal;
//#UC START# *54B6A1D30099_54B69F9700DE_var*
//#UC END# *54B6A1D30099_54B69F9700DE_var*
begin
//#UC START# *54B6A1D30099_54B69F9700DE_impl*
 if (aPt = nil) then
  Result := 0
 else
  Result := GetPSz(PAnsiChar(aPt) - SizeSize);
//#UC END# *54B6A1D30099_54B69F9700DE_impl*
end;//Tl3BaseBoxMemoryManager.GetSize

procedure Tl3BaseBoxMemoryManager.ReallocMem(var P;
  aNewSize: Cardinal);
//#UC START# *54B6A25901A2_54B69F9700DE_var*
var
 l_OldSz : Integer;
 l_NewSz : Integer;
 l_OldPt : Pointer;
 l_NewPt : Pointer;
//#UC END# *54B6A25901A2_54B69F9700DE_var*
begin
//#UC START# *54B6A25901A2_54B69F9700DE_impl*
 Self.Lock;
 try
  l_OldSz := GetSize(Pointer(P));
  l_NewSz := AlignSize(aNewSize);
  if (l_OldSz <> l_NewSz) then
  begin
   l_OldPt := Pointer(P);
   GetMem(l_NewPt, l_NewSz);
   Pointer(P) := l_NewPt;
   if (l_OldPt <> nil) then
    System.Move(l_OldPt^, l_NewPt^, Min(l_OldSz, l_NewSz));
    //l3Move(l_OldPt^, l_NewPt^, Min(l_OldSz, l_NewSz));
   FreeMem(l_OldPt);
  end;//l_OldSz <> l_NewSz
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *54B6A25901A2_54B69F9700DE_impl*
end;//Tl3BaseBoxMemoryManager.ReallocMem

procedure Tl3BaseBoxMemoryManager.FreeBlocks;
//#UC START# *54B69FF202FB_54B69F9700DE_var*
//#UC END# *54B69FF202FB_54B69F9700DE_var*
begin
//#UC START# *54B69FF202FB_54B69F9700DE_impl*
 ClearFreed;
 inherited;
//#UC END# *54B69FF202FB_54B69F9700DE_impl*
end;//Tl3BaseBoxMemoryManager.FreeBlocks

procedure Tl3BaseBoxMemoryManager.DoGetMem(var P;
  aSize: Cardinal);
//#UC START# *54B6A20201D7_54B69F9700DE_var*
var
 l_Index : Integer;
 l_Sz    : Cardinal;
//#UC END# *54B6A20201D7_54B69F9700DE_var*
begin
//#UC START# *54B6A20201D7_54B69F9700DE_impl*
 if (aSize = 0) then
  Pointer(P) := nil
 else
 begin
  l_Index := Size2Index(aSize);
  Assert(IsValidIndex(l_Index), 'Запрошен  неверный размер куска памяти Tl3BaseBoxMemoryManager.DoGetMem');
  if HasFreed AND IsValidIndex(l_Index) then
  begin
   Pointer(P) := GetFreed(l_Index);
   if (Pointer(P) <> nil) then
   begin
    // - удалось взять освобожденный кусок
    Inc(f_AllocCount);
    // - увеличиваем число взятых кусков
    SetFreed(l_Index, PPointer(P)^);
    // - указываем на другой освобожденный
    Exit;
    // - выходим, т.к уже все выделили
   end
   else
    l_Sz := AlignSize(aSize);
    // - надо выровнять размер куска
  end
  else
   l_Sz := aSize; 
  Inc(l_Sz, SizeSize);
  // - резервируем место под размер
  inherited DoGetMem(P, l_Sz);
  SetPSz(PAnsiChar(P), l_Sz - SizeSize);
  Inc(PAnsiChar(P), SizeSize);
  // - сдвигаем на размер размера куска 
 end;//l_Sz = 0
//#UC END# *54B6A20201D7_54B69F9700DE_impl*
end;//Tl3BaseBoxMemoryManager.DoGetMem

procedure Tl3BaseBoxMemoryManager.DoFreeMem(var P);
//#UC START# *54B6A22902AB_54B69F9700DE_var*
var
 l_Sz    : Integer;
 l_Index : Integer;
//#UC END# *54B6A22902AB_54B69F9700DE_var*
begin
//#UC START# *54B6A22902AB_54B69F9700DE_impl*
 if (Pointer(P) = nil) then
  Exit;
 l_Sz := GetSize(Pointer(P));
 if (l_Sz > 0) then
 begin
  // - если действительно что-то освобождаем
  l_Index := Size2Index(l_Sz);
  // - вычисляем индекс в массиве уже освобожденных
  if IsValidIndex(l_Index) then
  begin
   // - надо положить этот кусок в массив освобожденных
   InitFreed;
   PPointer(P)^ := GetFreed(l_Index);
   SetFreed(l_Index, Pointer(P));
  end
  else
  begin
   Inc(f_Lost);
   Assert(false, 'Коробка создана неправильно Tl3BaseBoxMemoryManager.DoFreeMem');
  end;//IsValidIndex(l_Index)
 end;//l_Sz > 0
 Dec(PAnsiChar(P), SizeSize);
 // - сдвигаем на размер размера куска
 inherited DoFreeMem(P);
//#UC END# *54B6A22902AB_54B69F9700DE_impl*
end;//Tl3BaseBoxMemoryManager.DoFreeMem

end.