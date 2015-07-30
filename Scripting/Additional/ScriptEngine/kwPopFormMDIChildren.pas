unit kwPopFormMDIChildren;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopFormMDIChildren.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_MDIChildren
//
// *Формат:* anID aForm pop:form:MDIChildren
// *Описание:* Складывает в стек указатель на дочернюю форму, если есть. anID - номер дочерней
// формы в списке дочерних форм.
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
 TkwPopFormMDIChildren = {scriptword} class(TkwFormFromStackWord)
  {* *Формат:* anID aForm pop:form:MDIChildren
*Описание:* Складывает в стек указатель на дочернюю форму, если есть. anID - номер дочерней формы в списке дочерних форм. }
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormMDIChildren
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormMDIChildren

procedure TkwPopFormMDIChildren.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4E4CC5300064_var*
//#UC END# *4F2145550317_4E4CC5300064_var*
begin
//#UC START# *4F2145550317_4E4CC5300064_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан номер дочерней формы!', aCtx); 
 aCtx.rEngine.PushObj(aForm.MDIChildren[aCtx.rEngine.PopInt]);
//#UC END# *4F2145550317_4E4CC5300064_impl*
end;//TkwPopFormMDIChildren.DoForm

class function TkwPopFormMDIChildren.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:MDIChildren';
end;//TkwPopFormMDIChildren.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_MDIChildren
 TkwPopFormMDIChildren.RegisterInEngine;
{$IfEnd} //not NoScripts

end.