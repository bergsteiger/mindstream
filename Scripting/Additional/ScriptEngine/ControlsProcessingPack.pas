unit ControlsProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "ControlsProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::ControlsProcessing::ControlsProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Types,
  Graphics,
  Controls,
  Forms,
  Menus,
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwBynameControlPush,
  Messages,
  l3PopupMenuHelper,
  l3FormsService,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TControlFriend = {abstract} class(TControl)
  {* Друг для TControl }
 end;//TControlFriend

 TkwPopControlClientToScreen = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:ClientToScreen
*Тип результата:* TPoint
*Пример:*
[code]
 aPoint aControl pop:Control:ClientToScreen
[code]  }
 private
 // private methods
   function ClientToScreen(const aCtx: TtfwContext;
    aControl: TControl;
    const aPoint: TPoint): TPoint;
     {* Реализация слова скрипта pop:Control:ClientToScreen }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlClientToScreen

// start class TkwPopControlClientToScreen

function TkwPopControlClientToScreen.ClientToScreen(const aCtx: TtfwContext;
  aControl: TControl;
  const aPoint: TPoint): TPoint;
 {-}
begin
 Result := aControl.ClientToScreen(aPoint);
end;//TkwPopControlClientToScreen.ClientToScreen

procedure TkwPopControlClientToScreen.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aPoint : TPoint;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushPoint((ClientToScreen(aCtx, l_aControl, l_aPoint)));
end;//TkwPopControlClientToScreen.DoDoIt

class function TkwPopControlClientToScreen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:ClientToScreen';
end;//TkwPopControlClientToScreen.GetWordNameForRegister

function TkwPopControlClientToScreen.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiStruct;
end;//TkwPopControlClientToScreen.GetResultTypeInfo

type
 TkwPopControlScreenToClient = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:ScreenToClient
*Тип результата:* TPoint
*Пример:*
[code]
 aPoint aControl pop:Control:ScreenToClient
[code]  }
 private
 // private methods
   function ScreenToClient(const aCtx: TtfwContext;
    aControl: TControl;
    const aPoint: TPoint): TPoint;
     {* Реализация слова скрипта pop:Control:ScreenToClient }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlScreenToClient

// start class TkwPopControlScreenToClient

function TkwPopControlScreenToClient.ScreenToClient(const aCtx: TtfwContext;
  aControl: TControl;
  const aPoint: TPoint): TPoint;
 {-}
begin
 Result := aControl.ScreenToClient(aPoint);
end;//TkwPopControlScreenToClient.ScreenToClient

procedure TkwPopControlScreenToClient.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aPoint : TPoint;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushPoint((ScreenToClient(aCtx, l_aControl, l_aPoint)));
end;//TkwPopControlScreenToClient.DoDoIt

class function TkwPopControlScreenToClient.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:ScreenToClient';
end;//TkwPopControlScreenToClient.GetWordNameForRegister

function TkwPopControlScreenToClient.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiStruct;
end;//TkwPopControlScreenToClient.GetResultTypeInfo

type
 TkwPopControlInvalidate = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Invalidate
*Пример:*
[code]
 aControl pop:Control:Invalidate
[code]  }
 private
 // private methods
   procedure Invalidate(const aCtx: TtfwContext;
    aControl: TControl);
     {* Реализация слова скрипта pop:Control:Invalidate }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlInvalidate

// start class TkwPopControlInvalidate

procedure TkwPopControlInvalidate.Invalidate(const aCtx: TtfwContext;
  aControl: TControl);
 {-}
begin
 aControl.Invalidate;
end;//TkwPopControlInvalidate.Invalidate

procedure TkwPopControlInvalidate.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Invalidate(aCtx, l_aControl);
end;//TkwPopControlInvalidate.DoDoIt

class function TkwPopControlInvalidate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Invalidate';
end;//TkwPopControlInvalidate.GetWordNameForRegister

function TkwPopControlInvalidate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlInvalidate.GetResultTypeInfo

type
 TkwPopControlRepaint = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Repaint
*Пример:*
[code]
 aControl pop:Control:Repaint
[code]  }
 private
 // private methods
   procedure Repaint(const aCtx: TtfwContext;
    aControl: TControl);
     {* Реализация слова скрипта pop:Control:Repaint }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlRepaint

// start class TkwPopControlRepaint

procedure TkwPopControlRepaint.Repaint(const aCtx: TtfwContext;
  aControl: TControl);
 {-}
begin
 aControl.Repaint;
end;//TkwPopControlRepaint.Repaint

procedure TkwPopControlRepaint.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Repaint(aCtx, l_aControl);
end;//TkwPopControlRepaint.DoDoIt

class function TkwPopControlRepaint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Repaint';
end;//TkwPopControlRepaint.GetWordNameForRegister

function TkwPopControlRepaint.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlRepaint.GetResultTypeInfo

