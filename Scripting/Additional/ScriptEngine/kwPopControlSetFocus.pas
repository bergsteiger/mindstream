unit kwPopControlSetFocus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlSetFocus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_SetFocus
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
 TkwPopControlSetFocus = class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlSetFocus
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlSetFocus;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlSetFocus

procedure TkwPopControlSetFocus.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F215A4903E5_var*
//#UC END# *4F212C930149_4F215A4903E5_var*
begin
//#UC START# *4F212C930149_4F215A4903E5_impl*
 if aControl.CanFocus then
  aControl.SetFocus;
 aCtx.rEngine.PushBool(aControl.Focused);
//#UC END# *4F212C930149_4F215A4903E5_impl*
end;//TkwPopControlSetFocus.DoWinControl

class function TkwPopControlSetFocus.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:SetFocus';
end;//TkwPopControlSetFocus.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.