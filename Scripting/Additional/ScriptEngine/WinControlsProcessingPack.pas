unit WinControlsProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "WinControlsProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::WinControlsProcessing::WinControlsProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Types,
  Classes,
  Controls,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Messages,
  Windows,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopControlMouseLeftClick = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:MouseLeftClick
*Пример:*
[code]
 aPoint aControl pop:Control:MouseLeftClick
[code]  }
 private
 // private methods
   procedure MouseLeftClick(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aPoint: TPoint);
     {* Реализация слова скрипта pop:Control:MouseLeftClick }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlMouseLeftClick

// start class TkwPopControlMouseLeftClick

procedure TkwPopControlMouseLeftClick.MouseLeftClick(const aCtx: TtfwContext;
  aControl: TWinControl;
  const aPoint: TPoint);
//#UC START# *D86EEEFC03D7_207CDF6BFC46_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *D86EEEFC03D7_207CDF6BFC46_var*
begin
//#UC START# *D86EEEFC03D7_207CDF6BFC46_impl*
 with aControl.BoundsRect do
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aControl.Handle, WM_LBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_LBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *D86EEEFC03D7_207CDF6BFC46_impl*
end;//TkwPopControlMouseLeftClick.MouseLeftClick

procedure TkwPopControlMouseLeftClick.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
 l_aPoint : TPoint;
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
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 MouseLeftClick(aCtx, l_aControl, l_aPoint);
end;//TkwPopControlMouseLeftClick.DoDoIt

class function TkwPopControlMouseLeftClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:MouseLeftClick';
end;//TkwPopControlMouseLeftClick.GetWordNameForRegister

function TkwPopControlMouseLeftClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlMouseLeftClick.GetResultTypeInfo

type
 TkwPopControlMouseMiddleClick = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:MouseMiddleClick
*Пример:*
[code]
 aPoint aControl pop:Control:MouseMiddleClick
[code]  }
 private
 // private methods
   procedure MouseMiddleClick(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aPoint: TPoint);
     {* Реализация слова скрипта pop:Control:MouseMiddleClick }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlMouseMiddleClick

// start class TkwPopControlMouseMiddleClick

procedure TkwPopControlMouseMiddleClick.MouseMiddleClick(const aCtx: TtfwContext;
  aControl: TWinControl;
  const aPoint: TPoint);
//#UC START# *0EBF330C06BD_652B805E6BDC_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *0EBF330C06BD_652B805E6BDC_var*
begin
//#UC START# *0EBF330C06BD_652B805E6BDC_impl*
 with aControl.BoundsRect do
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aControl.Handle, WM_MBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_MBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *0EBF330C06BD_652B805E6BDC_impl*
end;//TkwPopControlMouseMiddleClick.MouseMiddleClick

procedure TkwPopControlMouseMiddleClick.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
 l_aPoint : TPoint;
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
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 MouseMiddleClick(aCtx, l_aControl, l_aPoint);
end;//TkwPopControlMouseMiddleClick.DoDoIt

class function TkwPopControlMouseMiddleClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:MouseMiddleClick';
end;//TkwPopControlMouseMiddleClick.GetWordNameForRegister

function TkwPopControlMouseMiddleClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlMouseMiddleClick.GetResultTypeInfo

type
 TkwPopControlMouseRightClick = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:MouseRightClick
*Пример:*
[code]
 aPoint aControl pop:Control:MouseRightClick
[code]  }
 private
 // private methods
   procedure MouseRightClick(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aPoint: TPoint);
     {* Реализация слова скрипта pop:Control:MouseRightClick }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlMouseRightClick

// start class TkwPopControlMouseRightClick

procedure TkwPopControlMouseRightClick.MouseRightClick(const aCtx: TtfwContext;
  aControl: TWinControl;
  const aPoint: TPoint);
//#UC START# *700C331C0034_01A83C03B567_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *700C331C0034_01A83C03B567_var*
begin
//#UC START# *700C331C0034_01A83C03B567_impl*
 with aControl.BoundsRect do
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aControl.Handle, WM_RBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_RBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *700C331C0034_01A83C03B567_impl*
end;//TkwPopControlMouseRightClick.MouseRightClick

