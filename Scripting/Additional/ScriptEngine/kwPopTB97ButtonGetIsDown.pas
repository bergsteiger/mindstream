unit kwPopTB97ButtonGetIsDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopTB97ButtonGetIsDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_TB97Button_GetIsDown
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
  tb97Ctls,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwTB97ButtonFromStackWord.imp.pas}
 TkwPopTB97ButtonGetIsDown = {final} class(_kwTB97ButtonFromStackWord_)
 protected
 // realized methods
   procedure DoButton(aButton: TCustomToolbarButton97;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopTB97ButtonGetIsDown
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

type _Instance_R_ = TkwPopTB97ButtonGetIsDown;

{$Include ..\ScriptEngine\kwTB97ButtonFromStackWord.imp.pas}

// start class TkwPopTB97ButtonGetIsDown

procedure TkwPopTB97ButtonGetIsDown.DoButton(aButton: TCustomToolbarButton97;
  const aCtx: TtfwContext);
//#UC START# *4F69EFDD0359_4F69F01D0141_var*
//#UC END# *4F69EFDD0359_4F69F01D0141_var*
begin
//#UC START# *4F69EFDD0359_4F69F01D0141_impl*
 aCtx.rEngine.PushBool(aButton.Down);
//#UC END# *4F69EFDD0359_4F69F01D0141_impl*
end;//TkwPopTB97ButtonGetIsDown.DoButton

class function TkwPopTB97ButtonGetIsDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TB97Button:GetIsDown';
end;//TkwPopTB97ButtonGetIsDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTB97ButtonFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.