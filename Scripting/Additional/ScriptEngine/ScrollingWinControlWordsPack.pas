unit ScrollingWinControlWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "ScrollingWinControlWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::ExtControlsProcessing::ScrollingWinControlWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Controls,
  Forms,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopControlVScrollerVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:VScrollerVisible
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:VScrollerVisible
[code]  }
 private
 // private methods
   function VScrollerVisible(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
     {* Реализация слова скрипта pop:Control:VScrollerVisible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlVScrollerVisible

// start class TkwPopControlVScrollerVisible

function TkwPopControlVScrollerVisible.VScrollerVisible(const aCtx: TtfwContext;
  aControl: TWinControl): Boolean;
//#UC START# *9B30ABE39DA1_D64D3C18264A_var*
var
 l_PageMax  : Integer;
 l_RangeMax : Integer;
 l_PageInfo : TScrollInfo;
//#UC END# *9B30ABE39DA1_D64D3C18264A_var*
begin
//#UC START# *9B30ABE39DA1_D64D3C18264A_impl*
 if (aControl Is TScrollingWinControl) then
  Result := TScrollingWinControl(aControl).VertScrollBar.IsScrollBarVisible
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
  Result := l_RangeMax > l_PageMax;
 end;//aControl Is TScrollingWinControl
//#UC END# *9B30ABE39DA1_D64D3C18264A_impl*
end;//TkwPopControlVScrollerVisible.VScrollerVisible

procedure TkwPopControlVScrollerVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
begin
 try
  l_aControl := TWinControl(aCtx.rEngine.PopObjAs(TWinControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TWinControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((VScrollerVisible(aCtx, l_aControl)));
end;//TkwPopControlVScrollerVisible.DoDoIt

class function TkwPopControlVScrollerVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:VScrollerVisible';
end;//TkwPopControlVScrollerVisible.GetWordNameForRegister

function TkwPopControlVScrollerVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlVScrollerVisible.GetResultTypeInfo

type
 TkwPopControlHScrollerVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:HScrollerVisible
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:HScrollerVisible
[code]  }
 private
 // private methods
   function HScrollerVisible(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
     {* Реализация слова скрипта pop:Control:HScrollerVisible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlHScrollerVisible

// start class TkwPopControlHScrollerVisible

function TkwPopControlHScrollerVisible.HScrollerVisible(const aCtx: TtfwContext;
  aControl: TWinControl): Boolean;
//#UC START# *770305E8A083_F808620CE3AB_var*
var
 l_PageMax  : Integer;
 l_RangeMax : Integer;
 l_PageInfo : TScrollInfo;
//#UC END# *770305E8A083_F808620CE3AB_var*
begin
//#UC START# *770305E8A083_F808620CE3AB_impl*
 if (aControl Is TScrollingWinControl) then
  Result := TScrollingWinControl(aControl).HorzScrollBar.IsScrollBarVisible
 else
 begin
  with l_PageInfo do
  begin
   cbSize := SizeOf(l_PageInfo);
   fMask := SIF_ALL;
  end;//with l_ScrollInfo
  GetScrollInfo(aControl.Handle, SB_HORZ, l_PageInfo);
  l_PageMax := l_PageInfo.nPage;
  l_RangeMax := l_PageInfo.nMax;
  Result := l_RangeMax > l_PageMax;
 end;//aControl Is TScrollingWinControl
//#UC END# *770305E8A083_F808620CE3AB_impl*
end;//TkwPopControlHScrollerVisible.HScrollerVisible

procedure TkwPopControlHScrollerVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
begin
 try
  l_aControl := TWinControl(aCtx.rEngine.PopObjAs(TWinControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TWinControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((HScrollerVisible(aCtx, l_aControl)));
end;//TkwPopControlHScrollerVisible.DoDoIt

class function TkwPopControlHScrollerVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:HScrollerVisible';
end;//TkwPopControlHScrollerVisible.GetWordNameForRegister

function TkwPopControlHScrollerVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlHScrollerVisible.GetResultTypeInfo

type
 TkwPopScrollingWinControlVScrollerVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ScrollingWinControl:VScrollerVisible
*Тип результата:* Boolean
*Пример:*
[code]
 aScrollingWinControl pop:ScrollingWinControl:VScrollerVisible
[code]  }
 private
 // private methods
   function VScrollerVisible(const aCtx: TtfwContext;
    aScrollingWinControl: TScrollingWinControl): Boolean;
     {* Реализация слова скрипта pop:ScrollingWinControl:VScrollerVisible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopScrollingWinControlVScrollerVisible

// start class TkwPopScrollingWinControlVScrollerVisible

function TkwPopScrollingWinControlVScrollerVisible.VScrollerVisible(const aCtx: TtfwContext;
  aScrollingWinControl: TScrollingWinControl): Boolean;
//#UC START# *EC3279A91E15_0E188022DACF_var*
//#UC END# *EC3279A91E15_0E188022DACF_var*
begin
//#UC START# *EC3279A91E15_0E188022DACF_impl*
 Result := aScrollingWinControl.VertScrollBar.IsScrollBarVisible;
//#UC END# *EC3279A91E15_0E188022DACF_impl*
end;//TkwPopScrollingWinControlVScrollerVisible.VScrollerVisible

procedure TkwPopScrollingWinControlVScrollerVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScrollingWinControl : TScrollingWinControl;
begin
 try
  l_aScrollingWinControl := TScrollingWinControl(aCtx.rEngine.PopObjAs(TScrollingWinControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScrollingWinControl: TScrollingWinControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((VScrollerVisible(aCtx, l_aScrollingWinControl)));
end;//TkwPopScrollingWinControlVScrollerVisible.DoDoIt

class function TkwPopScrollingWinControlVScrollerVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScrollingWinControl:VScrollerVisible';
end;//TkwPopScrollingWinControlVScrollerVisible.GetWordNameForRegister

function TkwPopScrollingWinControlVScrollerVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopScrollingWinControlVScrollerVisible.GetResultTypeInfo

type
 TkwPopScrollingWinControlHScrollerVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ScrollingWinControl:HScrollerVisible
*Тип результата:* Boolean
*Пример:*
[code]
 aScrollingWinControl pop:ScrollingWinControl:HScrollerVisible
[code]  }
 private
 // private methods
   function HScrollerVisible(const aCtx: TtfwContext;
    aScrollingWinControl: TScrollingWinControl): Boolean;
     {* Реализация слова скрипта pop:ScrollingWinControl:HScrollerVisible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopScrollingWinControlHScrollerVisible

// start class TkwPopScrollingWinControlHScrollerVisible

function TkwPopScrollingWinControlHScrollerVisible.HScrollerVisible(const aCtx: TtfwContext;
  aScrollingWinControl: TScrollingWinControl): Boolean;
//#UC START# *C1B1B2C96DB6_B46C6A433AAC_var*
//#UC END# *C1B1B2C96DB6_B46C6A433AAC_var*
begin
//#UC START# *C1B1B2C96DB6_B46C6A433AAC_impl*
 Result := aScrollingWinControl.HorzScrollBar.IsScrollBarVisible;
//#UC END# *C1B1B2C96DB6_B46C6A433AAC_impl*
end;//TkwPopScrollingWinControlHScrollerVisible.HScrollerVisible

procedure TkwPopScrollingWinControlHScrollerVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScrollingWinControl : TScrollingWinControl;
begin
 try
  l_aScrollingWinControl := TScrollingWinControl(aCtx.rEngine.PopObjAs(TScrollingWinControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScrollingWinControl: TScrollingWinControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((HScrollerVisible(aCtx, l_aScrollingWinControl)));
end;//TkwPopScrollingWinControlHScrollerVisible.DoDoIt

class function TkwPopScrollingWinControlHScrollerVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScrollingWinControl:HScrollerVisible';
end;//TkwPopScrollingWinControlHScrollerVisible.GetWordNameForRegister

function TkwPopScrollingWinControlHScrollerVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopScrollingWinControlHScrollerVisible.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_Control_VScrollerVisible
 TkwPopControlVScrollerVisible.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_HScrollerVisible
 TkwPopControlHScrollerVisible.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ScrollingWinControl_VScrollerVisible
 TkwPopScrollingWinControlVScrollerVisible.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ScrollingWinControl_HScrollerVisible
 TkwPopScrollingWinControlHScrollerVisible.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TWinControl
 TtfwTypeRegistrator.RegisterType(TypeInfo(TWinControl));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TScrollingWinControl
 TtfwTypeRegistrator.RegisterType(TypeInfo(TScrollingWinControl));
{$IfEnd} //not NoScripts

end.