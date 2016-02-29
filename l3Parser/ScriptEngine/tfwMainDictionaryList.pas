unit tfwMainDictionaryList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwMainDictionaryList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwMainDictionaryList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwMainDictionary,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes,
  tfwDictionaryExPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = TtfwMainDictionary;
 {$Include ..\ScriptEngine\tfwSortedDictionaryList.imp.pas}
 _tfwNamedDictionaryList_Parent_ = _tfwSortedDictionaryList_;
 {$Include ..\ScriptEngine\tfwNamedDictionaryList.imp.pas}
 TtfwMainDictionaryList = class(_tfwNamedDictionaryList_)
 end;//TtfwMainDictionaryList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TtfwMainDictionaryList;

{$Include ..\ScriptEngine\tfwSortedDictionaryList.imp.pas}


{$Include ..\ScriptEngine\tfwNamedDictionaryList.imp.pas}


{$IfEnd} //not NoScripts
end.