type
 TkwPopControlClick = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Click
*Пример:*
[code]
 aControl pop:Control:Click
[code]  }
 private
 // private methods
   procedure Click(const aCtx: TtfwContext;
    aControl: TControl);
     {* Реализация слова скрипта pop:Control:Click }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlClick

// start class TkwPopControlClick

procedure TkwPopControlClick.Click(const aCtx: TtfwContext;
  aControl: TControl);
//#UC START# *61CF2F0B3020_F8C716BBBC31_var*
//#UC END# *61CF2F0B3020_F8C716BBBC31_var*
begin
//#UC START# *61CF2F0B3020_F8C716BBBC31_impl*
 TControlFriend(aControl).Click;
//#UC END# *61CF2F0B3020_F8C716BBBC31_impl*
end;//TkwPopControlClick.Click

procedure TkwPopControlClick.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Click(aCtx, l_aControl);
end;//TkwPopControlClick.DoDoIt

class function TkwPopControlClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Click';
end;//TkwPopControlClick.GetWordNameForRegister

function TkwPopControlClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlClick.GetResultTypeInfo

type
 TkwPopControlShow = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Show
*Пример:*
[code]
 aControl pop:Control:Show
[code]  }
 private
 // private methods
   procedure Show(const aCtx: TtfwContext;
    aControl: TControl);
     {* Реализация слова скрипта pop:Control:Show }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlShow

// start class TkwPopControlShow

procedure TkwPopControlShow.Show(const aCtx: TtfwContext;
  aControl: TControl);
 {-}
begin
 aControl.Show;
end;//TkwPopControlShow.Show

procedure TkwPopControlShow.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Show(aCtx, l_aControl);
end;//TkwPopControlShow.DoDoIt

class function TkwPopControlShow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Show';
end;//TkwPopControlShow.GetWordNameForRegister

function TkwPopControlShow.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlShow.GetResultTypeInfo

type
 TkwPopControlHide = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Hide
*Пример:*
[code]
 aControl pop:Control:Hide
[code]  }
 private
 // private methods
   procedure Hide(const aCtx: TtfwContext;
    aControl: TControl);
     {* Реализация слова скрипта pop:Control:Hide }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlHide

// start class TkwPopControlHide

procedure TkwPopControlHide.Hide(const aCtx: TtfwContext;
  aControl: TControl);
 {-}
begin
 aControl.Hide;
end;//TkwPopControlHide.Hide

procedure TkwPopControlHide.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Hide(aCtx, l_aControl);
end;//TkwPopControlHide.DoDoIt

class function TkwPopControlHide.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Hide';
end;//TkwPopControlHide.GetWordNameForRegister

function TkwPopControlHide.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlHide.GetResultTypeInfo

type
 TkwPopControlUndock = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Undock
*Пример:*
[code]
 aControl pop:Control:Undock
[code]  }
 private
 // private methods
   procedure Undock(const aCtx: TtfwContext;
    aControl: TControl);
     {* Реализация слова скрипта pop:Control:Undock }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlUndock

// start class TkwPopControlUndock

procedure TkwPopControlUndock.Undock(const aCtx: TtfwContext;
  aControl: TControl);
//#UC START# *E44BD472B7AB_6BAE007A323D_var*
//#UC END# *E44BD472B7AB_6BAE007A323D_var*
begin
//#UC START# *E44BD472B7AB_6BAE007A323D_impl*
 aControl.ManualDock(nil, nil, alNone);
//#UC END# *E44BD472B7AB_6BAE007A323D_impl*
end;//TkwPopControlUndock.Undock

procedure TkwPopControlUndock.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Undock(aCtx, l_aControl);
end;//TkwPopControlUndock.DoDoIt

class function TkwPopControlUndock.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Undock';
end;//TkwPopControlUndock.GetWordNameForRegister

function TkwPopControlUndock.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlUndock.GetResultTypeInfo

type
 TkwPopControlGetPopupMenu = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetPopupMenu
*Тип результата:* TMenuItem
*Пример:*
[code]
 aPoint aControl pop:Control:GetPopupMenu
[code]  }
 private
 // private methods
   function GetPopupMenu(const aCtx: TtfwContext;
    aControl: TControl;
    const aPoint: TPoint): TMenuItem;
     {* Реализация слова скрипта pop:Control:GetPopupMenu }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetPopupMenu

// start class TkwPopControlGetPopupMenu

function TkwPopControlGetPopupMenu.GetPopupMenu(const aCtx: TtfwContext;
  aControl: TControl;
  const aPoint: TPoint): TMenuItem;
//#UC START# *03EB93F2B4F5_42A7FAEADBD6_var*
//#UC END# *03EB93F2B4F5_42A7FAEADBD6_var*
begin
//#UC START# *03EB93F2B4F5_42A7FAEADBD6_impl*
 Result := Tl3PopupMenuHelper.Instance.GetPopupMenu(aControl, aPoint);