procedure TkwPopControlMouseRightClick.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
 l_aPoint : TPoint;
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
 try
  l_aPoint := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPoint: TPoint : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 MouseRightClick(aCtx, l_aControl, l_aPoint);
end;//TkwPopControlMouseRightClick.DoDoIt

class function TkwPopControlMouseRightClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:MouseRightClick';
end;//TkwPopControlMouseRightClick.GetWordNameForRegister

function TkwPopControlMouseRightClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlMouseRightClick.GetResultTypeInfo

type
 TkwPopControlFindControlByName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:FindControlByName
*Тип результата:* TComponent
*Пример:*
[code]
 aName aControl pop:Control:FindControlByName
[code]  }
 private
 // private methods
   function FindControlByName(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aName: AnsiString): TComponent;
     {* Реализация слова скрипта pop:Control:FindControlByName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlFindControlByName

// start class TkwPopControlFindControlByName

function TkwPopControlFindControlByName.FindControlByName(const aCtx: TtfwContext;
  aControl: TWinControl;
  const aName: AnsiString): TComponent;
//#UC START# *50D08C92A338_89E1228A3BE4_var*
 function DoFindControl(aControl: TWinControl): TComponent{TControl};
 var
  l_Index : Integer;
  l_C : TControl;
  l_Cmp : TComponent;
 begin//DoFindControl
  if (aControl.Name = aName) then
   Result := aControl
  else
  begin
   Result := nil;
   for l_Index := 0 to Pred(aControl.ControlCount) do
   begin
    l_C := aControl.Controls[l_Index];
    if (l_C.Name = aName) then
    begin
     Result := l_C;
     Exit;
    end//l_C.Name = l_Name
    else
    begin
     if (l_C Is TWinControl) then
     begin
      Result := DoFindControl(TWinControl(l_C));
      if (Result <> nil) then
       Exit;
     end;//l_C Is TWinControl
    end;//l_C.Name = l_Name
   end;//for l_Index
   if (Result = nil) then
    for l_Index := 0 to Pred(aControl.ComponentCount) do
    begin
     l_Cmp := aControl.Components[l_Index];
     if (l_Cmp Is TControl) AND (l_Cmp.Name = aName) then
     begin
      Result := {TControl}(l_Cmp);
      Exit;
     end//l_C.Name = aName
     else
     if (l_Cmp Is TWinControl) then
     begin
      Result := DoFindControl(TWinControl(l_Cmp));
      if (Result <> nil) then
       Exit;
     end;//l_C Is TWinControl
     Result := l_Cmp.FindComponent(aName);
     if (Result <> nil) then
      Exit;
     if (l_Cmp.Name = aName) then
     begin
      Result := l_Cmp;
      Exit;
     end;//l_C.Name = aName
    end;//for l_Index
  end;//aControl.Name = l_Name
 end;//DoFindControl
//#UC END# *50D08C92A338_89E1228A3BE4_var*
begin
//#UC START# *50D08C92A338_89E1228A3BE4_impl*
 Result := DoFindControl(aControl);
//#UC END# *50D08C92A338_89E1228A3BE4_impl*
end;//TkwPopControlFindControlByName.FindControlByName

procedure TkwPopControlFindControlByName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
 l_aName : AnsiString;
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
 try
  l_aName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((FindControlByName(aCtx, l_aControl, l_aName)));
end;//TkwPopControlFindControlByName.DoDoIt

class function TkwPopControlFindControlByName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:FindControlByName';
end;//TkwPopControlFindControlByName.GetWordNameForRegister

function TkwPopControlFindControlByName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TComponent);
end;//TkwPopControlFindControlByName.GetResultTypeInfo

type
 TkwPopControlGetControl = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:GetControl
*Тип результата:* TControl
*Пример:*
[code]
 anIndex aControl pop:Control:GetControl
[code]  }
 private
 // private methods
   function GetControl(const aCtx: TtfwContext;
    aControl: TWinControl;
    anIndex: Integer): TControl;
     {* Реализация слова скрипта pop:Control:GetControl }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlGetControl

// start class TkwPopControlGetControl

function TkwPopControlGetControl.GetControl(const aCtx: TtfwContext;
  aControl: TWinControl;
  anIndex: Integer): TControl;
