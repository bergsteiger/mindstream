unit kwPopControlCanFocus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlCanFocus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_CanFocus
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
 TkwPopControlCanFocus = class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlCanFocus
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

type _Instance_R_ = TkwPopControlCanFocus;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlCanFocus

procedure TkwPopControlCanFocus.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F215A290369_var*
//#UC END# *4F212C930149_4F215A290369_var*
begin
//#UC START# *4F212C930149_4F215A290369_impl*
 aCtx.rEngine.PushBool(aControl.CanFocus);
//#UC END# *4F212C930149_4F215A290369_impl*
end;//TkwPopControlCanFocus.DoWinControl

class function TkwPopControlCanFocus.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:CanFocus';
end;//TkwPopControlCanFocus.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.