//#UC END# *03EB93F2B4F5_42A7FAEADBD6_impl*
end;//TkwPopControlGetPopupMenu.GetPopupMenu

procedure TkwPopControlGetPopupMenu.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aPoint : TPoint;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetPopupMenu(aCtx, l_aControl, l_aPoint)));
end;//TkwPopControlGetPopupMenu.DoDoIt

class function TkwPopControlGetPopupMenu.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetPopupMenu';
end;//TkwPopControlGetPopupMenu.GetWordNameForRegister

function TkwPopControlGetPopupMenu.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TMenuItem);
end;//TkwPopControlGetPopupMenu.GetResultTypeInfo

type
 TkwPopControlGetTopParentForm = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetTopParentForm
*Тип результата:* TCustomForm
*Пример:*
[code]
 aControl pop:Control:GetTopParentForm
[code]  }
 private
 // private methods
   function GetTopParentForm(const aCtx: TtfwContext;
    aControl: TControl): TCustomForm;
     {* Реализация слова скрипта pop:Control:GetTopParentForm }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetTopParentForm

// start class TkwPopControlGetTopParentForm

function TkwPopControlGetTopParentForm.GetTopParentForm(const aCtx: TtfwContext;
  aControl: TControl): TCustomForm;
//#UC START# *D1A25E7B9BDA_801293AEE662_var*
//#UC END# *D1A25E7B9BDA_801293AEE662_var*
begin
//#UC START# *D1A25E7B9BDA_801293AEE662_impl*
 Result := Tl3FormsService.Instance.GetTopParentForm(aControl);
//#UC END# *D1A25E7B9BDA_801293AEE662_impl*
end;//TkwPopControlGetTopParentForm.GetTopParentForm

procedure TkwPopControlGetTopParentForm.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetTopParentForm(aCtx, l_aControl)));
end;//TkwPopControlGetTopParentForm.DoDoIt

class function TkwPopControlGetTopParentForm.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetTopParentForm';
end;//TkwPopControlGetTopParentForm.GetWordNameForRegister

function TkwPopControlGetTopParentForm.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TCustomForm);
end;//TkwPopControlGetTopParentForm.GetResultTypeInfo

type
 TkwPopControlGetMainForm = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetMainForm
*Тип результата:* TCustomForm
*Пример:*
[code]
 aControl pop:Control:GetMainForm
[code]  }
 private
 // private methods
   function GetMainForm(const aCtx: TtfwContext;
    aControl: TControl): TCustomForm;
     {* Реализация слова скрипта pop:Control:GetMainForm }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetMainForm

// start class TkwPopControlGetMainForm

function TkwPopControlGetMainForm.GetMainForm(const aCtx: TtfwContext;
  aControl: TControl): TCustomForm;
//#UC START# *2075E5D1B087_19DF01986BE7_var*
//#UC END# *2075E5D1B087_19DF01986BE7_var*
begin
//#UC START# *2075E5D1B087_19DF01986BE7_impl*
 Result := Tl3FormsService.Instance.GetMainForm(aControl);
//#UC END# *2075E5D1B087_19DF01986BE7_impl*
end;//TkwPopControlGetMainForm.GetMainForm

procedure TkwPopControlGetMainForm.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetMainForm(aCtx, l_aControl)));
end;//TkwPopControlGetMainForm.DoDoIt

class function TkwPopControlGetMainForm.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetMainForm';
end;//TkwPopControlGetMainForm.GetWordNameForRegister

function TkwPopControlGetMainForm.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TCustomForm);
end;//TkwPopControlGetMainForm.GetResultTypeInfo

type
 TkwPopControlGetParentForm = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetParentForm
*Тип результата:* TCustomForm
*Пример:*
[code]
 aControl pop:Control:GetParentForm
[code]  }
 private
 // private methods
   function GetParentForm(const aCtx: TtfwContext;
    aControl: TControl): TCustomForm;
     {* Реализация слова скрипта pop:Control:GetParentForm }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetParentForm

// start class TkwPopControlGetParentForm

function TkwPopControlGetParentForm.GetParentForm(const aCtx: TtfwContext;
  aControl: TControl): TCustomForm;
//#UC START# *290504A82C40_BC5B460C7FEA_var*
//#UC END# *290504A82C40_BC5B460C7FEA_var*
begin
//#UC START# *290504A82C40_BC5B460C7FEA_impl*
 Result := Tl3FormsService.Instance.GetParentForm(aControl);
//#UC END# *290504A82C40_BC5B460C7FEA_impl*
end;//TkwPopControlGetParentForm.GetParentForm

procedure TkwPopControlGetParentForm.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetParentForm(aCtx, l_aControl)));
end;//TkwPopControlGetParentForm.DoDoIt

