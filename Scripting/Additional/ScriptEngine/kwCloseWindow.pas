unit kwCloseWindow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Костицын М.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCloseWindow.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::CloseWindow
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
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
 TkwCloseWindow = class(_kwHandleWord_)
 protected
 // realized methods
   procedure DoWithHandle(aHandle: THandle;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCloseWindow
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Messages,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCloseWindow;

{$Include ..\ScriptEngine\kwHandleWord.imp.pas}

// start class TkwCloseWindow

procedure TkwCloseWindow.DoWithHandle(aHandle: THandle;
  const aCtx: TtfwContext);
//#UC START# *510AA0900333_4F14451B00DB_var*
//#UC END# *510AA0900333_4F14451B00DB_var*
begin
//#UC START# *510AA0900333_4F14451B00DB_impl*
 SendMessage(aHandle, WM_CLOSE, 0, 0);
//#UC END# *510AA0900333_4F14451B00DB_impl*
end;//TkwCloseWindow.DoWithHandle

class function TkwCloseWindow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:CloseWindow';
end;//TkwCloseWindow.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
{$IfEnd} //not NoScripts

end.