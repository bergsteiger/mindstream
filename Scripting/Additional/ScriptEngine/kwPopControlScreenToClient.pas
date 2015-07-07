unit kwPopControlScreenToClient;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlScreenToClient.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_ScreenToClient
//
// X Y pop:Control:ScreenToClient - переводит координаты координаты относительно начальной точки
// экрана в координаты относительно контрола. В стеке будут два значения в том же порядке.
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
 TkwPopControlScreenToClient = {final} class(_kwControlFromStackWord_)
  {* X Y pop:Control:ScreenToClient - переводит координаты координаты относительно начальной точки экрана в координаты относительно контрола. В стеке будут два значения в том же порядке. }
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlScreenToClient
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Types,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlScreenToClient;

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class TkwPopControlScreenToClient

procedure TkwPopControlScreenToClient.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F7151D10065_var*
var
 l_X: Integer;
 l_Y: Integer;
 l_Point: TPoint;
//#UC END# *4F212C3A015A_4F7151D10065_var*
begin
//#UC START# *4F212C3A015A_4F7151D10065_impl*
 l_X := 0;
 l_Y := 0;
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задана Y-координата!', aCtx);
 l_Y := aCtx.rEngine.PopInt;
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задана X-координата!', aCtx);
 l_X := aCtx.rEngine.PopInt;
 
 l_Point := aControl.ScreenToClient((Point(l_X, l_Y)));
 aCtx.rEngine.PushInt(l_Point.X);
 aCtx.rEngine.PushInt(l_Point.Y);
//#UC END# *4F212C3A015A_4F7151D10065_impl*
end;//TkwPopControlScreenToClient.DoControl

class function TkwPopControlScreenToClient.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:ScreenToClient';
end;//TkwPopControlScreenToClient.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.