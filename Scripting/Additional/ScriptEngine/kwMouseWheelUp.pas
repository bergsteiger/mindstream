unit kwMouseWheelUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseWheelUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_WheelUp
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwMouseWheelSupport,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMouseWheelUp = {final scriptword} class(TkwMouseWheelSupport)
 protected
 // realized methods
   function GetLineCount(const aCtx: TtfwContext): Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseWheelUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseWheelUp

function TkwMouseWheelUp.GetLineCount(const aCtx: TtfwContext): Integer;
//#UC START# *50C861750031_50C8531900E4_var*
//#UC END# *50C861750031_50C8531900E4_var*
begin
//#UC START# *50C861750031_50C8531900E4_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задано количество линий для прокрутки', aCtx);
 Result := aCtx.rEngine.PopInt;
//#UC END# *50C861750031_50C8531900E4_impl*
end;//TkwMouseWheelUp.GetLineCount

class function TkwMouseWheelUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:WheelUp';
end;//TkwMouseWheelUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_WheelUp
 TkwMouseWheelUp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.