unit kwWaitChoice;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWaitChoice.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::wait_Choice
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCL)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts AND not NoVCL

{$If not defined(NoScripts) AND not defined(NoVCL)}
type
 _afwImpurity_Parent_ = TtfwRegisterableWord;
 {$Include ..\ScriptEngine\afwImpurity.imp.pas}
 TkwWaitChoice = {final scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitChoice
{$IfEnd} //not NoScripts AND not NoVCL

implementation

{$If not defined(NoScripts) AND not defined(NoVCL)}
uses
  l3BatchService,
  Controls
  ;
{$IfEnd} //not NoScripts AND not NoVCL

{$If not defined(NoScripts) AND not defined(NoVCL)}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWaitChoice

procedure TkwWaitChoice.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FFFF8520204_var*
//#UC END# *4DAEEDE10285_4FFFF8520204_var*
begin
//#UC START# *4DAEEDE10285_4FFFF8520204_impl*
 Tl3BatchService.Instance.PushAnswer(-aCtx.rEngine.PopInt);
//#UC END# *4DAEEDE10285_4FFFF8520204_impl*
end;//TkwWaitChoice.DoDoIt

class function TkwWaitChoice.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Choice';
end;//TkwWaitChoice.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCL

initialization
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация wait_Choice
 TkwWaitChoice.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVCL

end.