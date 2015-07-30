unit WinUtilsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "WinUtilsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::WinUtils::WinUtilsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Types,
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

type
 TIterateWindowsRec = record
   rCtx : PtfwContext;
   rEnumMethod : TtfwWord;
 end;//TIterateWindowsRec

 PIterateWindowsRec = ^TIterateWindowsRec;
function IterateWindowsMethod(hWindow: THandle;
  aData: PIterateWindowsRec): Boolean; stdcall;
procedure MakeScreenshot(aWnd: THandle;
  const aRect: TRect;
  const aFileName: AnsiString;
  aWithCheck: Boolean;
  const aCtx: TtfwContext;
  aCaller: TtfwWord);
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  Messages,
  CommCtrl,
  l3ImageUtils,
  Forms,
  Controls,
  l3CloseFormHelper,
  Graphics,
  l3PicturePathService,
  TypInfo,
  tfwTypeRegistrator
  ;

type
 TkwWndIsVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта wnd:IsVisible
*Тип результата:* Boolean
*Пример:*
[code]
 aWnd wnd:IsVisible
[code]  }
 private
 // private methods
   function WndIsVisible(const aCtx: TtfwContext;
    aWnd: THandle): Boolean;
     {* Реализация слова скрипта wnd:IsVisible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWndIsVisible

// start class TkwWndIsVisible

function TkwWndIsVisible.WndIsVisible(const aCtx: TtfwContext;
  aWnd: THandle): Boolean;
//#UC START# *51F7DBC755B8_CB65D7FF1E6C_var*
//#UC END# *51F7DBC755B8_CB65D7FF1E6C_var*
begin
//#UC START# *51F7DBC755B8_CB65D7FF1E6C_impl*
 Result := Windows.IsWindowVisible(aWnd);
//#UC END# *51F7DBC755B8_CB65D7FF1E6C_impl*
end;//TkwWndIsVisible.WndIsVisible

procedure TkwWndIsVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((WndIsVisible(aCtx, l_aWnd)));
end;//TkwWndIsVisible.DoDoIt

class function TkwWndIsVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:IsVisible';
end;//TkwWndIsVisible.GetWordNameForRegister

function TkwWndIsVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwWndIsVisible.GetResultTypeInfo

type
 TkwWndGetClassName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта wnd:GetClassName
*Тип результата:* String
*Пример:*
[code]
 aWnd wnd:GetClassName
[code]  }
 private
 // private methods
   function WndGetClassName(const aCtx: TtfwContext;
    aWnd: THandle): AnsiString;
     {* Реализация слова скрипта wnd:GetClassName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWndGetClassName

// start class TkwWndGetClassName

function TkwWndGetClassName.WndGetClassName(const aCtx: TtfwContext;
  aWnd: THandle): AnsiString;
//#UC START# *E554A2B1DE10_455E9214E4B7_var*
var
 l_Buffer: array[Byte] of Char;
//#UC END# *E554A2B1DE10_455E9214E4B7_var*
begin
//#UC START# *E554A2B1DE10_455E9214E4B7_impl*
 GetClassName(aWnd, l_Buffer, SizeOf(l_Buffer));
 Result := l_Buffer;
//#UC END# *E554A2B1DE10_455E9214E4B7_impl*
end;//TkwWndGetClassName.WndGetClassName

procedure TkwWndGetClassName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((WndGetClassName(aCtx, l_aWnd)));
end;//TkwWndGetClassName.DoDoIt

class function TkwWndGetClassName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:GetClassName';
end;//TkwWndGetClassName.GetWordNameForRegister

function TkwWndGetClassName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwWndGetClassName.GetResultTypeInfo

type
 TkwWndGetWindowText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта wnd:GetWindowText
*Тип результата:* String
*Пример:*
[code]
 aWnd wnd:GetWindowText
[code]  }
 private
 // private methods
   function WndGetWindowText(const aCtx: TtfwContext;
    aWnd: THandle): AnsiString;
     {* Реализация слова скрипта wnd:GetWindowText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWndGetWindowText

// start class TkwWndGetWindowText

function TkwWndGetWindowText.WndGetWindowText(const aCtx: TtfwContext;
  aWnd: THandle): AnsiString;
//#UC START# *38FB07665775_6ECBEE6894B8_var*
var
 l_Buffer: array[Byte] of Char;
//#UC END# *38FB07665775_6ECBEE6894B8_var*
begin
//#UC START# *38FB07665775_6ECBEE6894B8_impl*
 GetWindowText(aWnd, l_Buffer, SizeOf(l_Buffer));
 Result := l_Buffer;
//#UC END# *38FB07665775_6ECBEE6894B8_impl*
end;//TkwWndGetWindowText.WndGetWindowText

procedure TkwWndGetWindowText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((WndGetWindowText(aCtx, l_aWnd)));
end;//TkwWndGetWindowText.DoDoIt

class function TkwWndGetWindowText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:GetWindowText';
end;//TkwWndGetWindowText.GetWordNameForRegister

function TkwWndGetWindowText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwWndGetWindowText.GetResultTypeInfo

type
 TkwWndCloseWindow = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта wnd:CloseWindow
*Пример:*
[code]
 aWnd wnd:CloseWindow
[code]  }
 private
 // private methods
   procedure WndCloseWindow(const aCtx: TtfwContext;
    aWnd: THandle);
     {* Реализация слова скрипта wnd:CloseWindow }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWndCloseWindow

