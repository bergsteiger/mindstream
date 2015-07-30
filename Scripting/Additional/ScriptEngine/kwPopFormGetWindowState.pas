unit kwPopFormGetWindowState;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormGetWindowState.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_GetWindowState
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
 TkwPopFormGetWindowState = {final scriptword} class(TkwFormFromStackWord)
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormGetWindowState
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormGetWindowState

procedure TkwPopFormGetWindowState.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4F82C8BC00DF_var*
//#UC END# *4F2145550317_4F82C8BC00DF_var*
begin
//#UC START# *4F2145550317_4F82C8BC00DF_impl*
 aCtx.rEngine.PushInt(Ord(aForm.WindowState));
//#UC END# *4F2145550317_4F82C8BC00DF_impl*
end;//TkwPopFormGetWindowState.DoForm

class function TkwPopFormGetWindowState.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:GetWindowState';
end;//TkwPopFormGetWindowState.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_GetWindowState
 TkwPopFormGetWindowState.RegisterInEngine;
{$IfEnd} //not NoScripts

end.