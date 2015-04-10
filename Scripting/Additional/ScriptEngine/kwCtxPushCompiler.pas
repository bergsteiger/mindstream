unit kwCtxPushCompiler;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCtxPushCompiler.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::Ctx_PushCompiler
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwCtxPushCompiler = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCtxPushCompiler
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCtxPushCompiler;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.