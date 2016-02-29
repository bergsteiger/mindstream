unit tfwSourcePointList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwSourcePointList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::TtfwSourcePointList
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
type
 _ItemType_ = TtfwSourcePoint;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}
 TtfwSourcePointList = class(_l3RecordListPrim_)
 end;//TtfwSourcePointList
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

// start class TtfwSourcePointList

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_55648E420189_var*
//#UC END# *47B07CF403D0_55648E420189_var*
begin
//#UC START# *47B07CF403D0_55648E420189_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_55648E420189_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_55648E420189_var*
//#UC END# *47B2C42A0163_55648E420189_var*
begin
//#UC START# *47B2C42A0163_55648E420189_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_55648E420189_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_55648E420189_var*
//#UC END# *47B99D4503A2_55648E420189_var*
begin
//#UC START# *47B99D4503A2_55648E420189_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_55648E420189_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwSourcePointList;

{$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}


{$IfEnd} //not NoScripts
end.