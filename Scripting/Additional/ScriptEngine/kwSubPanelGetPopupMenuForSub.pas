unit kwSubPanelGetPopupMenuForSub;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSubPanelGetPopupMenuForSub.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::SubPanel_GetPopupMenuForSub
//
// *Описание*: возвращает меню для саба на сабпанели.
// *Формат:*
// {code}
// aSubPanel aSubPanelSub SubPanel:GetPopupMenuForSub
// {code}
// aSubPanel - контрол саб панели.
// aSubPanelSub - объект класса TevSubPanelSub
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
  tfwScriptingInterfaces,
  evSubPn,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}
 TkwSubPanelGetPopupMenuForSub = {final} class(_kwSubPanelFromStackWord_)
  {* *Описание*: возвращает меню для саба на сабпанели.
*Формат:*
[code]
aSubPanel aSubPanelSub SubPanel:GetPopupMenuForSub
[code]
aSubPanel - контрол саб панели.
aSubPanelSub - объект класса TevSubPanelSub }
 protected
 // realized methods
   procedure DoWithSubPanel(aControl: TevCustomSubPanel;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubPanelGetPopupMenuForSub
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evSubPanelSub,
  nevFacade
  {$If not defined(NoVCM)}
  ,
  vcmBaseMenuManager
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmMenuManager
  {$IfEnd} //not NoVCM
  ,
  l3Interfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSubPanelGetPopupMenuForSub;

{$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}

// start class TkwSubPanelGetPopupMenuForSub

procedure TkwSubPanelGetPopupMenuForSub.DoWithSubPanel(aControl: TevCustomSubPanel;
  const aCtx: TtfwContext);
//#UC START# *52D6471802DC_53EE014B03AC_var*
var
 {$IfNDef NoVCM}
 l_SPoint     : Tl3_SPoint;
 {$EndIf  NoVCM}
 l_SubPanelSub: TevSubPanelSub;
//#UC END# *52D6471802DC_53EE014B03AC_var*
begin
//#UC START# *52D6471802DC_53EE014B03AC_impl*
 //aControl.PopupMenu;
 RunnerAssert(aCtx.rEngine.IsTopObj, 'Не задан объект класса aSubPanelSub!', aCtx);
 l_SubPanelSub := aCtx.rEngine.PopObj as TevSubPanelSub;
 {$IfNDef NoVCM}
 l_SPoint := nev.CrtIC.LP2DP(l_SubPanelSub.DrawRect.TopLeft);
 aCtx.rEngine.PushObj((g_MenuManager As TvcmCustomMenuManager).FillPopupMenu(Point(l_SPoint.X, l_SPoint.Y), aControl).Items);
 {$EndIf  NoVCM}
//#UC END# *52D6471802DC_53EE014B03AC_impl*
end;//TkwSubPanelGetPopupMenuForSub.DoWithSubPanel

class function TkwSubPanelGetPopupMenuForSub.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SubPanel:GetPopupMenuForSub';
end;//TkwSubPanelGetPopupMenuForSub.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.