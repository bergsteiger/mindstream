unit kwCtxPushCompiler;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCtxPushCompiler.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Compilation::Ctx_PushCompiler
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCtxPushCompiler = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCtxPushCompiler
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCtxPushCompiler

procedure TkwCtxPushCompiler.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD6350291_var*
//#UC END# *4DAEEDE10285_4F4FD6350291_var*
begin
//#UC START# *4DAEEDE10285_4F4FD6350291_impl*
 aCtx.rEngine.PushIntf(aCtx.rCompiler);
//#UC END# *4DAEEDE10285_4F4FD6350291_impl*
end;//TkwCtxPushCompiler.DoDoIt

class function TkwCtxPushCompiler.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:PushCompiler';
end;//TkwCtxPushCompiler.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Ctx_PushCompiler
 TkwCtxPushCompiler.RegisterInEngine;
{$IfEnd} //not NoScripts

end.