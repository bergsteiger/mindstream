unit kwMouseGetCursorNameByIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseGetCursorNameByIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::mouse_GetCursorNameByIndex
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
 TkwMouseGetCursorNameByIndex = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseGetCursorNameByIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Controls,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMouseGetCursorNameByIndex;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.