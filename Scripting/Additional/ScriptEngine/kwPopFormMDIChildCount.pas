unit kwPopFormMDIChildCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormMDIChildCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_MDIChildCount
//
// Use MDIChildCount to get the number of open MDI child forms.
// MDIChildCount is meaningful only if the form is an MDI parent (that is, if the form’s FormStyle
// property is set to fsMDIForm).
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
 TkwPopFormMDIChildCount = {scriptword} class(TkwFormFromStackWord)
  {* Use MDIChildCount to get the number of open MDI child forms.
MDIChildCount is meaningful only if the form is an MDI parent (that is, if the form’s FormStyle property is set to fsMDIForm). }
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormMDIChildCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormMDIChildCount

procedure TkwPopFormMDIChildCount.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4E4CBBD3020F_var*
//#UC END# *4F2145550317_4E4CBBD3020F_var*
begin
//#UC START# *4F2145550317_4E4CBBD3020F_impl*
 aCtx.rEngine.PushInt(aForm.MDIChildCount);
//#UC END# *4F2145550317_4E4CBBD3020F_impl*
end;//TkwPopFormMDIChildCount.DoForm

class function TkwPopFormMDIChildCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:MDIChildCount';
end;//TkwPopFormMDIChildCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_MDIChildCount
 TkwPopFormMDIChildCount.RegisterInEngine;
{$IfEnd} //not NoScripts

end.