//#UC START# *F53158879374_0EDEBD14C685_var*
//#UC END# *F53158879374_0EDEBD14C685_var*
begin
//#UC START# *F53158879374_0EDEBD14C685_impl*
 Result := aControl.Controls[anIndex];
//#UC END# *F53158879374_0EDEBD14C685_impl*
end;//TkwPopControlGetControl.GetControl

procedure TkwPopControlGetControl.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
 l_anIndex : Integer;
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
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetControl(aCtx, l_aControl, l_anIndex)));
end;//TkwPopControlGetControl.DoDoIt

class function TkwPopControlGetControl.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:GetControl';
end;//TkwPopControlGetControl.GetWordNameForRegister

function TkwPopControlGetControl.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TControl);
end;//TkwPopControlGetControl.GetResultTypeInfo

type
 TkwPopControlMouseWheelUp = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:MouseWheelUp
*Пример:*
[code]
 aControl pop:Control:MouseWheelUp
[code]  }
 private
 // private methods
   procedure MouseWheelUp(const aCtx: TtfwContext;
    aControl: TWinControl);
     {* Реализация слова скрипта pop:Control:MouseWheelUp }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlMouseWheelUp

// start class TkwPopControlMouseWheelUp

procedure TkwPopControlMouseWheelUp.MouseWheelUp(const aCtx: TtfwContext;
  aControl: TWinControl);
//#UC START# *2F3D3440A024_60259FDDB2DC_var*
//#UC END# *2F3D3440A024_60259FDDB2DC_var*
begin
//#UC START# *2F3D3440A024_60259FDDB2DC_impl*
 SendMessage(aControl.Handle, WM_VSCROLL, MakeWParam(SB_LINEUP, 0), 0);
//#UC END# *2F3D3440A024_60259FDDB2DC_impl*
end;//TkwPopControlMouseWheelUp.MouseWheelUp

procedure TkwPopControlMouseWheelUp.DoDoIt(const aCtx: TtfwContext);
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
 MouseWheelUp(aCtx, l_aControl);
end;//TkwPopControlMouseWheelUp.DoDoIt

class function TkwPopControlMouseWheelUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:MouseWheelUp';
end;//TkwPopControlMouseWheelUp.GetWordNameForRegister

function TkwPopControlMouseWheelUp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlMouseWheelUp.GetResultTypeInfo

type
 TkwPopControlMouseWheelDown = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:MouseWheelDown
*Пример:*
[code]
 aControl pop:Control:MouseWheelDown
[code]  }
 private
 // private methods
   procedure MouseWheelDown(const aCtx: TtfwContext;
    aControl: TWinControl);
     {* Реализация слова скрипта pop:Control:MouseWheelDown }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlMouseWheelDown

// start class TkwPopControlMouseWheelDown

procedure TkwPopControlMouseWheelDown.MouseWheelDown(const aCtx: TtfwContext;
  aControl: TWinControl);
//#UC START# *31CD1215C543_5676987B6AD8_var*
//#UC END# *31CD1215C543_5676987B6AD8_var*
begin
//#UC START# *31CD1215C543_5676987B6AD8_impl*
 SendMessage(aControl.Handle, WM_VSCROLL, MakeWParam(SB_LINEDOWN, 0), 0);
//#UC END# *31CD1215C543_5676987B6AD8_impl*
end;//TkwPopControlMouseWheelDown.MouseWheelDown

procedure TkwPopControlMouseWheelDown.DoDoIt(const aCtx: TtfwContext);
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
 MouseWheelDown(aCtx, l_aControl);
end;//TkwPopControlMouseWheelDown.DoDoIt

class function TkwPopControlMouseWheelDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:MouseWheelDown';
end;//TkwPopControlMouseWheelDown.GetWordNameForRegister

function TkwPopControlMouseWheelDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlMouseWheelDown.GetResultTypeInfo

