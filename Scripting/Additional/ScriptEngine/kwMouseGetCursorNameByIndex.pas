unit kwMouseGetCursorNameByIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseGetCursorNameByIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::mouse_GetCursorNameByIndex
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
 TkwMouseGetCursorNameByIndex = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseGetCursorNameByIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseGetCursorNameByIndex

procedure TkwMouseGetCursorNameByIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EF09324028B_var*
var
 l_CursorIndex: TCursor;
//#UC END# *4DAEEDE10285_4EF09324028B_var*
begin
//#UC START# *4DAEEDE10285_4EF09324028B_impl*
 l_CursorIndex := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushString(Controls.CursorToString(l_CursorIndex));
//#UC END# *4DAEEDE10285_4EF09324028B_impl*
end;//TkwMouseGetCursorNameByIndex.DoDoIt

class function TkwMouseGetCursorNameByIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'mouse:GetCursorNameByIndex';
end;//TkwMouseGetCursorNameByIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация mouse_GetCursorNameByIndex
 TkwMouseGetCursorNameByIndex.RegisterInEngine;
{$IfEnd} //not NoScripts

end.