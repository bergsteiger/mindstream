unit tfwStandardDictionaryList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStandardDictionaryList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwStandardDictionaryList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwStandardDictionaryListPrim,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _FindDataType_ = Tl3WString;
 _l3Searcher_Parent_ = TtfwStandardDictionaryListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwStandardDictionaryList = class(_l3Searcher_)
 end;//TtfwStandardDictionaryList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwStandardDictionaryList

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_55B0EFA300D1_var*
//#UC END# *47B9BAFD01F4_55B0EFA300D1_var*
begin
//#UC START# *47B9BAFD01F4_55B0EFA300D1_impl*
 Result := l3Compare(l3PCharLen(anItem.FileName), aData, l3_siCaseUnsensitive);
//#UC END# *47B9BAFD01F4_55B0EFA300D1_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwStandardDictionaryList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}


{$IfEnd} //not NoScripts
end.