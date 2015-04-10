unit kwPopControlGetLeft;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlGetLeft.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_GetLeft
//
// pop:Control:GetLeft - помещает X координату контрола.
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
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 TkwPopControlGetLeft = {final} class(_kwControlFromStackWord_)
  {* pop:Control:GetLeft - помещает X координату контрола. }
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlGetLeft
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

type _Instance_R_ = TkwPopControlGetLeft;

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class TkwPopControlGetLeft

procedure TkwPopControlGetLeft.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F7061040361_var*
//#UC END# *4F212C3A015A_4F7061040361_var*
begin
//#UC START# *4F212C3A015A_4F7061040361_impl*
 aCtx.rEngine.PushInt(aControl.Left);
//#UC END# *4F212C3A015A_4F7061040361_impl*
end;//TkwPopControlGetLeft.DoControl

class function TkwPopControlGetLeft.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:GetLeft';
end;//TkwPopControlGetLeft.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.