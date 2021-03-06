unit tfwDictionaryListIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "ScriptEngine$Core"
// ������: "tfwDictionaryListIterator.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryListIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionaryList,
  tfwScriptingInterfaces,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ListType_ = TtfwDictionaryList;
 {$Include ..\ScriptEngine\tfwDictionaryListIterator.imp.pas}
 TtfwDictionaryListIterator = class(_tfwDictionaryListIterator_)
 end;//TtfwDictionaryListIterator
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