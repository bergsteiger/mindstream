unit kwMouseGetCursorIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Костицын М.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseGetCursorIndex.pas"
// Начат: 16.12.2011
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::mouse_GetCursorIndex
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
 TkwMouseGetCursorIndex = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseGetCursorIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Messages,
  Windows,
  Forms,
  Controls,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMouseGetCursorIndex;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMouseGetCursorIndex

procedure TkwMouseGetCursorIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EEB67C500AE_var*
var
 l_CursorPos: TPoint;
 l_Window: THandle;
 l_HitTest: Longint;
 l_Index: TCursor;
 l_Cursor: HCURSOR;
//#UC END# *4DAEEDE10285_4EEB67C500AE_var*
begin
//#UC START# *4DAEEDE10285_4EEB67C500AE_impl*
 GetCursorPos(l_CursorPos);
 l_Window := WindowFromPoint(l_CursorPos);
 l_HitTest := SendMessage(l_Window, WM_NCHITTEST, 0, LongInt(PointToSmallPoint(l_CursorPos)));
 SendMessage(l_Window, WM_SETCURSOR, l_Window, MakeLong(l_HitTest, WM_MOUSEMOVE));

 l_Cursor := Windows.GetCursor;
 for l_Index := crSizeAll to crDefault do
  if Forms.Screen.Cursors[l_Index] = l_Cursor then
  begin
   aCtx.rEngine.PushInt(Integer(l_Index));
   Exit;
  end;

 aCtx.rEngine.PushInt(Integer(crDefault));
//#UC END# *4DAEEDE10285_4EEB67C500AE_impl*
end;//TkwMouseGetCursorIndex.DoDoIt

class function TkwMouseGetCursorIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'mouse:GetCursorIndex';
end;//TkwMouseGetCursorIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.