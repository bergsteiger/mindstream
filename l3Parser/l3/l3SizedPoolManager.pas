unit l3SizedPoolManager;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3SimpleMemoryManager
  ;

type
 Tl3SizedPoolManager = class(Tl3SimpleMemoryManager)
 protected
 // protected fields
   f_ItemSize : Cardinal;
 public
 // public methods
   constructor Create(aBlockSize: Cardinal;
     anItemSize: Cardinal); reintroduce;
   procedure AllocItem(var theItem;
     aLength: Cardinal);
   procedure FreeItem(var theItem);
   class function ItemLength(anItem: Pointer): Integer;
 end;//Tl3SizedPoolManager

implementation

// start class Tl3SizedPoolManager

constructor Tl3SizedPoolManager.Create(aBlockSize: Cardinal;
  anItemSize: Cardinal);
//#UC START# *54B90FFB019F_545A25F5016C_var*
//#UC END# *54B90FFB019F_545A25F5016C_var*
begin
//#UC START# *54B90FFB019F_545A25F5016C_impl*
 inherited Create(Longword(Int64(aBlockSize) * Int64(anItemSize))); // Int64 нужен, чтобы `dcc32.exe` не выдавал ошибку `C13310`. 
 f_ItemSize := anItemSize;
//#UC END# *54B90FFB019F_545A25F5016C_impl*
end;//Tl3SizedPoolManager.Create

procedure Tl3SizedPoolManager.AllocItem(var theItem;
  aLength: Cardinal);
//#UC START# *54B9101F0107_545A25F5016C_var*
//#UC END# *54B9101F0107_545A25F5016C_var*
begin
//#UC START# *54B9101F0107_545A25F5016C_impl*
 GetMem(theItem, aLength * f_ItemSize + SizeOf(aLength));
 PInteger(theItem)^ := aLength;
 Inc(PAnsiChar(theItem), SizeOf(aLength));
//#UC END# *54B9101F0107_545A25F5016C_impl*
end;//Tl3SizedPoolManager.AllocItem

procedure Tl3SizedPoolManager.FreeItem(var theItem);
//#UC START# *54B9105402AC_545A25F5016C_var*
//#UC END# *54B9105402AC_545A25F5016C_var*
begin
//#UC START# *54B9105402AC_545A25F5016C_impl*
 FreeMem(theItem);
//#UC END# *54B9105402AC_545A25F5016C_impl*
end;//Tl3SizedPoolManager.FreeItem

class function Tl3SizedPoolManager.ItemLength(anItem: Pointer): Integer;
//#UC START# *54B9107602B0_545A25F5016C_var*
//#UC END# *54B9107602B0_545A25F5016C_var*
begin
//#UC START# *54B9107602B0_545A25F5016C_impl*
 if (anItem = nil) then
  Result := 0
 else
  Result := PInteger(PAnsiChar(anItem) - SizeOf(Result))^;
//#UC END# *54B9107602B0_545A25F5016C_impl*
end;//Tl3SizedPoolManager.ItemLength

end.