class function TkwPopControlGetParentForm.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetParentForm';
end;//TkwPopControlGetParentForm.GetWordNameForRegister

function TkwPopControlGetParentForm.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TCustomForm);
end;//TkwPopControlGetParentForm.GetResultTypeInfo

type
 TkwPopControlGetAnotherParentForm = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetAnotherParentForm
*Тип результата:* TCustomForm
*Пример:*
[code]
 aControl pop:Control:GetAnotherParentForm
[code]  }
 private
 // private methods
   function GetAnotherParentForm(const aCtx: TtfwContext;
    aControl: TControl): TCustomForm;
     {* Реализация слова скрипта pop:Control:GetAnotherParentForm }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetAnotherParentForm

// start class TkwPopControlGetAnotherParentForm

function TkwPopControlGetAnotherParentForm.GetAnotherParentForm(const aCtx: TtfwContext;
  aControl: TControl): TCustomForm;
//#UC START# *68CF70189B15_8A00B7773D0C_var*
//#UC END# *68CF70189B15_8A00B7773D0C_var*
begin
//#UC START# *68CF70189B15_8A00B7773D0C_impl*
 Result := Tl3FormsService.Instance.GetAnotherParentForm(aControl);
//#UC END# *68CF70189B15_8A00B7773D0C_impl*
end;//TkwPopControlGetAnotherParentForm.GetAnotherParentForm

procedure TkwPopControlGetAnotherParentForm.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetAnotherParentForm(aCtx, l_aControl)));
end;//TkwPopControlGetAnotherParentForm.DoDoIt

class function TkwPopControlGetAnotherParentForm.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetAnotherParentForm';
end;//TkwPopControlGetAnotherParentForm.GetWordNameForRegister

function TkwPopControlGetAnotherParentForm.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TCustomForm);
end;//TkwPopControlGetAnotherParentForm.GetResultTypeInfo

type
 TkwControlByHandle = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Control:ByHandle
*Тип результата:* TControl
*Пример:*
[code]
 aHandle Control:ByHandle
[code]  }
 private
 // private methods
   function ByHandle(const aCtx: TtfwContext;
    aHandle: THandle): TControl;
     {* Реализация слова скрипта Control:ByHandle }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwControlByHandle

// start class TkwControlByHandle

function TkwControlByHandle.ByHandle(const aCtx: TtfwContext;
  aHandle: THandle): TControl;
//#UC START# *C84440B65B87_0241DA0F487D_var*
//#UC END# *C84440B65B87_0241DA0F487D_var*
begin
//#UC START# *C84440B65B87_0241DA0F487D_impl*
 Result := FindControl(aHandle);
 RunnerAssert(Assigned(Result), 'Не найден контрол.', aCtx);
//#UC END# *C84440B65B87_0241DA0F487D_impl*
end;//TkwControlByHandle.ByHandle

procedure TkwControlByHandle.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aHandle : THandle;
begin
 try
  l_aHandle := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aHandle: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((ByHandle(aCtx, l_aHandle)));
end;//TkwControlByHandle.DoDoIt

class function TkwControlByHandle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Control:ByHandle';
end;//TkwControlByHandle.GetWordNameForRegister

function TkwControlByHandle.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TControl);
end;//TkwControlByHandle.GetResultTypeInfo

type
 TkwControlFocusedControlPush = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта focused:control:push
*Тип результата:* TControl
*Пример:*
[code]
 focused:control:push
[code]  }
 private
 // private methods
   function FocusedControlPush(const aCtx: TtfwContext): TControl;
     {* Реализация слова скрипта focused:control:push }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwControlFocusedControlPush

// start class TkwControlFocusedControlPush

function TkwControlFocusedControlPush.FocusedControlPush(const aCtx: TtfwContext): TControl;
//#UC START# *190B20AA18AF_DDB6E934DC7B_var*
var
 l_C : TControl;
//#UC END# *190B20AA18AF_DDB6E934DC7B_var*
begin
//#UC START# *190B20AA18AF_DDB6E934DC7B_impl*
 l_C := FindControl(GetFocus);
 if (l_C = nil) then
 // - наверное мы под отладчиком или из под нас выдернули фокус
 begin
  RunnerAssert(Screen.ActiveForm <> nil, 'Нет активной формы', aCtx);
  l_C := Screen.ActiveForm.ActiveControl;
 end;//l_C = nil
 RunnerAssert(l_C <> nil, 'Не нашли контрол в фокусе', aCtx);
 Result := l_C;
//#UC END# *190B20AA18AF_DDB6E934DC7B_impl*
end;//TkwControlFocusedControlPush.FocusedControlPush

procedure TkwControlFocusedControlPush.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((FocusedControlPush(aCtx)));
end;//TkwControlFocusedControlPush.DoDoIt