// start class TkwWndCloseWindow

procedure TkwWndCloseWindow.WndCloseWindow(const aCtx: TtfwContext;
  aWnd: THandle);
//#UC START# *EF73ED47DC1E_B3B5EA3F1514_var*
//#UC END# *EF73ED47DC1E_B3B5EA3F1514_var*
begin
//#UC START# *EF73ED47DC1E_B3B5EA3F1514_impl*
 SendMessage(aWnd, WM_CLOSE, 0, 0);
//#UC END# *EF73ED47DC1E_B3B5EA3F1514_impl*
end;//TkwWndCloseWindow.WndCloseWindow

procedure TkwWndCloseWindow.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WndCloseWindow(aCtx, l_aWnd);
end;//TkwWndCloseWindow.DoDoIt

class function TkwWndCloseWindow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:CloseWindow';
end;//TkwWndCloseWindow.GetWordNameForRegister

function TkwWndCloseWindow.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwWndCloseWindow.GetResultTypeInfo

type
 TkwWndWindowIsMine = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта wnd:WindowIsMine
*Тип результата:* Boolean
*Пример:*
[code]
 aWnd wnd:WindowIsMine
[code]  }
 private
 // private methods
   function WndWindowIsMine(const aCtx: TtfwContext;
    aWnd: THandle): Boolean;
     {* Реализация слова скрипта wnd:WindowIsMine }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWndWindowIsMine

// start class TkwWndWindowIsMine

function TkwWndWindowIsMine.WndWindowIsMine(const aCtx: TtfwContext;
  aWnd: THandle): Boolean;
//#UC START# *7F8BF12C6C7F_C09FEECC1053_var*
var
 l_Process: DWORD;
//#UC END# *7F8BF12C6C7F_C09FEECC1053_var*
begin
//#UC START# *7F8BF12C6C7F_C09FEECC1053_impl*
 GetWindowThreadProcessId(aWnd, l_Process);
 Result := (l_Process = GetCurrentProcessId);
//#UC END# *7F8BF12C6C7F_C09FEECC1053_impl*
end;//TkwWndWindowIsMine.WndWindowIsMine

procedure TkwWndWindowIsMine.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((WndWindowIsMine(aCtx, l_aWnd)));
end;//TkwWndWindowIsMine.DoDoIt

class function TkwWndWindowIsMine.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:WindowIsMine';
end;//TkwWndWindowIsMine.GetWordNameForRegister

function TkwWndWindowIsMine.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwWndWindowIsMine.GetResultTypeInfo

type
 TkwWndSetForeground = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта wnd:SetForeground
*Пример:*
[code]
 aWnd wnd:SetForeground
[code]  }
 private
 // private methods
   procedure WndSetForeground(const aCtx: TtfwContext;
    aWnd: THandle);
     {* Реализация слова скрипта wnd:SetForeground }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWndSetForeground

// start class TkwWndSetForeground

procedure TkwWndSetForeground.WndSetForeground(const aCtx: TtfwContext;
  aWnd: THandle);
//#UC START# *D113CC850E0F_1C5511E4225D_var*
//#UC END# *D113CC850E0F_1C5511E4225D_var*
begin
//#UC START# *D113CC850E0F_1C5511E4225D_impl*
 Windows.SetForegroundWindow(aWnd);
//#UC END# *D113CC850E0F_1C5511E4225D_impl*
end;//TkwWndSetForeground.WndSetForeground

procedure TkwWndSetForeground.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WndSetForeground(aCtx, l_aWnd);
end;//TkwWndSetForeground.DoDoIt

class function TkwWndSetForeground.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:SetForeground';
end;//TkwWndSetForeground.GetWordNameForRegister

function TkwWndSetForeground.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwWndSetForeground.GetResultTypeInfo

type
 TkwWinTreeGetCurrentText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта WinTreeGetCurrentText
*Тип результата:* String
*Пример:*
[code]
 aWnd WinTreeGetCurrentText
