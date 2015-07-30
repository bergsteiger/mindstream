unit kwLeftParam;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwLeftParam.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwLeftParam
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWordPrim,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwCompiledVar_Parent_ = TkwCompiledWordPrim;
 {$Include ..\ScriptEngine\kwCompiledVar.imp.pas}
 TkwLeftParam = class(_kwCompiledVar_)
 end;//TkwLeftParam
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwCompiledVar.imp.pas}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwLeftParam
 TkwLeftParam.RegisterClass;
{$IfEnd} //not NoScripts

end.