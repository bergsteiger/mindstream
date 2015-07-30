unit kwPopFormFormStyle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwPopFormFormStyle.pas"
// Начат: 02.02.2012 14:49
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::pop_form_FormStyle
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCustomFormFromStackWord,
  Forms,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopFormFormStyle = {scriptword} class(TkwCustomFormFromStackWord)
 protected
 // realized methods
   procedure DoCustomForm(aForm: TCustomForm;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormFormStyle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopFormFormStyle

procedure TkwPopFormFormStyle.DoCustomForm(aForm: TCustomForm;
  const aCtx: TtfwContext);
//#UC START# *4F2A69ED0387_4F2A6A1D0149_var*
//#UC END# *4F2A69ED0387_4F2A6A1D0149_var*
begin
//#UC START# *4F2A69ED0387_4F2A6A1D0149_impl*
 aCtx.rEngine.PushInt(Ord(TForm(aForm).FormStyle));
//#UC END# *4F2A69ED0387_4F2A6A1D0149_impl*
end;//TkwPopFormFormStyle.DoCustomForm

class function TkwPopFormFormStyle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:FormStyle';
end;//TkwPopFormFormStyle.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_form_FormStyle
 TkwPopFormFormStyle.RegisterInEngine;
{$IfEnd} //not NoScripts

end.