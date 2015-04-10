unit kwPopControlGetPopupMenu;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlGetPopupMenu.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_GetPopupMenu
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
 TkwPopControlGetPopupMenu = {final} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlGetPopupMenu
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  {$If not defined(NoVCM)}
  ,
  vcmBaseMenuManager
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmMenuManager
  {$IfEnd} //not NoVCM
  ,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlGetPopupMenu;

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class TkwPopControlGetPopupMenu

procedure TkwPopControlGetPopupMenu.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4FC728690285_var*
var
 l_Pt : TPoint;
//#UC END# *4F212C3A015A_4FC728690285_var*
begin
//#UC START# *4F212C3A015A_4FC728690285_impl*
 l_Pt.Y := aCtx.rEngine.PopInt;
 l_Pt.X := aCtx.rEngine.PopInt;
 {$IfDef NoVCM}
 aCtx.rEngine.PushObj(THackControl(aControl).PopupMenu);
 {$ELSE}
 aCtx.rEngine.PushObj((g_MenuManager As TvcmCustomMenuManager).FillPopupMenu(l_Pt, aControl).Items);
 {$EndIf  NoVCM}
//#UC END# *4F212C3A015A_4FC728690285_impl*
end;//TkwPopControlGetPopupMenu.DoControl

class function TkwPopControlGetPopupMenu.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:GetPopupMenu';
end;//TkwPopControlGetPopupMenu.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.