class function TkwControlFocusedControlPush.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'focused:control:push';
end;//TkwControlFocusedControlPush.GetWordNameForRegister

function TkwControlFocusedControlPush.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TControl);
end;//TkwControlFocusedControlPush.GetResultTypeInfo

type
 TkwPopControlGetColor = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetColor
*Тип результата:* TColor
*Пример:*
[code]
 aControl pop:Control:GetColor
[code]  }
 private
 // private methods
   function GetColor(const aCtx: TtfwContext;
    aControl: TControl): TColor;
     {* Реализация слова скрипта pop:Control:GetColor }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetColor

// start class TkwPopControlGetColor

function TkwPopControlGetColor.GetColor(const aCtx: TtfwContext;
  aControl: TControl): TColor;
//#UC START# *AACBF5E37A06_EBE4B9074377_var*
//#UC END# *AACBF5E37A06_EBE4B9074377_var*
begin
//#UC START# *AACBF5E37A06_EBE4B9074377_impl*
 Result := TControlFriend(aControl).Color;
//#UC END# *AACBF5E37A06_EBE4B9074377_impl*
end;//TkwPopControlGetColor.GetColor

procedure TkwPopControlGetColor.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Integer(GetColor(aCtx, l_aControl)));
end;//TkwPopControlGetColor.DoDoIt

class function TkwPopControlGetColor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetColor';
end;//TkwPopControlGetColor.GetWordNameForRegister

function TkwPopControlGetColor.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TColor);
end;//TkwPopControlGetColor.GetResultTypeInfo

type
 TkwPopControlSetColor = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:SetColor
*Пример:*
[code]
 aValue aControl pop:Control:SetColor
[code]  }
 private
 // private methods
   procedure SetColor(const aCtx: TtfwContext;
    aControl: TControl;
    aValue: TColor);
     {* Реализация слова скрипта pop:Control:SetColor }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlSetColor

// start class TkwPopControlSetColor

procedure TkwPopControlSetColor.SetColor(const aCtx: TtfwContext;
  aControl: TControl;
  aValue: TColor);
//#UC START# *7BE35BFC5C42_4A4345E4E5AB_var*
//#UC END# *7BE35BFC5C42_4A4345E4E5AB_var*
begin
//#UC START# *7BE35BFC5C42_4A4345E4E5AB_impl*
 TControlFriend(aControl).Color := aValue;
//#UC END# *7BE35BFC5C42_4A4345E4E5AB_impl*
end;//TkwPopControlSetColor.SetColor

procedure TkwPopControlSetColor.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aValue : TColor;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := TColor(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TColor : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetColor(aCtx, l_aControl, l_aValue);
end;//TkwPopControlSetColor.DoDoIt

class function TkwPopControlSetColor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:SetColor';
end;//TkwPopControlSetColor.GetWordNameForRegister

function TkwPopControlSetColor.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlSetColor.GetResultTypeInfo

type
 TkwPopControlEnabled = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Enabled
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:Enabled
[code]  }
 private
 // private methods
   function Enabled(const aCtx: TtfwContext;
    aControl: TControl): Boolean;
     {* Реализация слова скрипта pop:Control:Enabled }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlEnabled

// start class TkwPopControlEnabled

function TkwPopControlEnabled.Enabled(const aCtx: TtfwContext;
  aControl: TControl): Boolean;
 {-}
begin
 Result := aControl.Enabled;
end;//TkwPopControlEnabled.Enabled

procedure TkwPopControlEnabled.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((Enabled(aCtx, l_aControl)));
end;//TkwPopControlEnabled.DoDoIt

class function TkwPopControlEnabled.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Enabled';
end;//TkwPopControlEnabled.GetWordNameForRegister

function TkwPopControlEnabled.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlEnabled.GetResultTypeInfo

type
 TkwPopControlVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Visible
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:Visible
[code]  }
 private
 // private methods
   function Visible(const aCtx: TtfwContext;
    aControl: TControl): Boolean;
     {* Реализация слова скрипта pop:Control:Visible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlVisible

// start class TkwPopControlVisible

function TkwPopControlVisible.Visible(const aCtx: TtfwContext;
  aControl: TControl): Boolean;
 {-}
begin
 Result := aControl.Visible;
end;//TkwPopControlVisible.Visible

procedure TkwPopControlVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((Visible(aCtx, l_aControl)));
end;//TkwPopControlVisible.DoDoIt

class function TkwPopControlVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Visible';
end;//TkwPopControlVisible.GetWordNameForRegister

function TkwPopControlVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlVisible.GetResultTypeInfo

type
 TkwPopControlName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Name
*Тип результата:* String
*Пример:*
[code]
 aControl pop:Control:Name
[code]  }
 private
 // private methods
   function Name(const aCtx: TtfwContext;
    aControl: TControl): AnsiString;
     {* Реализация слова скрипта pop:Control:Name }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlName

// start class TkwPopControlName

function TkwPopControlName.Name(const aCtx: TtfwContext;
  aControl: TControl): AnsiString;
 {-}
begin
 Result := aControl.Name;
end;//TkwPopControlName.Name

procedure TkwPopControlName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Name(aCtx, l_aControl)));
end;//TkwPopControlName.DoDoIt

class function TkwPopControlName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Name';
end;//TkwPopControlName.GetWordNameForRegister

function TkwPopControlName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopControlName.GetResultTypeInfo

type
 TkwPopControlHint = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Hint
*Тип результата:* String
*Пример:*
[code]
 aControl pop:Control:Hint
[code]  }
 private
 // private methods
   function Hint(const aCtx: TtfwContext;
    aControl: TControl): AnsiString;
     {* Реализация слова скрипта pop:Control:Hint }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlHint

// start class TkwPopControlHint

function TkwPopControlHint.Hint(const aCtx: TtfwContext;
  aControl: TControl): AnsiString;
 {-}
begin
 Result := aControl.Hint;
end;//TkwPopControlHint.Hint

procedure TkwPopControlHint.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Hint(aCtx, l_aControl)));
end;//TkwPopControlHint.DoDoIt

class function TkwPopControlHint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Hint';
end;//TkwPopControlHint.GetWordNameForRegister

function TkwPopControlHint.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopControlHint.GetResultTypeInfo

type
 TkwPopControlShowHint = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:ShowHint
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:ShowHint
[code]  }
 private
 // private methods
   function ShowHint(const aCtx: TtfwContext;
    aControl: TControl): Boolean;
     {* Реализация слова скрипта pop:Control:ShowHint }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlShowHint

// start class TkwPopControlShowHint

function TkwPopControlShowHint.ShowHint(const aCtx: TtfwContext;
  aControl: TControl): Boolean;
 {-}
begin
 Result := aControl.ShowHint;
end;//TkwPopControlShowHint.ShowHint

procedure TkwPopControlShowHint.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((ShowHint(aCtx, l_aControl)));
end;//TkwPopControlShowHint.DoDoIt

class function TkwPopControlShowHint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:ShowHint';
end;//TkwPopControlShowHint.GetWordNameForRegister

function TkwPopControlShowHint.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlShowHint.GetResultTypeInfo

type
 TkwPopControlCaption = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Caption
*Тип результата:* String
*Пример:*
[code]
 aControl pop:Control:Caption
[code]  }
 private
 // private methods
   function Caption(const aCtx: TtfwContext;
    aControl: TControl): AnsiString;
     {* Реализация слова скрипта pop:Control:Caption }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlCaption

// start class TkwPopControlCaption

function TkwPopControlCaption.Caption(const aCtx: TtfwContext;
  aControl: TControl): AnsiString;
//#UC START# *DAFCD40E37A8_6ED40CDED494_var*
//#UC END# *DAFCD40E37A8_6ED40CDED494_var*
begin
//#UC START# *DAFCD40E37A8_6ED40CDED494_impl*
 Result := TControlFriend(aControl).Caption;
//#UC END# *DAFCD40E37A8_6ED40CDED494_impl*
end;//TkwPopControlCaption.Caption

procedure TkwPopControlCaption.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Caption(aCtx, l_aControl)));
end;//TkwPopControlCaption.DoDoIt

class function TkwPopControlCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Caption';
end;//TkwPopControlCaption.GetWordNameForRegister

function TkwPopControlCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopControlCaption.GetResultTypeInfo

type
 TkwPopControlGetTop = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetTop
*Тип результата:* Integer
*Пример:*
[code]
 aControl pop:Control:GetTop
[code]  }
 private
 // private methods
   function GetTop(const aCtx: TtfwContext;
    aControl: TControl): Integer;
     {* Реализация слова скрипта pop:Control:GetTop }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetTop

// start class TkwPopControlGetTop

function TkwPopControlGetTop.GetTop(const aCtx: TtfwContext;
  aControl: TControl): Integer;
 {-}
begin
 Result := aControl.Top;
end;//TkwPopControlGetTop.GetTop

procedure TkwPopControlGetTop.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetTop(aCtx, l_aControl)));
end;//TkwPopControlGetTop.DoDoIt

class function TkwPopControlGetTop.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetTop';
end;//TkwPopControlGetTop.GetWordNameForRegister

function TkwPopControlGetTop.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopControlGetTop.GetResultTypeInfo

type
 TkwPopControlSetTop = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:SetTop
*Пример:*
[code]
 aValue aControl pop:Control:SetTop
[code]  }
 private
 // private methods
   procedure SetTop(const aCtx: TtfwContext;
    aControl: TControl;
    aValue: Integer);
     {* Реализация слова скрипта pop:Control:SetTop }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlSetTop

// start class TkwPopControlSetTop