type
 TkwPopControlSetFocus = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:SetFocus
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:SetFocus
[code]  }
 private
 // private methods
   function SetFocus(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
     {* Реализация слова скрипта pop:Control:SetFocus }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlSetFocus

// start class TkwPopControlSetFocus

function TkwPopControlSetFocus.SetFocus(const aCtx: TtfwContext;
  aControl: TWinControl): Boolean;
//#UC START# *E30431C2D5CE_52E34524FDF7_var*
//#UC END# *E30431C2D5CE_52E34524FDF7_var*
begin
//#UC START# *E30431C2D5CE_52E34524FDF7_impl*
 if aControl.CanFocus then
  aControl.SetFocus;
 Result := aControl.Focused;
//#UC END# *E30431C2D5CE_52E34524FDF7_impl*
end;//TkwPopControlSetFocus.SetFocus

procedure TkwPopControlSetFocus.DoDoIt(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushBool((SetFocus(aCtx, l_aControl)));
end;//TkwPopControlSetFocus.DoDoIt

class function TkwPopControlSetFocus.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:SetFocus';
end;//TkwPopControlSetFocus.GetWordNameForRegister

function TkwPopControlSetFocus.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlSetFocus.GetResultTypeInfo

type
 TkwPopControlMouseLeftDragAndDrop = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:MouseLeftDragAndDrop
*Пример:*
[code]
 aPoint aDelta aControl pop:Control:MouseLeftDragAndDrop
[code]  }
 private
 // private methods
   procedure MouseLeftDragAndDrop(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aDelta: TPoint;
    const aPoint: TPoint);
     {* Реализация слова скрипта pop:Control:MouseLeftDragAndDrop }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlMouseLeftDragAndDrop

// start class TkwPopControlMouseLeftDragAndDrop

procedure TkwPopControlMouseLeftDragAndDrop.MouseLeftDragAndDrop(const aCtx: TtfwContext;
  aControl: TWinControl;
  const aDelta: TPoint;
  const aPoint: TPoint);
//#UC START# *E69FBA5A5B0F_7A8A3BB834BD_var*
var
 l_Pos       : TPoint;
 l_Pos1      : TPoint;
 l_MousePos  : TSmallPoint;
 l_MousePos1 : TSmallPoint;
//#UC END# *E69FBA5A5B0F_7A8A3BB834BD_var*
begin
//#UC START# *E69FBA5A5B0F_7A8A3BB834BD_impl*
 with aControl.BoundsRect do
 begin
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
  l_Pos1 := Point(l_Pos.X + aDelta.X, l_Pos.Y + aDelta.Y);
 end;//with aControl.BoundsRect 
 l_MousePos := PointToSmallPoint(l_Pos);
 l_MousePos1 := PointToSmallPoint(l_Pos1);

 SendMessage(aControl.Handle, WM_LBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_MOUSEMOVE, 0, Longint(l_MousePos1));
 SendMessage(aControl.Handle, WM_LBUTTONUP, 0, Longint(l_MousePos1));
//#UC END# *E69FBA5A5B0F_7A8A3BB834BD_impl*
end;//TkwPopControlMouseLeftDragAndDrop.MouseLeftDragAndDrop

procedure TkwPopControlMouseLeftDragAndDrop.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aControl : TWinControl;
 l_aDelta : TPoint;
 l_aPoint : TPoint;
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
 try
  l_aDelta := (aCtx.rEngine.PopPoint);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDelta: TPoint : ' + E.Message, aCtx);
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
 MouseLeftDragAndDrop(aCtx, l_aControl, l_aDelta, l_aPoint);
end;//TkwPopControlMouseLeftDragAndDrop.DoDoIt

class function TkwPopControlMouseLeftDragAndDrop.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:MouseLeftDragAndDrop';
end;//TkwPopControlMouseLeftDragAndDrop.GetWordNameForRegister

function TkwPopControlMouseLeftDragAndDrop.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopControlMouseLeftDragAndDrop.GetResultTypeInfo

type
 TkwPopControlControlCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:ControlCount
*Тип результата:* Integer
*Пример:*
[code]
 aControl pop:Control:ControlCount
[code]  }
 private
 // private methods
   function ControlCount(const aCtx: TtfwContext;
    aControl: TWinControl): Integer;
     {* Реализация слова скрипта pop:Control:ControlCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlControlCount

// start class TkwPopControlControlCount

function TkwPopControlControlCount.ControlCount(const aCtx: TtfwContext;
  aControl: TWinControl): Integer;
 {-}
begin
 Result := aControl.ControlCount;
end;//TkwPopControlControlCount.ControlCount

procedure TkwPopControlControlCount.DoDoIt(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushInt((ControlCount(aCtx, l_aControl)));
end;//TkwPopControlControlCount.DoDoIt

class function TkwPopControlControlCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:ControlCount';
end;//TkwPopControlControlCount.GetWordNameForRegister

function TkwPopControlControlCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopControlControlCount.GetResultTypeInfo

type
 TkwPopControlHandle = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Handle
*Тип результата:* Cardinal
*Пример:*
[code]
 aControl pop:Control:Handle
[code]  }
 private
 // private methods
   function Handle(const aCtx: TtfwContext;
    aControl: TWinControl): Cardinal;
     {* Реализация слова скрипта pop:Control:Handle }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlHandle

// start class TkwPopControlHandle

function TkwPopControlHandle.Handle(const aCtx: TtfwContext;
  aControl: TWinControl): Cardinal;
 {-}
begin
 Result := aControl.Handle;
end;//TkwPopControlHandle.Handle

procedure TkwPopControlHandle.DoDoIt(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushInt(Integer(Handle(aCtx, l_aControl)));
end;//TkwPopControlHandle.DoDoIt

class function TkwPopControlHandle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Handle';
end;//TkwPopControlHandle.GetWordNameForRegister

function TkwPopControlHandle.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Cardinal);
end;//TkwPopControlHandle.GetResultTypeInfo

type
 TkwPopControlFocused = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:Focused
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:Focused
[code]  }
 private
 // private methods
   function Focused(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
     {* Реализация слова скрипта pop:Control:Focused }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlFocused

// start class TkwPopControlFocused

function TkwPopControlFocused.Focused(const aCtx: TtfwContext;
  aControl: TWinControl): Boolean;
 {-}
begin
 Result := aControl.Focused;
end;//TkwPopControlFocused.Focused

procedure TkwPopControlFocused.DoDoIt(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushBool((Focused(aCtx, l_aControl)));
end;//TkwPopControlFocused.DoDoIt

class function TkwPopControlFocused.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:Focused';
end;//TkwPopControlFocused.GetWordNameForRegister

function TkwPopControlFocused.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlFocused.GetResultTypeInfo

type
 TkwPopControlCanFocus = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Control:CanFocus
*Тип результата:* Boolean
*Пример:*
[code]
 aControl pop:Control:CanFocus
[code]  }
 private
 // private methods
   function CanFocus(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
     {* Реализация слова скрипта pop:Control:CanFocus }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopControlCanFocus

// start class TkwPopControlCanFocus

function TkwPopControlCanFocus.CanFocus(const aCtx: TtfwContext;
  aControl: TWinControl): Boolean;
 {-}
begin
 Result := aControl.CanFocus;
end;//TkwPopControlCanFocus.CanFocus

procedure TkwPopControlCanFocus.DoDoIt(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushBool((CanFocus(aCtx, l_aControl)));
end;//TkwPopControlCanFocus.DoDoIt

class function TkwPopControlCanFocus.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Control:CanFocus';
end;//TkwPopControlCanFocus.GetWordNameForRegister

function TkwPopControlCanFocus.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopControlCanFocus.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_Control_MouseLeftClick
 TkwPopControlMouseLeftClick.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_MouseMiddleClick
 TkwPopControlMouseMiddleClick.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_MouseRightClick
 TkwPopControlMouseRightClick.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_FindControlByName
 TkwPopControlFindControlByName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_GetControl
 TkwPopControlGetControl.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_MouseWheelUp
 TkwPopControlMouseWheelUp.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_MouseWheelDown
 TkwPopControlMouseWheelDown.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_SetFocus
 TkwPopControlSetFocus.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_MouseLeftDragAndDrop
 TkwPopControlMouseLeftDragAndDrop.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_ControlCount
 TkwPopControlControlCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Handle
 TkwPopControlHandle.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_Focused
 TkwPopControlFocused.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Control_CanFocus
 TkwPopControlCanFocus.RegisterInEngine;
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
// Регистрация типа TPoint
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TComponent
 TtfwTypeRegistrator.RegisterType(TypeInfo(TComponent));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TControl
 TtfwTypeRegistrator.RegisterType(TypeInfo(TControl));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Cardinal
 TtfwTypeRegistrator.RegisterType(TypeInfo(Cardinal));
{$IfEnd} //not NoScripts

end.