unit kwControlMouseMiddleClick;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwControlMouseMiddleClick.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::control_MouseMiddleClick
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
 {$Include ..\ScriptEngine\kwControlMouseClick.imp.pas}
 TkwControlMouseMiddleClick = {final} class(_kwControlMouseClick_)
 protected
 // realized methods
   procedure DoClick(aTarget: TWinControl;
     X: Integer;
     Y: Integer); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwControlMouseMiddleClick
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Messages,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwControlMouseMiddleClick;

{$Include ..\ScriptEngine\kwControlMouseClick.imp.pas}

// start class TkwControlMouseMiddleClick

procedure TkwControlMouseMiddleClick.DoClick(aTarget: TWinControl;
  X: Integer;
  Y: Integer);
//#UC START# *4F8ECA810288_4F8EC8CA00E2_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *4F8ECA810288_4F8EC8CA00E2_var*
begin
//#UC START# *4F8ECA810288_4F8EC8CA00E2_impl*
 with aTarget.BoundsRect do
  l_Pos := Point(Left + X, Top + Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aTarget.Handle, WM_MBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aTarget.Handle, WM_MBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *4F8ECA810288_4F8EC8CA00E2_impl*
end;//TkwControlMouseMiddleClick.DoClick

class function TkwControlMouseMiddleClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'control:MouseMiddleClick';
end;//TkwControlMouseMiddleClick.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlMouseClick.imp.pas}
{$IfEnd} //not NoScripts

end.