unit kwPopFormModalResult;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormModalResult.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_ModalResult
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
 TkwPopFormModalResult = {final scriptword} class(TkwFormFromStackWord)
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormModalResult
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormModalResult

procedure TkwPopFormModalResult.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_51A5DEC70213_var*
//#UC END# *4F2145550317_51A5DEC70213_var*
begin
//#UC START# *4F2145550317_51A5DEC70213_impl*
 RunnerAssert(fsModal in aForm.FormState, 'Это не модальная форма!', aCtx);
 aCtx.rEngine.PushInt(aForm.ModalResult);
//#UC END# *4F2145550317_51A5DEC70213_impl*
end;//TkwPopFormModalResult.DoForm

class function TkwPopFormModalResult.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:ModalResult';
end;//TkwPopFormModalResult.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_ModalResult
 TkwPopFormModalResult.RegisterInEngine;
{$IfEnd} //not NoScripts

end.