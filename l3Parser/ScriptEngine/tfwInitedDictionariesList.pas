unit tfwInitedDictionariesList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwInitedDictionariesList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwInitedDictionariesList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionaryExPrim,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
 {$Define l3Items_NoSort}

 {$Define l3Items_NoChanging}

type
 _ItemType_ = TtfwDictionaryExPrim;
 {$Include ..\ScriptEngine\tfwDictionaryList.imp.pas}
 TtfwInitedDictionariesList = class(_tfwDictionaryList_)
 end;//TtfwInitedDictionariesList
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

type _Instance_R_ = TtfwInitedDictionariesList;

{$Include ..\ScriptEngine\tfwDictionaryList.imp.pas}


{$IfEnd} //not NoScripts
end.