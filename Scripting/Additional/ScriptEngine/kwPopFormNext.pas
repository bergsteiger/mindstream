unit kwPopFormNext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormNext.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_Next
//
// form:Next
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
 TkwPopFormNext = {scriptword} class(TkwFormFromStackWord)
  {* form:Next }
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormNext
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormNext

procedure TkwPopFormNext.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4EF1E1DD01A1_var*
//#UC END# *4F2145550317_4EF1E1DD01A1_var*
begin
//#UC START# *4F2145550317_4EF1E1DD01A1_impl*
 aForm.Next;
//#UC END# *4F2145550317_4EF1E1DD01A1_impl*
end;//TkwPopFormNext.DoForm

class function TkwPopFormNext.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:Next';
end;//TkwPopFormNext.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_Next
 TkwPopFormNext.RegisterInEngine;
{$IfEnd} //not NoScripts

end.