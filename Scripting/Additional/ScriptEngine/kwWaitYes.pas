unit kwWaitYes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWaitYes.pas"
// Начат: 28.04.2011 15:06
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::wait_Yes
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
 TkwWaitYes = {scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitYes
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

// start class TkwWaitYes

procedure TkwWaitYes.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB94A330111_var*
//#UC END# *4DAEEDE10285_4DB94A330111_var*
begin
//#UC START# *4DAEEDE10285_4DB94A330111_impl*
 {$If NOT defined(nsTest)}
 RunnerError('', aCtx);
 {$Else}
 afwSetAnswer(mrYes);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4DB94A330111_impl*
end;//TkwWaitYes.DoDoIt

class function TkwWaitYes.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Yes';
end;//TkwWaitYes.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация wait_Yes
 TkwWaitYes.RegisterInEngine;
{$IfEnd} //not NoScripts

end.