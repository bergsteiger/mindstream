unit tfwDictionaryPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwDictionaryPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Dictionary::TtfwDictionaryPrim
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwDictionaryPrimPrim,
  l3Variant,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _FindDataType_ = Tl3WString;
 _ItemType_ = Tl3PrimString;
 _l3Searcher_Parent_ = TtfwDictionaryPrimPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwDictionaryPrim = class(_l3Searcher_)
 end;//TtfwDictionaryPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwDictionaryPrim

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_4F4659980048_var*
//#UC END# *47B9BAFD01F4_4F4659980048_var*
begin
//#UC START# *47B9BAFD01F4_4F4659980048_impl*
 Result := l3Compare(anItem.AsWStr, aData, aSortIndex);
//#UC END# *47B9BAFD01F4_4F4659980048_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwDictionaryPrim;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}


{$IfEnd} //not NoScripts
end.