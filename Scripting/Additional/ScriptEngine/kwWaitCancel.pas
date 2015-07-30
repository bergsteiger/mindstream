unit kwWaitCancel;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWaitCancel.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::wait_Cancel
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
 TkwWaitCancel = {final scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitCancel
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

// start class TkwWaitCancel

procedure TkwWaitCancel.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FFFE217028B_var*
//#UC END# *4DAEEDE10285_4FFFE217028B_var*
begin
//#UC START# *4DAEEDE10285_4FFFE217028B_impl*
 {$If defined(nsTest)}
 afwSetAnswer(mrCancel);
 {$IfEnd} //nsTest
//#UC END# *4DAEEDE10285_4FFFE217028B_impl*
end;//TkwWaitCancel.DoDoIt

class function TkwWaitCancel.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Cancel';
end;//TkwWaitCancel.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация wait_Cancel
 TkwWaitCancel.RegisterInEngine;
{$IfEnd} //not NoScripts

end.