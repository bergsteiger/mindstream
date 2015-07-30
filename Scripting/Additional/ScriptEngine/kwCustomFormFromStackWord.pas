unit kwCustomFormFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwCustomFormFromStackWord.pas"
// Начат: 02.02.2012 14:47
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::VCL bindings::TkwCustomFormFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Forms,
  tfwScriptingInterfaces,
  kwWinControlFromStackWord,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCustomFormFromStackWord = {abstract} class(TkwWinControlFromStackWord)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoCustomForm(aForm: TCustomForm;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwCustomFormFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

type
  TCustomFormHack = {abstract} class(TCustomForm)
  end;//TCustomFormHack

// start class TkwCustomFormFromStackWord

procedure TkwCustomFormFromStackWord.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F2A69AA03AE_var*
//#UC END# *4F212C930149_4F2A69AA03AE_var*
begin
//#UC START# *4F212C930149_4F2A69AA03AE_impl*
 DoCustomForm(aControl As TCustomForm, aCtx);
//#UC END# *4F212C930149_4F2A69AA03AE_impl*
end;//TkwCustomFormFromStackWord.DoWinControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCustomFormFromStackWord
 TkwCustomFormFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.