[code]  }
 private
 // private methods
   function WinTreeGetCurrentText(const aCtx: TtfwContext;
    aWnd: THandle): AnsiString;
     {* Реализация слова скрипта WinTreeGetCurrentText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWinTreeGetCurrentText

// start class TkwWinTreeGetCurrentText

function TkwWinTreeGetCurrentText.WinTreeGetCurrentText(const aCtx: TtfwContext;
  aWnd: THandle): AnsiString;
//#UC START# *38530DA9DB57_A893626FB9A5_var*
var
 l_Current: TTVItemA;
 l_Res: Boolean;
 l_Text: array[1..255] of AnsiChar;
//#UC END# *38530DA9DB57_A893626FB9A5_var*
begin
//#UC START# *38530DA9DB57_A893626FB9A5_impl*
 System.FillChar(l_Current, SizeOf(l_Current), 0);
 l_Current.hItem := TreeView_GetSelection(aWnd);
 l_Current.mask := TVIF_TEXT;
 l_Current.cchTextMax := 255;
 l_Current.pszText := @l_Text;

 l_Res := TreeView_GetItemA(aWnd, l_Current);
 if l_Res then
  Result := l_Current.pszText
 else
  Result := '';
//#UC END# *38530DA9DB57_A893626FB9A5_impl*
end;//TkwWinTreeGetCurrentText.WinTreeGetCurrentText

procedure TkwWinTreeGetCurrentText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((WinTreeGetCurrentText(aCtx, l_aWnd)));
end;//TkwWinTreeGetCurrentText.DoDoIt

class function TkwWinTreeGetCurrentText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WinTreeGetCurrentText';
end;//TkwWinTreeGetCurrentText.GetWordNameForRegister

function TkwWinTreeGetCurrentText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwWinTreeGetCurrentText.GetResultTypeInfo

type
 TkwIterateChildWindows = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IterateChildWindows
*Пример:*
[code]
 aLambda aWnd IterateChildWindows
[code]  }
 private
 // private methods
   procedure IterateChildWindows(const aCtx: TtfwContext;
    aWnd: THandle;
    aLambda: TtfwWord);
     {* Реализация слова скрипта IterateChildWindows }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIterateChildWindows

// start class TkwIterateChildWindows

procedure TkwIterateChildWindows.IterateChildWindows(const aCtx: TtfwContext;
  aWnd: THandle;
  aLambda: TtfwWord);
//#UC START# *885E0A0E618E_BB2233135443_var*
var
 l_Data: TIterateWindowsRec;
//#UC END# *885E0A0E618E_BB2233135443_var*
begin
//#UC START# *885E0A0E618E_BB2233135443_impl*
 l_Data.rEnumMethod := aLambda;
 l_Data.rCtx := @aCtx;
 
 EnumChildWindows(aWnd, @IterateWindowsMethod, LongInt(@l_Data));
//#UC END# *885E0A0E618E_BB2233135443_impl*
end;//TkwIterateChildWindows.IterateChildWindows

procedure TkwIterateChildWindows.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
 l_aLambda : TtfwWord;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 IterateChildWindows(aCtx, l_aWnd, l_aLambda);
end;//TkwIterateChildWindows.DoDoIt

class function TkwIterateChildWindows.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateChildWindows';
end;//TkwIterateChildWindows.GetWordNameForRegister

function TkwIterateChildWindows.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwIterateChildWindows.GetResultTypeInfo

type
 TkwIterateWindows = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IterateWindows
*Пример:*
[code]
 aLambda IterateWindows
[code]  }
 private
 // private methods
   procedure IterateWindows(const aCtx: TtfwContext;
    aLambda: TtfwWord);
     {* Реализация слова скрипта IterateWindows }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIterateWindows

// start class TkwIterateWindows

procedure TkwIterateWindows.IterateWindows(const aCtx: TtfwContext;
  aLambda: TtfwWord);
//#UC START# *0BC1915B6BEB_2EB6B5E4913F_var*
var
 l_Data: TIterateWindowsRec;
//#UC END# *0BC1915B6BEB_2EB6B5E4913F_var*
begin
//#UC START# *0BC1915B6BEB_2EB6B5E4913F_impl*
 l_Data.rEnumMethod := aLambda;
 l_Data.rCtx := @aCtx;
 
 EnumWindows(@IterateWindowsMethod, LongInt(@l_Data));
//#UC END# *0BC1915B6BEB_2EB6B5E4913F_impl*
end;//TkwIterateWindows.IterateWindows

procedure TkwIterateWindows.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aLambda : TtfwWord;
begin
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 IterateWindows(aCtx, l_aLambda);
end;//TkwIterateWindows.DoDoIt

class function TkwIterateWindows.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateWindows';
end;//TkwIterateWindows.GetWordNameForRegister

function TkwIterateWindows.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwIterateWindows.GetResultTypeInfo

type
 TkwWindowFromPoint = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта WindowFromPoint
*Тип результата:* THandle
*Пример:*
[code]
 aPoint WindowFromPoint
[code]  }
 private
 // private methods
   function WindowFromPoint(const aCtx: TtfwContext;
    const aPoint: TPoint): THandle;
     {* Реализация слова скрипта WindowFromPoint }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWindowFromPoint

// start class TkwWindowFromPoint

function TkwWindowFromPoint.WindowFromPoint(const aCtx: TtfwContext;
  const aPoint: TPoint): THandle;
//#UC START# *6FFCD3ADC6FE_2D01DE64792B_var*
//#UC END# *6FFCD3ADC6FE_2D01DE64792B_var*
begin
//#UC START# *6FFCD3ADC6FE_2D01DE64792B_impl*
 Result := Windows.WindowFromPoint(aPoint);
//#UC END# *6FFCD3ADC6FE_2D01DE64792B_impl*
end;//TkwWindowFromPoint.WindowFromPoint

