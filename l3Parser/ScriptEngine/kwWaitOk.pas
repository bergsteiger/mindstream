unit kwWaitOk;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWaitOk.pas"
// Начат: 26.05.2011 21:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::wait_Ok
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
 TkwWaitOk = {scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitOk
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

// start class TkwWaitOk

procedure TkwWaitOk.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DDE8A650180_var*
//#UC END# *4DAEEDE10285_4DDE8A650180_var*
begin
//#UC START# *4DAEEDE10285_4DDE8A650180_impl*
 Tl3BatchService.Instance.PushAnswer(mrOk);
//#UC END# *4DAEEDE10285_4DDE8A650180_impl*
end;//TkwWaitOk.DoDoIt

class function TkwWaitOk.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Ok';
end;//TkwWaitOk.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCL

initialization
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация wait_Ok
 TkwWaitOk.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVCL

end.