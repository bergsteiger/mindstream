unit tfwWordInfoList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwWordInfoList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::WordInfoCache::TtfwWordInfoList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordInfoListPrim,
  tfwScriptingTypes,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _FindDataType_ = TtfwWordInfoRec;
 _l3Searcher_Parent_ = TtfwWordInfoListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwWordInfoList = class(_l3Searcher_)
 end;//TtfwWordInfoList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwWordInfoList

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_559F840D0179_var*
//#UC END# *47B9BAFD01F4_559F840D0179_var*
begin
//#UC START# *47B9BAFD01F4_559F840D0179_impl*
 Result := anItem.pRec^.Compare(aData);
//#UC END# *47B9BAFD01F4_559F840D0179_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwWordInfoList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}


{$IfEnd} //not NoScripts
end.