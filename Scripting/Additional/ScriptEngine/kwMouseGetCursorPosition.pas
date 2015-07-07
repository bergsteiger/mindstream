unit kwMouseGetCursorPosition;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseGetCursorPosition.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::mouse_GetCursorPosition
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwMouseGetCursorPosition = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseGetCursorPosition
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMouseGetCursorPosition;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.