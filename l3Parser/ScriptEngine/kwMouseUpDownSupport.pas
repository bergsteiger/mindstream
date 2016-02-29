unit kwMouseUpDownSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseUpDownSupport.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MouseInput::TkwMouseUpDownSupport
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwSendInputSupport,
  Windows,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMouseUpDownSupport = {abstract} class(TkwSendInputSupport)
 protected
 // realized methods
   function GetInputStruct(const aCtx: TtfwContext): TInput; override;
 protected
 // protected methods
   function GetMouseEventFlag: Integer; virtual; abstract;
 end;//TkwMouseUpDownSupport
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseUpDownSupport

function TkwMouseUpDownSupport.GetInputStruct(const aCtx: TtfwContext): TInput;
//#UC START# *4F71A8960347_4F967BAD0127_var*
var
 l_P: TPoint;
//#UC END# *4F71A8960347_4F967BAD0127_var*
begin
//#UC START# *4F71A8960347_4F967BAD0127_impl*
 l3FillChar(Result, SizeOf(TInput));

 Windows.GetCursorPos(l_P);
 Result.Itype := INPUT_MOUSE;
 Result.mi.dx := l_P.X;
 Result.mi.dy := l_P.Y;
 Result.mi.dwFlags := GetMouseEventFlag;
//#UC END# *4F71A8960347_4F967BAD0127_impl*
end;//TkwMouseUpDownSupport.GetInputStruct

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwMouseUpDownSupport
 TkwMouseUpDownSupport.RegisterClass;
{$IfEnd} //not NoScripts

end.