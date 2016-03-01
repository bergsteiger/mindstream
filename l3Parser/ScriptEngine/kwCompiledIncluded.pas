unit kwCompiledIncluded;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledIncluded.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledIncluded
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
 TkwCompiledIncluded = class(TkwCompiledWordPrim)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledIncluded
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledIncluded

procedure TkwCompiledIncluded.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DC98AAC0395_var*
//#UC END# *4DAEEDE10285_4DC98AAC0395_var*
begin
//#UC START# *4DAEEDE10285_4DC98AAC0395_impl*
 RunnerError('Нельзя запускать', aCtx);
//#UC END# *4DAEEDE10285_4DC98AAC0395_impl*
end;//TkwCompiledIncluded.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledIncluded
 TkwCompiledIncluded.RegisterClass;
{$IfEnd} //not NoScripts

end.