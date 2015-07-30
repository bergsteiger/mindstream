unit kwFormFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwFormFromStackWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::VCL bindings::TkwFormFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Forms,
  tfwScriptingInterfaces,
  kwCustomFormFromStackWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwFormFromStackWord = {abstract} class(TkwCustomFormFromStackWord)
 protected
 // realized methods
   procedure DoCustomForm(aForm: TCustomForm;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwFormFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFormFromStackWord

procedure TkwFormFromStackWord.DoCustomForm(aForm: TCustomForm;
  const aCtx: TtfwContext);
//#UC START# *4F2A69ED0387_4F2145340223_var*
//#UC END# *4F2A69ED0387_4F2145340223_var*
begin
//#UC START# *4F2A69ED0387_4F2145340223_impl*
 DoForm(aForm As TForm, aCtx);
//#UC END# *4F2A69ED0387_4F2145340223_impl*
end;//TkwFormFromStackWord.DoCustomForm

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwFormFromStackWord
 TkwFormFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.