unit kwBynameControlPush;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwBynameControlPush.pas"
// Начат: 26.01.2012 16:06
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::ControlsProcessing::byname_control_push
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwControlWord,
  Classes,
  tfwScriptingInterfaces,
  TypInfo,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwBynameControlPush = {scriptword} class(TkwControlWord)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoComponent(aControl: TComponent;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBynameControlPush
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Except,
  Windows,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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

function TkwBynameControlPush.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_4F2141AD0203_var*
//#UC END# *551544E2001A_4F2141AD0203_var*
begin
//#UC START# *551544E2001A_4F2141AD0203_impl*
 Result := TypeInfo(TComponent);
//#UC END# *551544E2001A_4F2141AD0203_impl*
end;//TkwBynameControlPush.GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация byname_control_push
 TkwBynameControlPush.RegisterInEngine;
{$IfEnd} //not NoScripts

end.