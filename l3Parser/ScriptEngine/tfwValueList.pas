unit tfwValueList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwValueList.pas"
// Начат: 12.05.2011 20:58
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::Array::TtfwValueList
//
// Список адаптированный для хранения переменных.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoDataContainer,
  tfwScriptingInterfaces,
  l3Memory,
  l3Interfaces,
  l3Types,
  l3Core,
  l3Except,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
 {$Define l3Items_NoSort}

type
 _ItemType_ = TtfwStackValue;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}
 TtfwValueList = class(_l3RecordListPrim_)
  {* Список адаптированный для хранения переменных. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 end;//TtfwValueList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwValueList

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4DCC11A10187_var*
//#UC END# *47B07CF403D0_4DCC11A10187_var*
begin
//#UC START# *47B07CF403D0_4DCC11A10187_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_4DCC11A10187_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4DCC11A10187_var*
//#UC END# *47B2C42A0163_4DCC11A10187_var*
begin
//#UC START# *47B2C42A0163_4DCC11A10187_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4DCC11A10187_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4DCC11A10187_var*
//#UC END# *47B99D4503A2_4DCC11A10187_var*
begin
//#UC START# *47B99D4503A2_4DCC11A10187_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4DCC11A10187_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwValueList;

{$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}

// start class TtfwValueList

{$If not defined(DesignTimeLibrary)}
class function TtfwValueList.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4DCC11A10187_var*
//#UC END# *47A6FEE600FC_4DCC11A10187_var*
begin
//#UC START# *47A6FEE600FC_4DCC11A10187_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4DCC11A10187_impl*
end;//TtfwValueList.IsCacheable
{$IfEnd} //not DesignTimeLibrary

{$IfEnd} //not NoScripts

end.