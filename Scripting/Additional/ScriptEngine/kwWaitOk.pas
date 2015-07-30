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

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
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
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Classes
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWaitOk

procedure TkwWaitOk.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DDE8A650180_var*
//#UC END# *4DAEEDE10285_4DDE8A650180_var*
begin
//#UC START# *4DAEEDE10285_4DDE8A650180_impl*
 {$If NOT defined(nsTest)}
 RunnerError('', aCtx);
 {$Else}
 afwSetAnswer(mrOk);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4DDE8A650180_impl*
end;//TkwWaitOk.DoDoIt

class function TkwWaitOk.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Ok';
end;//TkwWaitOk.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация wait_Ok
 TkwWaitOk.RegisterInEngine;
{$IfEnd} //not NoScripts

end.