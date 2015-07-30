unit kwSubPanelGetPopupMenuForSub;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubPanelGetPopupMenuForSub.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::SubPanel_GetPopupMenuForSub
//
// *Описание*: возвращает меню для саба на сабпанели.
// *Формат:*
// {code}
// aSubPanel aSubPanelSub SubPanel:GetPopupMenuForSub
// {code}
// aSubPanel - контрол саб панели.
// aSubPanelSub - объект класса TevSubPanelSub
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwSubPanelFromStackWord,
  tfwScriptingInterfaces,
  evSubPn
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSubPanelGetPopupMenuForSub = {final scriptword} class(TkwSubPanelFromStackWord)
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
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubPanelGetPopupMenuForSub
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evSubPanelSub,
  nevFacade,
  l3Interfaces,
  Types,
  l3PopupMenuHelper
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwSubPanelGetPopupMenuForSub

procedure TkwSubPanelGetPopupMenuForSub.DoWithSubPanel(aControl: TevCustomSubPanel;
  const aCtx: TtfwContext);
//#UC START# *52D6471802DC_53EE014B03AC_var*
var
 l_SPoint     : Tl3_SPoint;
 l_SubPanelSub: TevSubPanelSub;
//#UC END# *52D6471802DC_53EE014B03AC_var*
begin
//#UC START# *52D6471802DC_53EE014B03AC_impl*
 //aControl.PopupMenu;
 RunnerAssert(aCtx.rEngine.IsTopObj, 'Не задан объект класса aSubPanelSub!', aCtx);
 l_SubPanelSub := aCtx.rEngine.PopObj as TevSubPanelSub;
 l_SPoint := nev.CrtIC.LP2DP(l_SubPanelSub.DrawRect.TopLeft);
 aCtx.rEngine.PushObj(Tl3PopupMenuHelper.Instance.GetPopupMenu(aControl, Point(l_SPoint.X, l_SPoint.Y)));
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
// Регистрация SubPanel_GetPopupMenuForSub
 TkwSubPanelGetPopupMenuForSub.RegisterInEngine;
{$IfEnd} //not NoScripts

end.