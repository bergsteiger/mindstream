unit kwPopRadioButtonSetChecked;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopRadioButtonSetChecked.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_RadioButton_SetChecked
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
  StdCtrls,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwRadioButtonFromStackWord.imp.pas}
 TkwPopRadioButtonSetChecked = {final} class(_kwRadioButtonFromStackWord_)
 protected
 // realized methods
   procedure DoWithRadioButton(aControl: TRadioButton;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopRadioButtonSetChecked
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

type _Instance_R_ = TkwPopRadioButtonSetChecked;

{$Include ..\ScriptEngine\kwRadioButtonFromStackWord.imp.pas}

// start class TkwPopRadioButtonSetChecked

procedure TkwPopRadioButtonSetChecked.DoWithRadioButton(aControl: TRadioButton;
  const aCtx: TtfwContext);
//#UC START# *4F69B9D303C5_4F69BA950324_var*
//#UC END# *4F69B9D303C5_4F69BA950324_var*
begin
//#UC START# *4F69B9D303C5_4F69BA950324_impl*
 aControl.Checked := aCtx.rEngine.PopBool;
//#UC END# *4F69B9D303C5_4F69BA950324_impl*
end;//TkwPopRadioButtonSetChecked.DoWithRadioButton

class function TkwPopRadioButtonSetChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RadioButton:SetChecked';
end;//TkwPopRadioButtonSetChecked.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwRadioButtonFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.