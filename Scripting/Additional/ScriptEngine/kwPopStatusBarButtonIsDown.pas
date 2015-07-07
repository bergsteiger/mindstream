unit kwPopStatusBarButtonIsDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopStatusBarButtonIsDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::pop_StatusBarButton_IsDown
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  nscStatusBarButton,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwStatusBarButtonWord.imp.pas}
 TkwPopStatusBarButtonIsDown = {final} class(_kwStatusBarButtonWord_)
 protected
 // realized methods
   procedure DoButton(aControl: TnscStatusBarButton;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopStatusBarButtonIsDown
{$IfEnd} //Nemesis AND not NoScripts

implementation

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}

type _Instance_R_ = TkwPopStatusBarButtonIsDown;

{$Include ..\ScriptEngine\kwStatusBarButtonWord.imp.pas}

// start class TkwPopStatusBarButtonIsDown

procedure TkwPopStatusBarButtonIsDown.DoButton(aControl: TnscStatusBarButton;
  const aCtx: TtfwContext);
//#UC START# *512665E700FB_512667C30021_var*
//#UC END# *512665E700FB_512667C30021_var*
begin
//#UC START# *512665E700FB_512667C30021_impl*
 aCtx.rEngine.PushBool(aControl.Down);
//#UC END# *512665E700FB_512667C30021_impl*
end;//TkwPopStatusBarButtonIsDown.DoButton

class function TkwPopStatusBarButtonIsDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:StatusBarButton:IsDown';
end;//TkwPopStatusBarButtonIsDown.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwStatusBarButtonWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.