procedure TkwWindowFromPoint.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPoint : TPoint;
begin
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Integer(WindowFromPoint(aCtx, l_aPoint)));
end;//TkwWindowFromPoint.DoDoIt

class function TkwWindowFromPoint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WindowFromPoint';
end;//TkwWindowFromPoint.GetWordNameForRegister

function TkwWindowFromPoint.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(THandle);
end;//TkwWindowFromPoint.GetResultTypeInfo

type
 TkwGetForegroundWindow = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта GetForegroundWindow
*Тип результата:* THandle
*Пример:*
[code]
 GetForegroundWindow
[code]  }
 private
 // private methods
   function GetForegroundWindow(const aCtx: TtfwContext): THandle;
     {* Реализация слова скрипта GetForegroundWindow }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwGetForegroundWindow

// start class TkwGetForegroundWindow

function TkwGetForegroundWindow.GetForegroundWindow(const aCtx: TtfwContext): THandle;
//#UC START# *5CBACAD0EDFA_CB29543BBB60_var*
//#UC END# *5CBACAD0EDFA_CB29543BBB60_var*
begin
//#UC START# *5CBACAD0EDFA_CB29543BBB60_impl*
 Result := Windows.GetForegroundWindow;
//#UC END# *5CBACAD0EDFA_CB29543BBB60_impl*
end;//TkwGetForegroundWindow.GetForegroundWindow

procedure TkwGetForegroundWindow.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt(Integer(GetForegroundWindow(aCtx)));
end;//TkwGetForegroundWindow.DoDoIt

class function TkwGetForegroundWindow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetForegroundWindow';
end;//TkwGetForegroundWindow.GetWordNameForRegister

function TkwGetForegroundWindow.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(THandle);
end;//TkwGetForegroundWindow.GetResultTypeInfo

type
 TkwFindWindowByCaption = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта FindWindowByCaption
*Тип результата:* THandle
*Пример:*
[code]
 aCaption FindWindowByCaption
[code]  }
 private
 // private methods
   function FindWindowByCaption(const aCtx: TtfwContext;
    const aCaption: AnsiString): THandle;
     {* Реализация слова скрипта FindWindowByCaption }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFindWindowByCaption

// start class TkwFindWindowByCaption

function TkwFindWindowByCaption.FindWindowByCaption(const aCtx: TtfwContext;
  const aCaption: AnsiString): THandle;
//#UC START# *84D6BB2A5250_0FB930B944B8_var*
//#UC END# *84D6BB2A5250_0FB930B944B8_var*
begin
//#UC START# *84D6BB2A5250_0FB930B944B8_impl*
 Result := FindWindowA(nil, PAnsiChar(aCaption));
//#UC END# *84D6BB2A5250_0FB930B944B8_impl*
end;//TkwFindWindowByCaption.FindWindowByCaption

procedure TkwFindWindowByCaption.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aCaption : AnsiString;
begin
 try
  l_aCaption := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCaption: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Integer(FindWindowByCaption(aCtx, l_aCaption)));
end;//TkwFindWindowByCaption.DoDoIt

class function TkwFindWindowByCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FindWindowByCaption';
end;//TkwFindWindowByCaption.GetWordNameForRegister

function TkwFindWindowByCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(THandle);
end;//TkwFindWindowByCaption.GetResultTypeInfo

type
 TkwSetFuzzInPercent = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SetFuzzInPercent
*Пример:*
[code]
 aValue SetFuzzInPercent
[code]  }
 private
 // private methods
   procedure SetFuzzInPercent(const aCtx: TtfwContext;
    aValue: Integer);
     {* Реализация слова скрипта SetFuzzInPercent }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSetFuzzInPercent

// start class TkwSetFuzzInPercent

procedure TkwSetFuzzInPercent.SetFuzzInPercent(const aCtx: TtfwContext;
  aValue: Integer);
//#UC START# *FFB533EE4DD1_DDDEEE94C045_var*
//#UC END# *FFB533EE4DD1_DDDEEE94C045_var*
begin
//#UC START# *FFB533EE4DD1_DDDEEE94C045_impl*
 l3SetFuzzValueInPercent(aValue);
//#UC END# *FFB533EE4DD1_DDDEEE94C045_impl*
end;//TkwSetFuzzInPercent.SetFuzzInPercent

procedure TkwSetFuzzInPercent.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Integer;
begin
 try
  l_aValue := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetFuzzInPercent(aCtx, l_aValue);
end;//TkwSetFuzzInPercent.DoDoIt

class function TkwSetFuzzInPercent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetFuzzInPercent';
end;//TkwSetFuzzInPercent.GetWordNameForRegister

function TkwSetFuzzInPercent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSetFuzzInPercent.GetResultTypeInfo

type
 TkwDesktopHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта desktop:Height
*Тип результата:* Integer
*Пример:*
[code]
 desktop:Height
[code]  }
 private
 // private methods
   function DesktopHeight(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта desktop:Height }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDesktopHeight

// start class TkwDesktopHeight

