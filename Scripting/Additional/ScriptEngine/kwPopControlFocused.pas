unit kwPopControlFocused;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlFocused.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_Focused
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
 TkwPopControlFocused = class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlFocused
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

type _Instance_R_ = TkwPopControlFocused;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlFocused

procedure TkwPopControlFocused.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F215A3E005C_var*
//#UC END# *4F212C930149_4F215A3E005C_var*
begin
//#UC START# *4F212C930149_4F215A3E005C_impl*
 aCtx.rEngine.PushBool(aControl.Focused);
//#UC END# *4F212C930149_4F215A3E005C_impl*
end;//TkwPopControlFocused.DoWinControl

class function TkwPopControlFocused.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:Focused';
end;//TkwPopControlFocused.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.