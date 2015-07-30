unit tfwCStringList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwCStringList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CString::TtfwCStringList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwCStringListPrim,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _FindDataType_ = Tl3WString;
 _l3Searcher_Parent_ = TtfwCStringListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwCStringList = class(_l3Searcher_)
 end;//TtfwCStringList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwCStringList

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_4F473F370158_var*
//#UC END# *47B9BAFD01F4_4F473F370158_var*
begin
//#UC START# *47B9BAFD01F4_4F473F370158_impl*
 Result := l3Compare(l3PCharLen(anItem), aData, aSortIndex);
//#UC END# *47B9BAFD01F4_4F473F370158_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwCStringList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}


{$IfEnd} //not NoScripts
end.