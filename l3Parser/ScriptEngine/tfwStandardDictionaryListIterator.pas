unit tfwStandardDictionaryListIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStandardDictionaryListIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwStandardDictionaryListIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStandardDictionaryList,
  tfwScriptingInterfaces,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ListType_ = TtfwStandardDictionaryList;
 {$Include ..\ScriptEngine\tfwDictionaryListIterator.imp.pas}
 TtfwStandardDictionaryListIterator = class(_tfwDictionaryListIterator_)
 end;//TtfwStandardDictionaryListIterator
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