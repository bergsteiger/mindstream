unit kwMouseWheelDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseWheelDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_WheelDown
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
 TkwMouseWheelDown = {final scriptword} class(TkwMouseWheelSupport)
 protected
 // realized methods
   function GetLineCount(const aCtx: TtfwContext): Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseWheelDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseWheelDown

function TkwMouseWheelDown.GetLineCount(const aCtx: TtfwContext): Integer;
//#UC START# *50C861750031_50C8532700B0_var*
//#UC END# *50C861750031_50C8532700B0_var*
begin
//#UC START# *50C861750031_50C8532700B0_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задано количество линий для прокрутки', aCtx);
 Result := - aCtx.rEngine.PopInt;
//#UC END# *50C861750031_50C8532700B0_impl*
end;//TkwMouseWheelDown.GetLineCount

class function TkwMouseWheelDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:WheelDown';
end;//TkwMouseWheelDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_WheelDown
 TkwMouseWheelDown.RegisterInEngine;
{$IfEnd} //not NoScripts

end.