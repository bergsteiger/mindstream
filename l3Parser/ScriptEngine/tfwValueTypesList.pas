unit tfwValueTypesList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwValueTypesList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::TypeInfoCache::TtfwValueTypesList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwTypeInfo,
  tfwValueTypesListPrim,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _FindDataType_ = TtfwTypeInfo;
 _l3Searcher_Parent_ = TtfwValueTypesListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwValueTypesList = class(_l3Searcher_)
 end;//TtfwValueTypesList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwValueTypesList

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_55BF43BA0204_var*
//#UC END# *47B9BAFD01F4_55BF43BA0204_var*
begin
//#UC START# *47B9BAFD01F4_55BF43BA0204_impl*
 Result := anItem.Compare(aData);
//#UC END# *47B9BAFD01F4_55BF43BA0204_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwValueTypesList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}


{$IfEnd} //not NoScripts
end.