function TkwDesktopHeight.DesktopHeight(const aCtx: TtfwContext): Integer;
//#UC START# *4EDF1B6456EE_F5071C676120_var*
//#UC END# *4EDF1B6456EE_F5071C676120_var*
begin
//#UC START# *4EDF1B6456EE_F5071C676120_impl*
 Result := Forms.Screen.DesktopHeight;
//#UC END# *4EDF1B6456EE_F5071C676120_impl*
end;//TkwDesktopHeight.DesktopHeight

procedure TkwDesktopHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((DesktopHeight(aCtx)));
end;//TkwDesktopHeight.DoDoIt

class function TkwDesktopHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'desktop:Height';
end;//TkwDesktopHeight.GetWordNameForRegister

function TkwDesktopHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwDesktopHeight.GetResultTypeInfo

type
 TkwDesktopWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта desktop:Width
*Тип результата:* Integer
*Пример:*
[code]
 desktop:Width
[code]  }
 private
 // private methods
   function DesktopWidth(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта desktop:Width }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDesktopWidth

// start class TkwDesktopWidth

function TkwDesktopWidth.DesktopWidth(const aCtx: TtfwContext): Integer;
//#UC START# *EC4EA52ACE49_F2D32D266DD0_var*
//#UC END# *EC4EA52ACE49_F2D32D266DD0_var*
begin
//#UC START# *EC4EA52ACE49_F2D32D266DD0_impl*
 Result := Forms.Screen.DesktopWidth
//#UC END# *EC4EA52ACE49_F2D32D266DD0_impl*
end;//TkwDesktopWidth.DesktopWidth

procedure TkwDesktopWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((DesktopWidth(aCtx)));
end;//TkwDesktopWidth.DoDoIt

class function TkwDesktopWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'desktop:Width';
end;//TkwDesktopWidth.GetWordNameForRegister

function TkwDesktopWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwDesktopWidth.GetResultTypeInfo

type
 TkwScreenWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта screen:Width
*Тип результата:* Integer
*Пример:*
[code]
 anIndex screen:Width
[code]  }
 private
 // private methods
   function ScreenWidth(const aCtx: TtfwContext;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта screen:Width }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScreenWidth

// start class TkwScreenWidth

function TkwScreenWidth.ScreenWidth(const aCtx: TtfwContext;
  anIndex: Integer): Integer;
//#UC START# *FF7BA1B0E345_44BBDAE720F0_var*
//#UC END# *FF7BA1B0E345_44BBDAE720F0_var*
begin
//#UC START# *FF7BA1B0E345_44BBDAE720F0_impl*
 Result := Forms.Screen.Monitors[anIndex].Width;
//#UC END# *FF7BA1B0E345_44BBDAE720F0_impl*
end;//TkwScreenWidth.ScreenWidth

procedure TkwScreenWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_anIndex : Integer;
begin
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((ScreenWidth(aCtx, l_anIndex)));
end;//TkwScreenWidth.DoDoIt

class function TkwScreenWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'screen:Width';
end;//TkwScreenWidth.GetWordNameForRegister

function TkwScreenWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwScreenWidth.GetResultTypeInfo

type
 TkwScreenHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта screen:Height
*Тип результата:* Integer
*Пример:*
[code]
 anIndex screen:Height
[code]  }
 private
 // private methods
   function ScreenHeight(const aCtx: TtfwContext;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта screen:Height }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScreenHeight

// start class TkwScreenHeight

function TkwScreenHeight.ScreenHeight(const aCtx: TtfwContext;
  anIndex: Integer): Integer;
//#UC START# *726789FBF9F7_91E516864416_var*
//#UC END# *726789FBF9F7_91E516864416_var*
begin
//#UC START# *726789FBF9F7_91E516864416_impl*
 Result := Forms.Screen.Monitors[anIndex].Height;
//#UC END# *726789FBF9F7_91E516864416_impl*
end;//TkwScreenHeight.ScreenHeight

procedure TkwScreenHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_anIndex : Integer;
begin
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((ScreenHeight(aCtx, l_anIndex)));
end;//TkwScreenHeight.DoDoIt

class function TkwScreenHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'screen:Height';
end;//TkwScreenHeight.GetWordNameForRegister

function TkwScreenHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwScreenHeight.GetResultTypeInfo

type
 TkwMainScreenWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта MainScreen:Width
*Тип результата:* Integer
*Пример:*
[code]
 MainScreen:Width
[code]  }
 private
 // private methods
   function MainScreenWidth(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта MainScreen:Width }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMainScreenWidth

// start class TkwMainScreenWidth

function TkwMainScreenWidth.MainScreenWidth(const aCtx: TtfwContext): Integer;
//#UC START# *91F8A1F3931B_3832249557A1_var*
//#UC END# *91F8A1F3931B_3832249557A1_var*
begin
//#UC START# *91F8A1F3931B_3832249557A1_impl*
 Result := Forms.Screen.Monitors[0].Width;
//#UC END# *91F8A1F3931B_3832249557A1_impl*
end;//TkwMainScreenWidth.MainScreenWidth

procedure TkwMainScreenWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((MainScreenWidth(aCtx)));
end;//TkwMainScreenWidth.DoDoIt

