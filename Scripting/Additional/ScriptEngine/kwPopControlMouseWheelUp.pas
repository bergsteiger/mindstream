unit kwPopControlMouseWheelUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlMouseWheelUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_MouseWheelUp
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
  Controls,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 TkwPopControlMouseWheelUp = {final} class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlMouseWheelUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Messages,
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlMouseWheelUp;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlMouseWheelUp

procedure TkwPopControlMouseWheelUp.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_50C853C90027_var*
//#UC END# *4F212C930149_50C853C90027_var*
begin
//#UC START# *4F212C930149_50C853C90027_impl*
 SendMessage(aControl.Handle, WM_VSCROLL, MakeWParam(SB_LINEUP, 0), 0);
//#UC END# *4F212C930149_50C853C90027_impl*
end;//TkwPopControlMouseWheelUp.DoWinControl

class function TkwPopControlMouseWheelUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:MouseWheelUp';
end;//TkwPopControlMouseWheelUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.