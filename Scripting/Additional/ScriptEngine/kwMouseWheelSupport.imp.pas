{$IfNDef kwMouseWheelSupport_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseWheelSupport.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::kwMouseWheelSupport
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwMouseWheelSupport_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSendInputSupport.imp.pas}
 _kwMouseWheelSupport_ = {mixin} class(_kwSendInputSupport_)
 protected
 // realized methods
   function GetInputStruct(const aCtx: TtfwContext): TInput; override;
 protected
 // protected methods
   function GetLineCount(const aCtx: TtfwContext): Integer; virtual; abstract;
 end;//_kwMouseWheelSupport_
{$IfEnd} //not NoScripts

{$Else kwMouseWheelSupport_imp}

{$IfNDef kwMouseWheelSupport_imp_impl}
{$Define kwMouseWheelSupport_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwSendInputSupport.imp.pas}

// start class _kwMouseWheelSupport_

function _kwMouseWheelSupport_.GetInputStruct(const aCtx: TtfwContext): TInput;
//#UC START# *4F71A8960347_50C852B30225_var*
var
 l_P: TPoint;
//#UC END# *4F71A8960347_50C852B30225_var*
begin
//#UC START# *4F71A8960347_50C852B30225_impl*
 l3FillChar(Result, SizeOf(TInput));

 Windows.GetCursorPos(l_P);
 Result.Itype := INPUT_MOUSE;
 Result.mi.dx := l_P.X;
 Result.mi.dy := l_P.Y;
 Result.mi.mouseData := DWORD(WHEEL_DELTA * GetLineCount(aCtx)); // msdn://MOUSEINPUT
                                                         //mouseData
          //If dwFlags contains MOUSEEVENTF_WHEEL, then mouseData provides the amount of wheel movement.
          //A positive value indicates that the wheel was rotated forward, away from the user; a negative
          //value indicates that the wheel was rotated backward, toward the user. One wheel click is
          //defined as WHEEL_DELTA, which is 120.
 Result.mi.dwFlags := MOUSEEVENTF_WHEEL;
//#UC END# *4F71A8960347_50C852B30225_impl*
end;//_kwMouseWheelSupport_.GetInputStruct

{$IfEnd} //not NoScripts

{$Else  kwMouseWheelSupport_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSendInputSupport.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwMouseWheelSupport_imp_impl}
{$EndIf kwMouseWheelSupport_imp}