class function TkwMainScreenWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MainScreen:Width';
end;//TkwMainScreenWidth.GetWordNameForRegister

function TkwMainScreenWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwMainScreenWidth.GetResultTypeInfo

type
 TkwMainScreenHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта MainScreen:Height
*Тип результата:* Integer
*Пример:*
[code]
 MainScreen:Height
[code]  }
 private
 // private methods
   function MainScreenHeight(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта MainScreen:Height }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMainScreenHeight

// start class TkwMainScreenHeight

function TkwMainScreenHeight.MainScreenHeight(const aCtx: TtfwContext): Integer;
//#UC START# *8218EB203DB0_8022C1F2B088_var*
//#UC END# *8218EB203DB0_8022C1F2B088_var*
begin
//#UC START# *8218EB203DB0_8022C1F2B088_impl*
 Result := Forms.Screen.Monitors[0].Height;
//#UC END# *8218EB203DB0_8022C1F2B088_impl*
end;//TkwMainScreenHeight.MainScreenHeight

procedure TkwMainScreenHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((MainScreenHeight(aCtx)));
end;//TkwMainScreenHeight.DoDoIt

class function TkwMainScreenHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MainScreen:Height';
end;//TkwMainScreenHeight.GetWordNameForRegister

function TkwMainScreenHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwMainScreenHeight.GetResultTypeInfo

type
 TkwScreenCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ScreenCount
*Тип результата:* Integer
*Пример:*
[code]
 ScreenCount
[code]  }
 private
 // private methods
   function ScreenCount(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта ScreenCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScreenCount

// start class TkwScreenCount

function TkwScreenCount.ScreenCount(const aCtx: TtfwContext): Integer;
//#UC START# *D8F53100D31F_4C862EA2F8C6_var*
//#UC END# *D8F53100D31F_4C862EA2F8C6_var*
begin
//#UC START# *D8F53100D31F_4C862EA2F8C6_impl*
 Result := Forms.Screen.MonitorCount;
//#UC END# *D8F53100D31F_4C862EA2F8C6_impl*
end;//TkwScreenCount.ScreenCount

procedure TkwScreenCount.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((ScreenCount(aCtx)));
end;//TkwScreenCount.DoDoIt

class function TkwScreenCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ScreenCount';
end;//TkwScreenCount.GetWordNameForRegister

function TkwScreenCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwScreenCount.GetResultTypeInfo

type
 TkwAskWindowToCloseItself = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта AskWindowToCloseItself
*Пример:*
[code]
 aWnd AskWindowToCloseItself
[code]  }
 private
 // private methods
   procedure AskWindowToCloseItself(const aCtx: TtfwContext;
    const aWnd: TtfwStackValue);
     {* Реализация слова скрипта AskWindowToCloseItself }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwAskWindowToCloseItself

// start class TkwAskWindowToCloseItself

procedure TkwAskWindowToCloseItself.AskWindowToCloseItself(const aCtx: TtfwContext;
  const aWnd: TtfwStackValue);
//#UC START# *7734C551216C_22E2D41E5FCD_var*
var
 l_Window: TWinControl;
 l_Handle: THandle;
//#UC END# *7734C551216C_22E2D41E5FCD_var*
begin
//#UC START# *7734C551216C_22E2D41E5FCD_impl*
 l_Window := nil;
 if (aWnd.rType = tfw_svtInt) then
 begin
  l_Handle := THandle(aWnd.AsInt);
  l_Window := FindControl(l_Handle);
 end//aCtx.rEngine.IsTopInt
 else
  l_Handle := 0;

 if Assigned(l_Window) or
    (aWnd.rType = tfw_svtObj) then
 begin
  if not Assigned(l_Window) then
   l_Window := aWnd.AsObject As TWinControl;
  RunnerAssert(l_Window is TWinControl, 'Где окно?!', aCtx);
  if Tl3CloseFormHelper.Instance.Close(l_Window) then
   Exit;
  if (l_Handle <> 0) then
   l_Handle := l_Window.Handle;
 end;//Assigned(l_Window) or
 RunnerAssert(l_Handle <> 0, 'Где окно?!', aCtx);
 PostMessage(l_Handle, WM_CLOSE, 0, 0);
//#UC END# *7734C551216C_22E2D41E5FCD_impl*
end;//TkwAskWindowToCloseItself.AskWindowToCloseItself

procedure TkwAskWindowToCloseItself.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : TtfwStackValue;
begin
 try
  l_aWnd := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 AskWindowToCloseItself(aCtx, l_aWnd);
end;//TkwAskWindowToCloseItself.DoDoIt

class function TkwAskWindowToCloseItself.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'AskWindowToCloseItself';
end;//TkwAskWindowToCloseItself.GetWordNameForRegister

function TkwAskWindowToCloseItself.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwAskWindowToCloseItself.GetResultTypeInfo

type
 TkwScreenShot2File = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ScreenShot2File
