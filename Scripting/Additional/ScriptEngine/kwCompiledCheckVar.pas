unit kwCompiledCheckVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledCheckVar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::TkwCompiledCheckVar
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledCheckVarByRef,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCheckVar = class(TkwCompiledCheckVarByRef)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledCheckVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledCheckVar

procedure TkwCompiledCheckVar.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53E235180147_var*
var
 l_W : TtfwWord;
//#UC END# *4DAEEDE10285_53E235180147_var*
begin
//#UC START# *4DAEEDE10285_53E235180147_impl*
 l_W := GetVar(aCtx);
 if (l_W <> nil) then
  aCtx.rEngine.Push(l_W.GetValue(aCtx))
 else
  aCtx.rEngine.Push(TtfwStackValue_E);
//#UC END# *4DAEEDE10285_53E235180147_impl*
end;//TkwCompiledCheckVar.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledCheckVar
 TkwCompiledCheckVar.RegisterClass;
{$IfEnd} //not NoScripts

end.