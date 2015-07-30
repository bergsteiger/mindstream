unit kwComboBoxFromStack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "kwComboBoxFromStack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$VT::vtComboBoxWords::TkwComboBoxFromStack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  FakeBox,
  StdCtrls,
  tfwScriptingInterfaces,
  Controls,
  kwComponentFromStackWord,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 TkwComboBoxFromStack = {abstract} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); virtual; abstract;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwComboBoxFromStack
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class TkwComboBoxFromStack

procedure TkwComboBoxFromStack.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_5049C6B900E3_var*
//#UC END# *4F212C3A015A_5049C6B900E3_var*
begin
//#UC START# *4F212C3A015A_5049C6B900E3_impl*
 if aControl is TCustomCombo then
  DoWithComboBox(aControl as TCustomCombo, aCtx)
 else
 if aControl is TFakeBox then
  DoWithFakeBox(aControl as TFakeBox, aCtx)
 else
  RunnerError('В слово ' + Key.AsString + ' передан неверный тип контрола.', aCtx);
//#UC END# *4F212C3A015A_5049C6B900E3_impl*
end;//TkwComboBoxFromStack.DoControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwComboBoxFromStack
 TkwComboBoxFromStack.RegisterClass;
{$IfEnd} //not NoScripts

end.