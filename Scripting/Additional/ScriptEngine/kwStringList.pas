unit kwStringList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwStringList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TkwStringList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  kwStringListPrim,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _FindDataType_ = Il3CString;
 _l3Searcher_Parent_ = TkwStringListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TkwStringList = class(_l3Searcher_)
 end;//TkwStringList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringList

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_4F3E476202B8_var*
//#UC END# *47B9BAFD01F4_4F3E476202B8_var*
begin
//#UC START# *47B9BAFD01F4_4F3E476202B8_impl*
 Assert(aSortIndex = l3_siNative);
 Result := l3Compare(l3PCharLen(anItem.Value), l3PCharLen(aData));
//#UC END# *47B9BAFD01F4_4F3E476202B8_impl*
end;//CompareItemWithData

type _Instance_R_ = TkwStringList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}


{$IfEnd} //not NoScripts
end.