unit l3StringIDEx;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3Types,
  l3ProtoObject,
  l3ProtoDataContainer,
  l3Memory,
  l3Core,
  l3Except,
  Classes
  ;

type
 Tl3StringIDExPrim = object(Tl3StringID)
 public
   rLocalized : Boolean; // Строка локализована
 end;//Tl3StringIDExPrim

 Tl3StringIDEx = object(Tl3StringIDExPrim)
 public
   rKey : AnsiString; // Ключ
   rValue : AnsiString; // Значение
 public
    procedure Localize(const aRus: AnsiString;
     const anAlien: AnsiString);
     {* Локализовать }
    function AsWideString: WideString;
    function AsWStr: Tl3PCharLen;
    function AsCStr: Il3CString;
    function AsStr: AnsiString;
    procedure Init;
     {* Инициализирует строку }
 end;//Tl3StringIDEx

 Pl3StringIDEx = ^Tl3StringIDEx;

 {$Undef l3Items_NoSort}

 _ItemType_ = Pl3StringIDEx;
 _l3AtomicListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3AtomicListPrim.imp.pas}
 Tl3ConstStringsPrim = class(_l3AtomicListPrim_)
 protected
 // overridden protected methods
   procedure InitFields; override;
 end;//Tl3ConstStringsPrim

(*
 Ml3StringIDExHelper = PureMixIn
  {* Контракт сервиса Tl3StringIDExHelper }
   function AsCStr(const aStr: Tl3StringIDEx): Il3CString;
   function AsStr(const aStr: Tl3StringIDEx): AnsiString;
   procedure Init(var theStr: Tl3StringIDEx);
 end;//Ml3StringIDExHelper
*)

 Il3StringIDExHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3StringIDExHelper }
   ['{8AB76DA9-7B40-4325-8F71-3EAA5DB9E047}']
  // Ml3StringIDExHelper
   function AsCStr(const aStr: Tl3StringIDEx): Il3CString;
   function AsStr(const aStr: Tl3StringIDEx): AnsiString;
   procedure Init(var theStr: Tl3StringIDEx);
 end;//Il3StringIDExHelper

 Tl3StringIDExHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3StringIDExHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3StringIDExHelper);
 public
 // realized methods
   procedure Init(var theStr: Tl3StringIDEx);
   function AsCStr(const aStr: Tl3StringIDEx): Il3CString;
   function AsStr(const aStr: Tl3StringIDEx): AnsiString;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // public properties
   property Alien: Il3StringIDExHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3StringIDExHelper }
 public
 // singleton factory method
   class function Instance: Tl3StringIDExHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3StringIDExHelper

implementation

uses
  l3String,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils,
  l3ConstStrings
  ;

// start class Tl3StringIDEx

procedure Tl3StringIDEx.Localize(const aRus: AnsiString;
  const anAlien: AnsiString);
//#UC START# *4BB9D8550292_4B3B3728004C_var*
//#UC END# *4BB9D8550292_4B3B3728004C_var*
begin
//#UC START# *4BB9D8550292_4B3B3728004C_impl*
 rLocalized := true;
 rValue := anAlien;
//#UC END# *4BB9D8550292_4B3B3728004C_impl*
end;//Tl3StringIDEx.Localize

function Tl3StringIDEx.AsWideString: WideString;
//#UC START# *4CFE25B202FA_4B3B3728004C_var*
//#UC END# *4CFE25B202FA_4B3B3728004C_var*
begin
//#UC START# *4CFE25B202FA_4B3B3728004C_impl*
 Result := l3WideString(AsCStr);
//#UC END# *4CFE25B202FA_4B3B3728004C_impl*
end;//Tl3StringIDEx.AsWideString

function Tl3StringIDEx.AsWStr: Tl3PCharLen;
//#UC START# *4D7258F003D4_4B3B3728004C_var*
//#UC END# *4D7258F003D4_4B3B3728004C_var*
begin
//#UC START# *4D7258F003D4_4B3B3728004C_impl*
 Result := l3PCharLen(AsCStr);
//#UC END# *4D7258F003D4_4B3B3728004C_impl*
end;//Tl3StringIDEx.AsWStr

function Tl3StringIDEx.AsCStr: Il3CString;
//#UC START# *4B3B3B51012A_4B3B3728004C_var*
//#UC END# *4B3B3B51012A_4B3B3728004C_var*
begin
//#UC START# *4B3B3B51012A_4B3B3728004C_impl*
 Result := Tl3StringIDExHelper.Instance.AsCStr(Self);
//#UC END# *4B3B3B51012A_4B3B3728004C_impl*
end;//Tl3StringIDEx.AsCStr

function Tl3StringIDEx.AsStr: AnsiString;
//#UC START# *4B3B3F25003B_4B3B3728004C_var*
//#UC END# *4B3B3F25003B_4B3B3728004C_var*
begin
//#UC START# *4B3B3F25003B_4B3B3728004C_impl*
 Result := Tl3StringIDExHelper.Instance.AsStr(Self);
