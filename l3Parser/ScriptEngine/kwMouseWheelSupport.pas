unit kwMouseWheelSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseWheelSupport.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MouseInput::TkwMouseWheelSupport
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwSendInputSupport,
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMouseWheelSupport = {abstract} class(TkwSendInputSupport)
 protected
 // realized methods
   function GetInputStruct(const aCtx: TtfwContext): TInput; override;
 protected
 // protected methods
   function GetLineCount(const aCtx: TtfwContext): Integer; virtual; abstract;
 end;//TkwMouseWheelSupport
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseWheelSupport

function TkwMouseWheelSupport.GetInputStruct(const aCtx: TtfwContext): TInput;
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
end;//TkwMouseWheelSupport.GetInputStruct

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwMouseWheelSupport
 TkwMouseWheelSupport.RegisterClass;
{$IfEnd} //not NoScripts

end.