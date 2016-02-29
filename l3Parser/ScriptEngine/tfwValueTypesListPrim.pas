unit tfwValueTypesListPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwValueTypesListPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::TypeInfoCache::TtfwValueTypesListPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoDataContainer,
  tfwValueTypes,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = TtfwValueTypes;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3UncomparabeObjectRefList.imp.pas}
 TtfwValueTypesListPrim = {abstract} class(_l3UncomparabeObjectRefList_)
 end;//TtfwValueTypesListPrim
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

// start class TtfwValueTypesListPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_55BF376C001D_var*
//#UC END# *47B2C42A0163_55BF376C001D_var*
begin
//#UC START# *47B2C42A0163_55BF376C001D_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_55BF376C001D_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_55BF376C001D_var*
//#UC END# *47B99D4503A2_55BF376C001D_var*
begin
//#UC START# *47B99D4503A2_55BF376C001D_impl*
 Result := CI.rA.Compare(CI.rB^);
//#UC END# *47B99D4503A2_55BF376C001D_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwValueTypesListPrim;

{$Include w:\common\components\rtl\Garant\L3\l3UncomparabeObjectRefList.imp.pas}


{$IfEnd} //not NoScripts
end.