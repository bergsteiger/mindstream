unit kwBynameControlPush;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBynameControlPush.pas"
// Начат: 26.01.2012 16:06
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::byname_control_push
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
  Classes,
  Controls,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwControlWord.imp.pas}
 TkwBynameControlPush = class(_kwControlWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure DoComponent(aControl: TComponent;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBynameControlPush
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptEngine,
  l3Except
  {$If not defined(NoVCM)}
  ,
  vcmForm
  {$IfEnd} //not NoVCM
  ,
  afwFacade,
  SysUtils,
  tfwAutoregisteredDiction,
  Windows,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwBynameControlPush;

{$Include ..\ScriptEngine\kwControlWord.imp.pas}

// start class TkwBynameControlPush

procedure TkwBynameControlPush.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4DB98B990054_4F2141AD0203_var*
//#UC END# *4DB98B990054_4F2141AD0203_var*
begin
//#UC START# *4DB98B990054_4F2141AD0203_impl*
 aCtx.rEngine.PushObj(aControl);
//#UC END# *4DB98B990054_4F2141AD0203_impl*
end;//TkwBynameControlPush.DoControl

class function TkwBynameControlPush.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'byname:control:push';
end;//TkwBynameControlPush.GetWordNameForRegister

procedure TkwBynameControlPush.DoComponent(aControl: TComponent;
  const aCtx: TtfwContext);
//#UC START# *5357B6FB0024_4F2141AD0203_var*
//#UC END# *5357B6FB0024_4F2141AD0203_var*
begin
//#UC START# *5357B6FB0024_4F2141AD0203_impl*
 aCtx.rEngine.PushObj(aControl);
//#UC END# *5357B6FB0024_4F2141AD0203_impl*
end;//TkwBynameControlPush.DoComponent

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.