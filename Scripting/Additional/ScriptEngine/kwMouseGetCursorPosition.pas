unit kwMouseGetCursorPosition;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseGetCursorPosition.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::mouse_GetCursorPosition
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMouseGetCursorPosition = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseGetCursorPosition
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseGetCursorPosition

procedure TkwMouseGetCursorPosition.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EF0937D000A_var*
var
 l_CursorPos: TPoint;
//#UC END# *4DAEEDE10285_4EF0937D000A_var*
begin
//#UC START# *4DAEEDE10285_4EF0937D000A_impl*
 Windows.GetCursorPos(l_CursorPos);
 aCtx.rEngine.PushInt(l_CursorPos.X);
 aCtx.rEngine.PushInt(l_CursorPos.Y);
//#UC END# *4DAEEDE10285_4EF0937D000A_impl*
end;//TkwMouseGetCursorPosition.DoDoIt

class function TkwMouseGetCursorPosition.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'mouse:GetCursorPosition';
end;//TkwMouseGetCursorPosition.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация mouse_GetCursorPosition
 TkwMouseGetCursorPosition.RegisterInEngine;
{$IfEnd} //not NoScripts

end.