[panel]Описание: снимает скриншот с передаваемого контрола и сохраняет его в файл bmp. Формат:
[code]
aFileName aHeight aWidth aTop aLeft aHandle ScreenShot2File
[code]
где aFileName - имя файла с расширением bmp, в который сохранять скриншот
aHandle - хендл контрола, с которого снимаем скриншот (0 - для снятия скриншота с десктопа).
aLeft, aTop, aWidth, aHeight - начальные координаты и размеры прямоугольной области, с которой снимаем скриншот.
Пример:
[code]
  INTEGER VAR l_Handle
  "Контрол в фокусе" pop:control:GetHandle >>> l_Handle
  STRING VAR l_FileName
  script:FileName '.bmp' sysutils:ChangeFileExt
  sysutils:ExtractFileName >>> l_FileName  
  l_FileName 200 200 0 0 l_Handle ScreenShot2File
[code][panel]
*Пример:*
[code]
 aFileName aHeight aWidth aTop aLeft aWnd ScreenShot2File
[code]  }
 private
 // private methods
   procedure ScreenShot2File(const aCtx: TtfwContext;
    aWnd: THandle;
    aLeft: Integer;
    aTop: Integer;
    aWidth: Integer;
    aHeight: Integer;
    const aFileName: AnsiString);
     {* Реализация слова скрипта ScreenShot2File }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScreenShot2File

// start class TkwScreenShot2File

procedure TkwScreenShot2File.ScreenShot2File(const aCtx: TtfwContext;
  aWnd: THandle;
  aLeft: Integer;
  aTop: Integer;
  aWidth: Integer;
  aHeight: Integer;
  const aFileName: AnsiString);
//#UC START# *E3689417D97C_D7673935EC18_var*
//#UC END# *E3689417D97C_D7673935EC18_var*
begin
//#UC START# *E3689417D97C_D7673935EC18_impl*
 MakeScreenshot(aWnd, Rect(aLeft, aTop, aLeft + aWidth, aTop + aHeight), aFileName, false, aCtx, Self);
//#UC END# *E3689417D97C_D7673935EC18_impl*
end;//TkwScreenShot2File.ScreenShot2File

procedure TkwScreenShot2File.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
 l_aLeft : Integer;
 l_aTop : Integer;
 l_aWidth : Integer;
 l_aHeight : Integer;
 l_aFileName : AnsiString;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLeft := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLeft: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTop := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTop: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aWidth := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWidth: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aHeight := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aHeight: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ScreenShot2File(aCtx, l_aWnd, l_aLeft, l_aTop, l_aWidth, l_aHeight, l_aFileName);
end;//TkwScreenShot2File.DoDoIt

class function TkwScreenShot2File.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ScreenShot2File';
end;//TkwScreenShot2File.GetWordNameForRegister

function TkwScreenShot2File.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwScreenShot2File.GetResultTypeInfo

type
 TkwScreenShot2FileWithCheck = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ScreenShot2FileWithCheck
[panel]Описание: снимает скриншот с передаваемого контрола и сохраняет его в файл bmp. После окончания теста производится сравнение с эталоном.
Формат:
[code]
aFileName aHeight aWidth aTop aLeft aHandle ScreenShot2FileWithCheck
[code]
где aFileName - имя файла с расширением bmp, в который сохранять скриншот
aHandle - хендл контрола, с которого снимаем скриншот (0 - для снятия скриншота с десктопа).
aLeft, aTop, aWidth, aHeight - начальные координаты и размеры прямоугольной области, с которой снимаем скриншот.
Пример:
[code]
  INTEGER VAR l_Handle
  "Контрол в фокусе" pop:control:GetHandle >>> l_Handle
  STRING VAR l_FileName
  script:FileName '.bmp' sysutils:ChangeFileExt
  sysutils:ExtractFileName >>> l_FileName  
  l_FileName 200 200 0 0 l_Handle ScreenShot2FileWithCheck
[code][panel]
*Пример:*
[code]
 aFileName aHeight aWidth aTop aLeft aWnd ScreenShot2FileWithCheck
[code]  }
 private
 // private methods
   procedure ScreenShot2FileWithCheck(const aCtx: TtfwContext;
    aWnd: THandle;
    aLeft: Integer;
    aTop: Integer;
    aWidth: Integer;
    aHeight: Integer;
    const aFileName: AnsiString);
     {* Реализация слова скрипта ScreenShot2FileWithCheck }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScreenShot2FileWithCheck

// start class TkwScreenShot2FileWithCheck

procedure TkwScreenShot2FileWithCheck.ScreenShot2FileWithCheck(const aCtx: TtfwContext;
  aWnd: THandle;
  aLeft: Integer;
  aTop: Integer;
  aWidth: Integer;
  aHeight: Integer;
  const aFileName: AnsiString);
//#UC START# *8B949444F0A6_13CADBEDE41C_var*
//#UC END# *8B949444F0A6_13CADBEDE41C_var*
begin
//#UC START# *8B949444F0A6_13CADBEDE41C_impl*
 MakeScreenshot(aWnd, Rect(aLeft, aTop, aLeft + aWidth, aTop + aHeight), aFileName, true, aCtx, Self);
