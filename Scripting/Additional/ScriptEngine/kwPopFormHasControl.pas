unit kwPopFormHasControl;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormHasControl.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_HasControl
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
 TkwPopFormHasControl = {scriptword} class(TkwFormFromStackWord)
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormHasControl
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormHasControl

procedure TkwPopFormHasControl.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4E4DE47E0152_var*
//#UC END# *4F2145550317_4E4DE47E0152_var*
begin
//#UC START# *4F2145550317_4E4DE47E0152_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано имя контрола!', aCtx);
 aCtx.rEngine.PushBool(aForm.FindChildControl(aCtx.rEngine.PopDelphiString) <> nil);
//#UC END# *4F2145550317_4E4DE47E0152_impl*
end;//TkwPopFormHasControl.DoForm

class function TkwPopFormHasControl.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:HasControl';
end;//TkwPopFormHasControl.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_HasControl
 TkwPopFormHasControl.RegisterInEngine;
{$IfEnd} //not NoScripts

end.