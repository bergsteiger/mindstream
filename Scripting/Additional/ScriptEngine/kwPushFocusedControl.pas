unit kwPushFocusedControl;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPushFocusedControl.pas"
// Начат: 26.01.2012 14:30
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwPushFocusedControl
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

uses
  Controls,
  tfwScriptingInterfaces
  ;

type
 {$Include w:\common\components\rtl\Garant\ScriptEngine\kwFocusedControlWord.imp.pas}
 TkwPushFocusedControl = class(_kwFocusedControlWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPushFocusedControl

implementation

uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;

type _Instance_R_ = TkwPushFocusedControl;
type _kwFocusedControlWord_R_ = TkwPushFocusedControl;

{$Include w:\common\components\rtl\Garant\ScriptEngine\kwFocusedControlWord.imp.pas}

// start class TkwPushFocusedControl

procedure TkwPushFocusedControl.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F21267E03CE_4F212B0501A8_var*
//#UC END# *4F21267E03CE_4F212B0501A8_var*
begin
//#UC START# *4F21267E03CE_4F212B0501A8_impl*
 aCtx.rEngine.PushObj(aControl);
//#UC END# *4F21267E03CE_4F212B0501A8_impl*
end;//TkwPushFocusedControl.DoControl

class function TkwPushFocusedControl.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F212B0501A8_var*
//#UC END# *4DB0614603C8_4F212B0501A8_var*
begin
//#UC START# *4DB0614603C8_4F212B0501A8_impl*
 Result := 'focused:control:push';
//#UC END# *4DB0614603C8_4F212B0501A8_impl*
end;//TkwPushFocusedControl.GetWordNameForRegister

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\ScriptEngine\kwPushFocusedControl.pas initialization enter'); {$EndIf}
 {$Include w:\common\components\rtl\Garant\ScriptEngine\kwFocusedControlWord.imp.pas}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\ScriptEngine\kwPushFocusedControl.pas initialization leave'); {$EndIf}
end.