//#UC END# *8B949444F0A6_13CADBEDE41C_impl*
end;//TkwScreenShot2FileWithCheck.ScreenShot2FileWithCheck

procedure TkwScreenShot2FileWithCheck.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWnd : THandle;
 l_aLeft : Integer;
 l_aTop : Integer;
 l_aWidth : Integer;
 l_aHeight : Integer;
 l_aFileName : AnsiString;
begin
 try
  l_aWnd := THandle(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWnd: THandle : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLeft := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLeft: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTop := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTop: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aWidth := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWidth: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aHeight := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aHeight: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ScreenShot2FileWithCheck(aCtx, l_aWnd, l_aLeft, l_aTop, l_aWidth, l_aHeight, l_aFileName);
end;//TkwScreenShot2FileWithCheck.DoDoIt

class function TkwScreenShot2FileWithCheck.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ScreenShot2FileWithCheck';
end;//TkwScreenShot2FileWithCheck.GetWordNameForRegister

function TkwScreenShot2FileWithCheck.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwScreenShot2FileWithCheck.GetResultTypeInfo

function IterateWindowsMethod(hWindow: THandle;
  aData: PIterateWindowsRec): Boolean;
//#UC START# *510AB608018E_4F854878032F_var*
//#UC END# *510AB608018E_4F854878032F_var*
begin
//#UC START# *510AB608018E_4F854878032F_impl*
 Result := True;
 try
  aData.rCtx.rEngine.PushInt(Integer(hWindow));
  aData.rEnumMethod.DoIt(aData.rCtx^);
 except
  on EtfwBreakIterator do
   Result := False;
 end;//try..except
//#UC END# *510AB608018E_4F854878032F_impl*
end;//IterateWindowsMethod

procedure MakeScreenshot(aWnd: THandle;
  const aRect: TRect;
  const aFileName: AnsiString;
  aWithCheck: Boolean;
  const aCtx: TtfwContext;
  aCaller: TtfwWord);
//#UC START# *551D697C0023_4F854878032F_var*
var
 l_Top     : Integer;
 l_Left    : Integer;
 l_Width   : Integer;
 l_Height  : Integer;
 l_Bitmap  : TBitmap;
 l_FileName: AnsiString;
//#UC END# *551D697C0023_4F854878032F_var*
begin
//#UC START# *551D697C0023_4F854878032F_impl*
 l_Bitmap := TBitmap.Create;
 try
  l_Left := aRect.Left;
  l_Top := aRect.Top;
  l_Width := aRect.Right - aRect.Left;
  l_Height := aRect.Bottom - aRect.Top;
  aCaller.RunnerAssert(l_Height > 0, 'Высота скриншота меньше или равна 0.', aCtx);
  aCaller.RunnerAssert(l_Width > 0, 'Ширина скриншота меньше или равна 0.', aCtx);
  l3MakeScreenShot(l_Bitmap, l_Left, l_Top, l_Width, l_Height, aWnd);
  l_FileName := aCtx.rCaller.ResolveOutputFilePath(aFileName);
  l_Bitmap.SaveToFile(l_FileName);
  if aWithCheck then
  begin
   with Tl3PicturePathService.Instance do
   begin
    AddPicturePath(l_FileName);
    SetTestName('');
   end; // with Tl3PicturePathService.Instance do
   aCtx.rCaller.CheckPictureOnly;
  end;//aWithCheck
 finally
  FreeAndNil(l_Bitmap);
 end;
//#UC END# *551D697C0023_4F854878032F_impl*
end;//MakeScreenshot
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация wnd_IsVisible
 TkwWndIsVisible.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация wnd_GetClassName
 TkwWndGetClassName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация wnd_GetWindowText
 TkwWndGetWindowText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация wnd_CloseWindow
 TkwWndCloseWindow.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация wnd_WindowIsMine
 TkwWndWindowIsMine.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация wnd_SetForeground
 TkwWndSetForeground.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация WinTreeGetCurrentText
 TkwWinTreeGetCurrentText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IterateChildWindows
 TkwIterateChildWindows.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IterateWindows
 TkwIterateWindows.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация WindowFromPoint
 TkwWindowFromPoint.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GetForegroundWindow
 TkwGetForegroundWindow.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация FindWindowByCaption
 TkwFindWindowByCaption.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SetFuzzInPercent
 TkwSetFuzzInPercent.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация desktop_Height
 TkwDesktopHeight.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация desktop_Width
 TkwDesktopWidth.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация screen_Width
 TkwScreenWidth.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация screen_Height
 TkwScreenHeight.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация MainScreen_Width
 TkwMainScreenWidth.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация MainScreen_Height
 TkwMainScreenHeight.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ScreenCount
 TkwScreenCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация AskWindowToCloseItself
 TkwAskWindowToCloseItself.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ScreenShot2File
 TkwScreenShot2File.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ScreenShot2FileWithCheck
 TkwScreenShot2FileWithCheck.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа THandle
 TtfwTypeRegistrator.RegisterType(TypeInfo(THandle));
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
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TPoint
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts

end.