unit kwCtxPushFinder;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCtxPushFinder.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Compilation::Ctx_PushFinder
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
 TkwCtxPushFinder = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCtxPushFinder
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCtxPushFinder

procedure TkwCtxPushFinder.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD65602F1_var*
//#UC END# *4DAEEDE10285_4F4FD65602F1_var*
begin
//#UC START# *4DAEEDE10285_4F4FD65602F1_impl*
 aCtx.rEngine.PushIntf(aCtx.rParser.KeyWords);
//#UC END# *4DAEEDE10285_4F4FD65602F1_impl*
end;//TkwCtxPushFinder.DoDoIt

class function TkwCtxPushFinder.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:PushFinder';
end;//TkwCtxPushFinder.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Ctx_PushFinder
 TkwCtxPushFinder.RegisterInEngine;
{$IfEnd} //not NoScripts

end.