procedure TkwPopControlSetTop.SetTop(const aCtx: TtfwContext;
  aControl: TControl;
  aValue: Integer);
 {-}
begin
 aControl.Top := aValue;
end;//TkwPopControlSetTop.SetTop

procedure TkwPopControlSetTop.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aValue : Integer;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetTop(aCtx, l_aControl, l_aValue);
end;//TkwPopControlSetTop.DoDoIt

class function TkwPopControlSetTop.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:SetTop';
end;//TkwPopControlSetTop.GetWordNameForRegister

function TkwPopControlSetTop.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlSetTop.GetResultTypeInfo

type
 TkwPopControlGetLeft = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetLeft
*Тип результата:* Integer
*Пример:*
[code]
 aControl pop:Control:GetLeft
[code]  }
 private
 // private methods
   function GetLeft(const aCtx: TtfwContext;
    aControl: TControl): Integer;
     {* Реализация слова скрипта pop:Control:GetLeft }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetLeft

// start class TkwPopControlGetLeft

function TkwPopControlGetLeft.GetLeft(const aCtx: TtfwContext;
  aControl: TControl): Integer;
 {-}
begin
 Result := aControl.Left;
end;//TkwPopControlGetLeft.GetLeft

procedure TkwPopControlGetLeft.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetLeft(aCtx, l_aControl)));
end;//TkwPopControlGetLeft.DoDoIt

class function TkwPopControlGetLeft.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetLeft';
end;//TkwPopControlGetLeft.GetWordNameForRegister

function TkwPopControlGetLeft.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopControlGetLeft.GetResultTypeInfo

type
 TkwPopControlSetLeft = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:SetLeft
*Пример:*
[code]
 aValue aControl pop:Control:SetLeft
[code]  }
 private
 // private methods
   procedure SetLeft(const aCtx: TtfwContext;
    aControl: TControl;
    aValue: Integer);
     {* Реализация слова скрипта pop:Control:SetLeft }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlSetLeft

// start class TkwPopControlSetLeft

procedure TkwPopControlSetLeft.SetLeft(const aCtx: TtfwContext;
  aControl: TControl;
  aValue: Integer);
 {-}
begin
 aControl.Left := aValue;
end;//TkwPopControlSetLeft.SetLeft

procedure TkwPopControlSetLeft.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aValue : Integer;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetLeft(aCtx, l_aControl, l_aValue);
end;//TkwPopControlSetLeft.DoDoIt

class function TkwPopControlSetLeft.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:SetLeft';
end;//TkwPopControlSetLeft.GetWordNameForRegister

function TkwPopControlSetLeft.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlSetLeft.GetResultTypeInfo

type
 TkwPopControlGetHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetHeight
*Тип результата:* Integer
*Пример:*
[code]
 aControl pop:Control:GetHeight
[code]  }
 private
 // private methods
   function GetHeight(const aCtx: TtfwContext;
    aControl: TControl): Integer;
     {* Реализация слова скрипта pop:Control:GetHeight }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetHeight

// start class TkwPopControlGetHeight

function TkwPopControlGetHeight.GetHeight(const aCtx: TtfwContext;
  aControl: TControl): Integer;
 {-}
begin
 Result := aControl.Height;
end;//TkwPopControlGetHeight.GetHeight

procedure TkwPopControlGetHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetHeight(aCtx, l_aControl)));
end;//TkwPopControlGetHeight.DoDoIt

class function TkwPopControlGetHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetHeight';
end;//TkwPopControlGetHeight.GetWordNameForRegister

function TkwPopControlGetHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopControlGetHeight.GetResultTypeInfo

type
 TkwPopControlSetHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:SetHeight
*Пример:*
[code]
 aValue aControl pop:Control:SetHeight
[code]  }
 private
 // private methods
   procedure SetHeight(const aCtx: TtfwContext;
    aControl: TControl;
    aValue: Integer);
     {* Реализация слова скрипта pop:Control:SetHeight }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlSetHeight

// start class TkwPopControlSetHeight

procedure TkwPopControlSetHeight.SetHeight(const aCtx: TtfwContext;
  aControl: TControl;
  aValue: Integer);
 {-}
begin
 aControl.Height := aValue;
end;//TkwPopControlSetHeight.SetHeight

procedure TkwPopControlSetHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aValue : Integer;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetHeight(aCtx, l_aControl, l_aValue);
end;//TkwPopControlSetHeight.DoDoIt

class function TkwPopControlSetHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:SetHeight';
end;//TkwPopControlSetHeight.GetWordNameForRegister

function TkwPopControlSetHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlSetHeight.GetResultTypeInfo

type
 TkwPopControlGetWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetWidth
*Тип результата:* Integer
*Пример:*
[code]
 aControl pop:Control:GetWidth
