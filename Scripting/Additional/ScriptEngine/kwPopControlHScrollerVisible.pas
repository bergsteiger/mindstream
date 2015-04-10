unit kwPopControlHScrollerVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlHScrollerVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_HScrollerVisible
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
  Forms,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwScrollingWinControlFromStack.imp.pas}
 TkwPopControlHScrollerVisible = {final} class(_kwScrollingWinControlFromStack_)
 protected
 // realized methods
   procedure DoWithScrollWinControl(aScrollWinControl: TScrollingWinControl;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlHScrollerVisible
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlHScrollerVisible;

{$Include ..\ScriptEngine\kwScrollingWinControlFromStack.imp.pas}

// start class TkwPopControlHScrollerVisible

procedure TkwPopControlHScrollerVisible.DoWithScrollWinControl(aScrollWinControl: TScrollingWinControl;
  const aCtx: TtfwContext);
//#UC START# *4FA25CC801A6_4FA25B6E00BD_var*
//#UC END# *4FA25CC801A6_4FA25B6E00BD_var*
begin
//#UC START# *4FA25CC801A6_4FA25B6E00BD_impl*
 aCtx.rEngine.PushBool(aScrollWinControl.HorzScrollBar.IsScrollBarVisible);
//#UC END# *4FA25CC801A6_4FA25B6E00BD_impl*
end;//TkwPopControlHScrollerVisible.DoWithScrollWinControl

class function TkwPopControlHScrollerVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:HScrollerVisible';
end;//TkwPopControlHScrollerVisible.GetWordNameForRegister

procedure TkwPopControlHScrollerVisible.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4FA25B6E00BD_var*
var
 l_Result   : Boolean;
 l_PageMax  : Integer;
 l_RangeMax : Integer;
 l_PageInfo : TScrollInfo;
//#UC END# *4F212C930149_4FA25B6E00BD_var*
begin
//#UC START# *4F212C930149_4FA25B6E00BD_impl*
 with l_PageInfo do
 begin
  cbSize := SizeOf(l_PageInfo);
  fMask := SIF_ALL;
 end;//with l_ScrollInfo
 GetScrollInfo(aControl.Handle, SB_HORZ, l_PageInfo);
 l_PageMax := l_PageInfo.nPage;
 l_RangeMax := l_PageInfo.nMax;
 l_Result := l_RangeMax > l_PageMax;
 aCtx.rEngine.PushBool(l_Result);
//#UC END# *4F212C930149_4FA25B6E00BD_impl*
end;//TkwPopControlHScrollerVisible.DoWinControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwScrollingWinControlFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.