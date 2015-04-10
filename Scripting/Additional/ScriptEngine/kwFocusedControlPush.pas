unit kwFocusedControlPush;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFocusedControlPush.pas"
// Начат: 26.01.2012 14:30
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::focused_control_push
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwFocusedControlWord.imp.pas}
 TkwFocusedControlPush = class(_kwFocusedControlWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFocusedControlPush
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

type _Instance_R_ = TkwFocusedControlPush;

{$Include ..\ScriptEngine\kwFocusedControlWord.imp.pas}

// start class TkwFocusedControlPush

procedure TkwFocusedControlPush.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F21267E03CE_4F212B0501A8_var*
//#UC END# *4F21267E03CE_4F212B0501A8_var*
begin
//#UC START# *4F21267E03CE_4F212B0501A8_impl*
 aCtx.rEngine.PushObj(aControl);
//#UC END# *4F21267E03CE_4F212B0501A8_impl*
end;//TkwFocusedControlPush.DoControl

class function TkwFocusedControlPush.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'focused:control:push';
end;//TkwFocusedControlPush.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwFocusedControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.