//#UC END# *4B3B3F25003B_4B3B3728004C_impl*
end;//Tl3StringIDEx.AsStr

procedure Tl3StringIDEx.Init;
//#UC START# *4B3B4D0A0026_4B3B3728004C_var*
//#UC END# *4B3B4D0A0026_4B3B3728004C_var*
begin
//#UC START# *4B3B4D0A0026_4B3B3728004C_impl*
 Tl3StringIDExHelper.Instance.Init(Self);
//#UC END# *4B3B4D0A0026_4B3B3728004C_impl*
end;//Tl3StringIDEx.Init
// start class Tl3ConstStringsPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4BA223D801B3_var*
//#UC END# *47B99D4503A2_4BA223D801B3_var*
begin
//#UC START# *47B99D4503A2_4BA223D801B3_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 //Result := CompareStr(CI.rA^.rKey, CI.rB^.rKey);
 //Result := l3Compare(l3PCharLen(CI.rA^.rKey), l3PCharLen(CI.rB^.rKey), CI.rSortIndex);
 Result := Integer(CI.rA^) - Integer(CI.rB^);
 // - надо сравнивать именно адреса, а не ключи, т.к. ключи могут быть одинаковыми - из примесей
 // http://mdp.garant.ru/pages/viewpage.action?pageId=265404457&focusedCommentId=265407436#comment-265407436
//#UC END# *47B99D4503A2_4BA223D801B3_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ConstStringsPrim;

{$Include ..\L3\l3AtomicListPrim.imp.pas}

// start class Tl3ConstStringsPrim

procedure Tl3ConstStringsPrim.InitFields;
//#UC START# *47A042E100E2_4BA223D801B3_var*
//#UC END# *47A042E100E2_4BA223D801B3_var*
begin
//#UC START# *47A042E100E2_4BA223D801B3_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_4BA223D801B3_impl*
end;//Tl3ConstStringsPrim.InitFields

// start class Tl3StringIDExHelper

var g_Tl3StringIDExHelper : Tl3StringIDExHelper = nil;

procedure Tl3StringIDExHelperFree;
begin
 l3Free(g_Tl3StringIDExHelper);
end;

class function Tl3StringIDExHelper.Instance: Tl3StringIDExHelper;
begin
 if (g_Tl3StringIDExHelper = nil) then
 begin
  l3System.AddExitProc(Tl3StringIDExHelperFree);
  g_Tl3StringIDExHelper := Create;
 end;
 Result := g_Tl3StringIDExHelper;
end;


procedure Tl3StringIDExHelper.pm_SetAlien(const aValue: Il3StringIDExHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3StringIDExHelper.pm_SetAlien

class function Tl3StringIDExHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3StringIDExHelper <> nil;
end;//Tl3StringIDExHelper.Exists

procedure Tl3StringIDExHelper.Init(var theStr: Tl3StringIDEx);
//#UC START# *071573E75439_4B98D6C201AD_var*
//#UC END# *071573E75439_4B98D6C201AD_var*
begin
//#UC START# *071573E75439_4B98D6C201AD_impl*
 {$IfDef Nemesis}
  {$IfNDef NoVCM}
   Assert(not g_l3ConstStringsSealed);
  {$EndIf  NoVCM}
 {$EndIf Nemesis}
 {$IfNDef DesignTimeLibrary}
 if (theStr.rValue <> '') then
  Tl3ConstStrings.Instance.Add(@theStr);
 {$EndIf  DesignTimeLibrary}
 theStr.rS := -1;
 if (f_Alien <> nil) then
  f_Alien.Init(theStr);
//#UC END# *071573E75439_4B98D6C201AD_impl*
end;//Tl3StringIDExHelper.Init

function Tl3StringIDExHelper.AsCStr(const aStr: Tl3StringIDEx): Il3CString;
//#UC START# *201B50E5979A_4B98D6C201AD_var*
//#UC END# *201B50E5979A_4B98D6C201AD_var*
begin
//#UC START# *201B50E5979A_4B98D6C201AD_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.AsCStr(aStr)
 else
  Result := l3CStr(aStr.rValue);
//#UC END# *201B50E5979A_4B98D6C201AD_impl*
end;//Tl3StringIDExHelper.AsCStr

function Tl3StringIDExHelper.AsStr(const aStr: Tl3StringIDEx): AnsiString;
//#UC START# *74E80608E1B4_4B98D6C201AD_var*
//#UC END# *74E80608E1B4_4B98D6C201AD_var*
begin
//#UC START# *74E80608E1B4_4B98D6C201AD_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.AsStr(aStr)
 else
  Result := aStr.rValue;
//#UC END# *74E80608E1B4_4B98D6C201AD_impl*
end;//Tl3StringIDExHelper.AsStr

procedure Tl3StringIDExHelper.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3StringIDExHelper.ClearFields

end.