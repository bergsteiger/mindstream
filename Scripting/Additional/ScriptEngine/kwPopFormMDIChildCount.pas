unit kwPopFormMDIChildCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopFormMDIChildCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::pop_form_MDIChildCount
//
// Use MDIChildCount to get the number of open MDI child forms.
// MDIChildCount is meaningful only if the form is an MDI parent (that is, if the form’s FormStyle
// property is set to fsMDIForm).
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Forms,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwFormFromStackWord.imp.pas}
 TkwPopFormMDIChildCount = class(_kwFormFromStackWord_)
  {* Use MDIChildCount to get the number of open MDI child forms.
MDIChildCount is meaningful only if the form is an MDI parent (that is, if the form’s FormStyle property is set to fsMDIForm). }
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormMDIChildCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopFormMDIChildCount;

{$Include ..\ScriptEngine\kwFormFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwFormFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.