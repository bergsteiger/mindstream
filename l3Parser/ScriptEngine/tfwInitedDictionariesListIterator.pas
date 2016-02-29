unit tfwInitedDictionariesListIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwInitedDictionariesListIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwInitedDictionariesListIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwInitedDictionariesList,
  tfwScriptingInterfaces,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ListType_ = TtfwInitedDictionariesList;
 {$Include ..\ScriptEngine\tfwDictionaryListIterator.imp.pas}
 TtfwInitedDictionariesListIterator = class(_tfwDictionaryListIterator_)
 end;//TtfwInitedDictionariesListIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwDictionary
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwDictionaryListIterator.imp.pas}


{$IfEnd} //not NoScripts
end.