[code]  }
 private
 // private methods
   function GetWidth(const aCtx: TtfwContext;
    aControl: TControl): Integer;
     {* Реализация слова скрипта pop:Control:GetWidth }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetWidth

// start class TkwPopControlGetWidth

function TkwPopControlGetWidth.GetWidth(const aCtx: TtfwContext;
  aControl: TControl): Integer;
 {-}
begin
 Result := aControl.Width;
end;//TkwPopControlGetWidth.GetWidth

procedure TkwPopControlGetWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetWidth(aCtx, l_aControl)));
end;//TkwPopControlGetWidth.DoDoIt

class function TkwPopControlGetWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetWidth';
end;//TkwPopControlGetWidth.GetWordNameForRegister

function TkwPopControlGetWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopControlGetWidth.GetResultTypeInfo

type
 TkwPopControlSetWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:SetWidth
*Пример:*
[code]
 aValue aControl pop:Control:SetWidth
[code]  }
 private
 // private methods
   procedure SetWidth(const aCtx: TtfwContext;
    aControl: TControl;
    aValue: Integer);
     {* Реализация слова скрипта pop:Control:SetWidth }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlSetWidth

// start class TkwPopControlSetWidth

procedure TkwPopControlSetWidth.SetWidth(const aCtx: TtfwContext;
  aControl: TControl;
  aValue: Integer);
 {-}
begin
 aControl.Width := aValue;
end;//TkwPopControlSetWidth.SetWidth

procedure TkwPopControlSetWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
 l_aValue : Integer;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetWidth(aCtx, l_aControl, l_aValue);
end;//TkwPopControlSetWidth.DoDoIt

class function TkwPopControlSetWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:SetWidth';
end;//TkwPopControlSetWidth.GetWordNameForRegister

function TkwPopControlSetWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlSetWidth.GetResultTypeInfo

type
 TkwPopControlParent = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Parent
*Тип результата:* TControl
*Пример:*
[code]
 aControl pop:Control:Parent
[code]  }
 private
 // private methods
   function Parent(const aCtx: TtfwContext;
    aControl: TControl): TControl;
     {* Реализация слова скрипта pop:Control:Parent }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlParent

// start class TkwPopControlParent

function TkwPopControlParent.Parent(const aCtx: TtfwContext;
  aControl: TControl): TControl;
 {-}
begin
 Result := aControl.Parent;
end;//TkwPopControlParent.Parent

procedure TkwPopControlParent.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TControl;
begin
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Parent(aCtx, l_aControl)));
end;//TkwPopControlParent.DoDoIt

class function TkwPopControlParent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Parent';
end;//TkwPopControlParent.GetWordNameForRegister

function TkwPopControlParent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TControl);
end;//TkwPopControlParent.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_Control_ClientToScreen
 TkwPopControlClientToScreen.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_ScreenToClient
 TkwPopControlScreenToClient.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Invalidate
 TkwPopControlInvalidate.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Repaint
 TkwPopControlRepaint.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Click
 TkwPopControlClick.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Show
 TkwPopControlShow.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Hide
 TkwPopControlHide.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Undock
 TkwPopControlUndock.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetPopupMenu
 TkwPopControlGetPopupMenu.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetTopParentForm
 TkwPopControlGetTopParentForm.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetMainForm
 TkwPopControlGetMainForm.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetParentForm
 TkwPopControlGetParentForm.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetAnotherParentForm
 TkwPopControlGetAnotherParentForm.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Control_ByHandle
 TkwControlByHandle.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Control_focused_control_push
 TkwControlFocusedControlPush.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetColor
 TkwPopControlGetColor.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_SetColor
 TkwPopControlSetColor.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Enabled
 TkwPopControlEnabled.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Visible
 TkwPopControlVisible.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Name
 TkwPopControlName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Hint
 TkwPopControlHint.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_ShowHint
 TkwPopControlShowHint.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Caption
 TkwPopControlCaption.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetTop
 TkwPopControlGetTop.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_SetTop
 TkwPopControlSetTop.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetLeft
 TkwPopControlGetLeft.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_SetLeft
 TkwPopControlSetLeft.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetHeight
 TkwPopControlGetHeight.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_SetHeight
 TkwPopControlSetHeight.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetWidth
 TkwPopControlGetWidth.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_SetWidth
 TkwPopControlSetWidth.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Parent
 TkwPopControlParent.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TControl
 TtfwTypeRegistrator.RegisterType(TypeInfo(TControl));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TPoint
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TMenuItem
 TtfwTypeRegistrator.RegisterType(TypeInfo(TMenuItem));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TCustomForm
 TtfwTypeRegistrator.RegisterType(TypeInfo(TCustomForm));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа THandle
 TtfwTypeRegistrator.RegisterType(TypeInfo(THandle));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TColor
 TtfwTypeRegistrator.RegisterType(TypeInfo(TColor));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts

end.