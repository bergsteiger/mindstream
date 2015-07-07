unit kwPopControlVScrollerVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlVScrollerVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_VScrollerVisible
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
 TkwPopControlVScrollerVisible = {final} class(_kwScrollingWinControlFromStack_)
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
 end;//TkwPopControlVScrollerVisible
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

type _Instance_R_ = TkwPopControlVScrollerVisible;

{$Include ..\ScriptEngine\kwScrollingWinControlFromStack.imp.pas}

// start class TkwPopControlVScrollerVisible

procedure TkwPopControlVScrollerVisible.DoWithScrollWinControl(aScrollWinControl: TScrollingWinControl;
  const aCtx: TtfwContext);
//#UC START# *4FA25CC801A6_4FA25B25007B_var*
//#UC END# *4FA25CC801A6_4FA25B25007B_var*
begin
//#UC START# *4FA25CC801A6_4FA25B25007B_impl*
 aCtx.rEngine.PushBool(aScrollWinControl.VertScrollBar.IsScrollBarVisible);
//#UC END# *4FA25CC801A6_4FA25B25007B_impl*
end;//TkwPopControlVScrollerVisible.DoWithScrollWinControl

class function TkwPopControlVScrollerVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:VScrollerVisible';
end;//TkwPopControlVScrollerVisible.GetWordNameForRegister

procedure TkwPopControlVScrollerVisible.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4FA25B25007B_var*
var
 l_Result   : Boolean;
 l_PageMax  : Integer;
 l_RangeMax : Integer;
 l_PageInfo : TScrollInfo;
//#UC END# *4F212C930149_4FA25B25007B_var*
begin
//#UC START# *4F212C930149_4FA25B25007B_impl*
 if aControl is TScrollingWinControl then
  inherited
 else
 begin
  with l_PageInfo do
  begin
   cbSize := SizeOf(l_PageInfo);
   fMask := SIF_ALL;
  end;//with l_ScrollInfo
  GetScrollInfo(aControl.Handle, SB_VERT, l_PageInfo);
  l_PageMax := l_PageInfo.nPage;
  l_RangeMax := l_PageInfo.nMax;
  l_Result := l_RangeMax > l_PageMax;
  aCtx.rEngine.PushBool(l_Result);
 end;
//#UC END# *4F212C930149_4FA25B25007B_impl*
end;//TkwPopControlVScrollerVisible.DoWinControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwScrollingWinControlFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.