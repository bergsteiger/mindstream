unit kwWinControlFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwWinControlFromStackWord.pas"
// Начат: 26.01.2012 14:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::VCL bindings::TkwWinControlFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Controls,
  tfwScriptingInterfaces,
  kwComponentFromStackWord,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 TkwWinControlFromStackWord = {abstract} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwWinControlFromStackWord
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

// start class TkwWinControlFromStackWord

procedure TkwWinControlFromStackWord.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F212C680161_var*
//#UC END# *4F212C3A015A_4F212C680161_var*
begin
//#UC START# *4F212C3A015A_4F212C680161_impl*
 DoWinControl(aControl As TWinControl, aCtx);
//#UC END# *4F212C3A015A_4F212C680161_impl*
end;//TkwWinControlFromStackWord.DoControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwWinControlFromStackWord
 TkwWinControlFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.