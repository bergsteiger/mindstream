unit kwWinTreeGetCurrentText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWinTreeGetCurrentText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::WinTreeGetCurrentText
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
 TkwWinTreeGetCurrentText = {final} class(_kwHandleWord_)
 protected
 // realized methods
   procedure DoWithHandle(aHandle: THandle;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWinTreeGetCurrentText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  CommCtrl,
  l3Base,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWinTreeGetCurrentText;

{$Include ..\ScriptEngine\kwHandleWord.imp.pas}

// start class TkwWinTreeGetCurrentText

procedure TkwWinTreeGetCurrentText.DoWithHandle(aHandle: THandle;
  const aCtx: TtfwContext);
//#UC START# *510AA0900333_528E0F860390_var*
var
 l_Current: TTVItemA;
 l_Res: Boolean;
 l_Text: array[1..255] of AnsiChar;
//#UC END# *510AA0900333_528E0F860390_var*
begin
//#UC START# *510AA0900333_528E0F860390_impl*
 RunnerAssert(aHandle > 0, 'Не передан дескриптор дерева!', aCtx);
 l3FillChar(l_Current, SizeOf(l_Current));
 l_Current.hItem := TreeView_GetSelection(aHandle);
 l_Current.mask := TVIF_TEXT;
 l_Current.cchTextMax := 255;
 l_Current.pszText := @l_Text;

 l_Res := TreeView_GetItemA(aHandle, l_Current);
 if l_Res
  then aCtx.rEngine.PushString(l_Current.pszText)
  else aCtx.rEngine.PushString('');
//#UC END# *510AA0900333_528E0F860390_impl*
end;//TkwWinTreeGetCurrentText.DoWithHandle

class function TkwWinTreeGetCurrentText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WinTreeGetCurrentText';
end;//TkwWinTreeGetCurrentText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
{$IfEnd} //not NoScripts

end.