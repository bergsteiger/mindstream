unit tfwAxiomaticsResNameGetterList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwAxiomaticsResNameGetterList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptedAxiomatics::TtfwAxiomaticsResNameGetterList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoDataContainer,
  tfwAxiomaticsResNameGetter,
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
 _ItemType_ = RtfwAxiomaticsResNameGetter;
 _l3UnrefcountedList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3UnrefcountedList.imp.pas}
 TtfwAxiomaticsResNameGetterList = class(_l3UnrefcountedList_)
 end;//TtfwAxiomaticsResNameGetterList
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

// start class TtfwAxiomaticsResNameGetterList

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_55B7A37F010E_var*
//#UC END# *47B99D4503A2_55B7A37F010E_var*
begin
//#UC START# *47B99D4503A2_55B7A37F010E_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_55B7A37F010E_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwAxiomaticsResNameGetterList;

{$Include w:\common\components\rtl\Garant\L3\l3UnrefcountedList.imp.pas}


{$IfEnd} //not NoScripts
end.