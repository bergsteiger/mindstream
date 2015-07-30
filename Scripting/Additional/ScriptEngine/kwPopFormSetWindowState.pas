unit kwPopFormSetWindowState;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormSetWindowState.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_SetWindowState
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwFormFromStackWord,
  Forms,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopFormSetWindowState = {final scriptword} class(TkwFormFromStackWord)
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormSetWindowState
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormSetWindowState

procedure TkwPopFormSetWindowState.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4F82C87C001F_var*
//#UC END# *4F2145550317_4F82C87C001F_var*
begin
//#UC START# *4F2145550317_4F82C87C001F_impl*
 if aCtx.rEngine.IsTopInt then
  aForm.WindowState := TWindowState(aCtx.rEngine.PopInt)
 else
  RunnerError('Не задано WindowState', aCtx);
//#UC END# *4F2145550317_4F82C87C001F_impl*
end;//TkwPopFormSetWindowState.DoForm

class function TkwPopFormSetWindowState.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:SetWindowState';
end;//TkwPopFormSetWindowState.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_SetWindowState
 TkwPopFormSetWindowState.RegisterInEngine;
{$IfEnd} //not NoScripts

end.