unit kwControlMouseRightClick;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwControlMouseRightClick.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::control_MouseRightClick
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
 TkwControlMouseRightClick = {final} class(_kwControlMouseClick_)
 protected
 // realized methods
   procedure DoClick(aTarget: TWinControl;
     X: Integer;
     Y: Integer); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwControlMouseRightClick
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

type _Instance_R_ = TkwControlMouseRightClick;

{$Include ..\ScriptEngine\kwControlMouseClick.imp.pas}

// start class TkwControlMouseRightClick

procedure TkwControlMouseRightClick.DoClick(aTarget: TWinControl;
  X: Integer;
  Y: Integer);
//#UC START# *4F8ECA810288_4F8EC8BD03B5_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *4F8ECA810288_4F8EC8BD03B5_var*
begin
//#UC START# *4F8ECA810288_4F8EC8BD03B5_impl*
 with aTarget.BoundsRect do
  l_Pos := Point(Left + X, Top + Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aTarget.Handle, WM_RBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aTarget.Handle, WM_RBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *4F8ECA810288_4F8EC8BD03B5_impl*
end;//TkwControlMouseRightClick.DoClick

class function TkwControlMouseRightClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'control:MouseRightClick';
end;//TkwControlMouseRightClick.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlMouseClick.imp.pas}
{$IfEnd} //not NoScripts

end.