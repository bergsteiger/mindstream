unit VGSceneWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VG"
// Модуль: "VGSceneWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VG::VGSceneWords::VGSceneWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  Controls,
  vgVisualObject,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  VGSceneAndWinControlPack,
  VGComboBoxPack,
  vg_controls,
  Classes,
  vgObject,
  vg_objects,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TvgVisualObjectFriend = {abstract} class(TvgVisualObject)
  {* Друг для TvgVisualObject }
 end;//TvgVisualObjectFriend

 TkwVgControlVisible = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Visible
*Тип результата:* Boolean
*Пример:*
[code]
 aVisualObject vg:control:Visible
[code]  }
 private
 // private methods
   function VgControlVisible(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Boolean;
     {* Реализация слова скрипта vg:control:Visible }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlVisible

// start class TkwVgControlVisible

function TkwVgControlVisible.VgControlVisible(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Boolean;
//#UC START# *99CDF025D5A5_89C786B088C6_var*
//#UC END# *99CDF025D5A5_89C786B088C6_var*
begin
//#UC START# *99CDF025D5A5_89C786B088C6_impl*
 Result := aVisualObject.CheckParentVisible
//#UC END# *99CDF025D5A5_89C786B088C6_impl*
end;//TkwVgControlVisible.VgControlVisible

procedure TkwVgControlVisible.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((VgControlVisible(aCtx, l_aVisualObject)));
end;//TkwVgControlVisible.DoDoIt

class function TkwVgControlVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Visible';
end;//TkwVgControlVisible.GetWordNameForRegister

function TkwVgControlVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwVgControlVisible.GetResultTypeInfo

type
 TkwVgControlHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Height
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:Height
[code]  }
 private
 // private methods
   function VgControlHeight(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:Height }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlHeight

// start class TkwVgControlHeight

function TkwVgControlHeight.VgControlHeight(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *20F09B87AF2A_05A703B5907E_var*
//#UC END# *20F09B87AF2A_05A703B5907E_var*
begin
//#UC START# *20F09B87AF2A_05A703B5907E_impl*
 Result := Round(aVisualObject.Height);
//#UC END# *20F09B87AF2A_05A703B5907E_impl*
end;//TkwVgControlHeight.VgControlHeight

procedure TkwVgControlHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlHeight(aCtx, l_aVisualObject)));
end;//TkwVgControlHeight.DoDoIt

class function TkwVgControlHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Height';
end;//TkwVgControlHeight.GetWordNameForRegister

function TkwVgControlHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlHeight.GetResultTypeInfo

type
 TkwVgControlWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Width
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:Width
[code]  }
 private
 // private methods
   function VgControlWidth(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:Width }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlWidth

// start class TkwVgControlWidth

function TkwVgControlWidth.VgControlWidth(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *68ABF3A0E921_6D438B9C5A14_var*
//#UC END# *68ABF3A0E921_6D438B9C5A14_var*
begin
//#UC START# *68ABF3A0E921_6D438B9C5A14_impl*
 Result := Round(aVisualObject.Width)
//#UC END# *68ABF3A0E921_6D438B9C5A14_impl*
end;//TkwVgControlWidth.VgControlWidth

procedure TkwVgControlWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlWidth(aCtx, l_aVisualObject)));
end;//TkwVgControlWidth.DoDoIt

class function TkwVgControlWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Width';
end;//TkwVgControlWidth.GetWordNameForRegister

function TkwVgControlWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlWidth.GetResultTypeInfo

type
 TkwVgControlLeft = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Left
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:Left
[code]  }
 private
 // private methods
   function VgControlLeft(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:Left }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlLeft

// start class TkwVgControlLeft

function TkwVgControlLeft.VgControlLeft(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *015BF6CE41DE_0ED393F18084_var*
//#UC END# *015BF6CE41DE_0ED393F18084_var*
begin
//#UC START# *015BF6CE41DE_0ED393F18084_impl*
 Result := Round(aVisualObject.Position.X)
//#UC END# *015BF6CE41DE_0ED393F18084_impl*
end;//TkwVgControlLeft.VgControlLeft

procedure TkwVgControlLeft.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlLeft(aCtx, l_aVisualObject)));
end;//TkwVgControlLeft.DoDoIt

class function TkwVgControlLeft.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Left';
end;//TkwVgControlLeft.GetWordNameForRegister

function TkwVgControlLeft.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlLeft.GetResultTypeInfo

type
 TkwVgControlTop = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Top
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:Top
[code]  }
 private
 // private methods
   function VgControlTop(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:Top }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlTop

// start class TkwVgControlTop

function TkwVgControlTop.VgControlTop(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *15CFF0C454F0_E4BF70016043_var*
//#UC END# *15CFF0C454F0_E4BF70016043_var*
begin
//#UC START# *15CFF0C454F0_E4BF70016043_impl*
 Result := Round(aVisualObject.Position.Y)
//#UC END# *15CFF0C454F0_E4BF70016043_impl*
end;//TkwVgControlTop.VgControlTop

procedure TkwVgControlTop.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlTop(aCtx, l_aVisualObject)));
end;//TkwVgControlTop.DoDoIt

class function TkwVgControlTop.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Top';
end;//TkwVgControlTop.GetWordNameForRegister

function TkwVgControlTop.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlTop.GetResultTypeInfo

type
 TkwVgControlEnabled = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Enabled
*Тип результата:* Boolean
*Пример:*
[code]
 aVisualObject vg:control:Enabled
[code]  }
 private
 // private methods
   function VgControlEnabled(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Boolean;
     {* Реализация слова скрипта vg:control:Enabled }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlEnabled

// start class TkwVgControlEnabled

function TkwVgControlEnabled.VgControlEnabled(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Boolean;
//#UC START# *7861C2BB2686_20CB200689C7_var*
//#UC END# *7861C2BB2686_20CB200689C7_var*
begin
//#UC START# *7861C2BB2686_20CB200689C7_impl*
 Result := aVisualObject.Enabled
//#UC END# *7861C2BB2686_20CB200689C7_impl*
end;//TkwVgControlEnabled.VgControlEnabled

procedure TkwVgControlEnabled.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((VgControlEnabled(aCtx, l_aVisualObject)));
end;//TkwVgControlEnabled.DoDoIt

class function TkwVgControlEnabled.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Enabled';
end;//TkwVgControlEnabled.GetWordNameForRegister

function TkwVgControlEnabled.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwVgControlEnabled.GetResultTypeInfo

type
 TkwVgControlName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Name
*Тип результата:* String
*Пример:*
[code]
 aVisualObject vg:control:Name
[code]  }
 private
 // private methods
   function VgControlName(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): AnsiString;
     {* Реализация слова скрипта vg:control:Name }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlName

// start class TkwVgControlName

function TkwVgControlName.VgControlName(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): AnsiString;
//#UC START# *FEEF38963F97_F80A519316B5_var*
//#UC END# *FEEF38963F97_F80A519316B5_var*
begin
//#UC START# *FEEF38963F97_F80A519316B5_impl*
 Result := aVisualObject.Name
//#UC END# *FEEF38963F97_F80A519316B5_impl*
end;//TkwVgControlName.VgControlName

procedure TkwVgControlName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((VgControlName(aCtx, l_aVisualObject)));
end;//TkwVgControlName.DoDoIt

class function TkwVgControlName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Name';
end;//TkwVgControlName.GetWordNameForRegister

function TkwVgControlName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwVgControlName.GetResultTypeInfo

type
 TkwVgControlClick = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Click
*Пример:*
[code]
 aVisualObject vg:control:Click
[code]  }
 private
 // private methods
   procedure VgControlClick(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject);
     {* Реализация слова скрипта vg:control:Click }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlClick

// start class TkwVgControlClick

procedure TkwVgControlClick.VgControlClick(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject);
//#UC START# *FCBA5E83A1C1_E94B273F03D9_var*
//#UC END# *FCBA5E83A1C1_E94B273F03D9_var*
begin
//#UC START# *FCBA5E83A1C1_E94B273F03D9_impl*
 with TvgVisualObjectFriend(aVisualObject) do
 begin
  MouseDown(mbLeft, [], 0, 0);
  MouseUp(mbLeft, [], 0, 0);
 end;//with TvgVisualObjectFriend(aVisualObject)
//#UC END# *FCBA5E83A1C1_E94B273F03D9_impl*
end;//TkwVgControlClick.VgControlClick

procedure TkwVgControlClick.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 VgControlClick(aCtx, l_aVisualObject);
end;//TkwVgControlClick.DoDoIt

class function TkwVgControlClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Click';
end;//TkwVgControlClick.GetWordNameForRegister

function TkwVgControlClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwVgControlClick.GetResultTypeInfo

type
 TkwVgControlCountSiblingLikeMe = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:CountSiblingLikeMe
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:CountSiblingLikeMe
[code]  }
 private
 // private methods
   function VgControlCountSiblingLikeMe(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:CountSiblingLikeMe }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlCountSiblingLikeMe

// start class TkwVgControlCountSiblingLikeMe

function TkwVgControlCountSiblingLikeMe.VgControlCountSiblingLikeMe(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *4724A104EB0C_8969D4FAAB14_var*
var
 l_Count : Integer;
 l_Index : Integer;
 l_Ow    : TComponent;
 l_C     : TComponent;
//#UC END# *4724A104EB0C_8969D4FAAB14_var*
begin
//#UC START# *4724A104EB0C_8969D4FAAB14_impl*
 l_Count := 0;
 l_Ow := aVisualObject.Owner;
 for l_Index := 0 to Pred(l_Ow.ComponentCount) do
 begin
  l_C := l_Ow.Components[l_Index];
  if l_C.InheritsFrom(aVisualObject.ClassType) then
   Inc(l_Count);
 end;//for l_Index
 Result := l_Count;
//#UC END# *4724A104EB0C_8969D4FAAB14_impl*
end;//TkwVgControlCountSiblingLikeMe.VgControlCountSiblingLikeMe

procedure TkwVgControlCountSiblingLikeMe.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlCountSiblingLikeMe(aCtx, l_aVisualObject)));
end;//TkwVgControlCountSiblingLikeMe.DoDoIt

class function TkwVgControlCountSiblingLikeMe.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:CountSiblingLikeMe';
end;//TkwVgControlCountSiblingLikeMe.GetWordNameForRegister

function TkwVgControlCountSiblingLikeMe.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlCountSiblingLikeMe.GetResultTypeInfo

type
 TkwVgControlGetIsChecked = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:GetIsChecked
*Тип результата:* Boolean
*Пример:*
[code]
 aVisualObject vg:control:GetIsChecked
[code]  }
 private
 // private methods
   function VgControlGetIsChecked(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Boolean;
     {* Реализация слова скрипта vg:control:GetIsChecked }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlGetIsChecked

// start class TkwVgControlGetIsChecked

function TkwVgControlGetIsChecked.VgControlGetIsChecked(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Boolean;
//#UC START# *351A7FD6B4C4_D3F9471133D7_var*
//#UC END# *351A7FD6B4C4_D3F9471133D7_var*
begin
//#UC START# *351A7FD6B4C4_D3F9471133D7_impl*
 Result := (aVisualObject As TvgRadioButton).IsChecked;
//#UC END# *351A7FD6B4C4_D3F9471133D7_impl*
end;//TkwVgControlGetIsChecked.VgControlGetIsChecked

procedure TkwVgControlGetIsChecked.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((VgControlGetIsChecked(aCtx, l_aVisualObject)));
end;//TkwVgControlGetIsChecked.DoDoIt

class function TkwVgControlGetIsChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:GetIsChecked';
end;//TkwVgControlGetIsChecked.GetWordNameForRegister

function TkwVgControlGetIsChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwVgControlGetIsChecked.GetResultTypeInfo

type
 TkwVgControlSetIsChecked = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:SetIsChecked
*Пример:*
[code]
 aValue aVisualObject vg:control:SetIsChecked
[code]  }
 private
 // private methods
   procedure VgControlSetIsChecked(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject;
    aValue: Boolean);
     {* Реализация слова скрипта vg:control:SetIsChecked }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlSetIsChecked

// start class TkwVgControlSetIsChecked

procedure TkwVgControlSetIsChecked.VgControlSetIsChecked(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject;
  aValue: Boolean);
//#UC START# *E83EB4C5B17F_5389853B1E01_var*
//#UC END# *E83EB4C5B17F_5389853B1E01_var*
begin
//#UC START# *E83EB4C5B17F_5389853B1E01_impl*
 (aVisualObject As TvgRadioButton).IsChecked := aValue;
//#UC END# *E83EB4C5B17F_5389853B1E01_impl*
end;//TkwVgControlSetIsChecked.VgControlSetIsChecked

procedure TkwVgControlSetIsChecked.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
 l_aValue : Boolean;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopBool);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 VgControlSetIsChecked(aCtx, l_aVisualObject, l_aValue);
end;//TkwVgControlSetIsChecked.DoDoIt

class function TkwVgControlSetIsChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:SetIsChecked';
end;//TkwVgControlSetIsChecked.GetWordNameForRegister

function TkwVgControlSetIsChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwVgControlSetIsChecked.GetResultTypeInfo

type
 TkwVgControlLeftInScene = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:LeftInScene
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:LeftInScene
[code]  }
 private
 // private methods
   function VgControlLeftInScene(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:LeftInScene }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlLeftInScene

// start class TkwVgControlLeftInScene

function TkwVgControlLeftInScene.VgControlLeftInScene(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *74951CD8B8BB_0B0F33EAEBDF_var*
var
 l_Left: Single;
 l_Obj: TvgObject;
//#UC END# *74951CD8B8BB_0B0F33EAEBDF_var*
begin
//#UC START# *74951CD8B8BB_0B0F33EAEBDF_impl*
 l_Left := aVisualObject.Position.X;
 l_Obj := aVisualObject;
 while Assigned(l_Obj.Parent) {and (anObject.Parent <> anObject.Scene)} do
 begin
  l_Obj := l_Obj.Parent;
  if l_Obj is TvgVisualObject then
   l_Left := TvgVisualObject(l_Obj).Position.X + l_Left;
 end;
 Result := Round(l_Left);
//#UC END# *74951CD8B8BB_0B0F33EAEBDF_impl*
end;//TkwVgControlLeftInScene.VgControlLeftInScene

procedure TkwVgControlLeftInScene.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlLeftInScene(aCtx, l_aVisualObject)));
end;//TkwVgControlLeftInScene.DoDoIt

class function TkwVgControlLeftInScene.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:LeftInScene';
end;//TkwVgControlLeftInScene.GetWordNameForRegister

function TkwVgControlLeftInScene.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlLeftInScene.GetResultTypeInfo

type
 TkwVgControlTopInScene = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:TopInScene
*Тип результата:* Integer
*Пример:*
[code]
 aVisualObject vg:control:TopInScene
[code]  }
 private
 // private methods
   function VgControlTopInScene(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): Integer;
     {* Реализация слова скрипта vg:control:TopInScene }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlTopInScene

// start class TkwVgControlTopInScene

function TkwVgControlTopInScene.VgControlTopInScene(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): Integer;
//#UC START# *9772F92476AF_FFE6E88470A5_var*
var
 l_Top: Single;
 l_Obj: TvgObject;
//#UC END# *9772F92476AF_FFE6E88470A5_var*
begin
//#UC START# *9772F92476AF_FFE6E88470A5_impl*
 l_Top := aVisualObject.Position.Y;
 l_Obj := aVisualObject;
 while Assigned(l_Obj.Parent) {and (anObject.Parent <> anObject.Scene)} do
 begin
  l_Obj := l_Obj.Parent;
  if l_Obj is TvgVisualObject then
   l_Top := TvgVisualObject(l_Obj).Position.Y + l_Top;
 end;
 Result := Round(l_Top);
//#UC END# *9772F92476AF_FFE6E88470A5_impl*
end;//TkwVgControlTopInScene.VgControlTopInScene

procedure TkwVgControlTopInScene.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgControlTopInScene(aCtx, l_aVisualObject)));
end;//TkwVgControlTopInScene.DoDoIt

class function TkwVgControlTopInScene.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:TopInScene';
end;//TkwVgControlTopInScene.GetWordNameForRegister

function TkwVgControlTopInScene.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgControlTopInScene.GetResultTypeInfo

type
 TkwVgControlScene = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Scene
*Тип результата:* TControl
*Пример:*
[code]
 aVisualObject vg:control:Scene
[code]  }
 private
 // private methods
   function VgControlScene(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): TControl;
     {* Реализация слова скрипта vg:control:Scene }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlScene

// start class TkwVgControlScene

function TkwVgControlScene.VgControlScene(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): TControl;
//#UC START# *05812BD7CDDB_E3230FB2D73B_var*
//#UC END# *05812BD7CDDB_E3230FB2D73B_var*
begin
//#UC START# *05812BD7CDDB_E3230FB2D73B_impl*
 Result := aVisualObject.Scene.GetSceneControl;
//#UC END# *05812BD7CDDB_E3230FB2D73B_impl*
end;//TkwVgControlScene.VgControlScene

procedure TkwVgControlScene.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((VgControlScene(aCtx, l_aVisualObject)));
end;//TkwVgControlScene.DoDoIt

class function TkwVgControlScene.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Scene';
end;//TkwVgControlScene.GetWordNameForRegister

function TkwVgControlScene.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TControl);
end;//TkwVgControlScene.GetResultTypeInfo

type
 TkwVgControlText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:control:Text
*Тип результата:* String
*Пример:*
[code]
 aVisualObject vg:control:Text
[code]  }
 private
 // private methods
   function VgControlText(const aCtx: TtfwContext;
    aVisualObject: TvgVisualObject): AnsiString;
     {* Реализация слова скрипта vg:control:Text }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgControlText

// start class TkwVgControlText

function TkwVgControlText.VgControlText(const aCtx: TtfwContext;
  aVisualObject: TvgVisualObject): AnsiString;
//#UC START# *E164CC8FC765_BD648FBA9D21_var*
//#UC END# *E164CC8FC765_BD648FBA9D21_var*
begin
//#UC START# *E164CC8FC765_BD648FBA9D21_impl*
 if (aVisualObject is TvgTextControl) then
  Result := TvgTextControl(aVisualObject).Text
 else
 if (aVisualObject is TvgText) then
  Result := TvgText(aVisualObject).Text
 else
  Result := '';
//#UC END# *E164CC8FC765_BD648FBA9D21_impl*
end;//TkwVgControlText.VgControlText

procedure TkwVgControlText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aVisualObject : TvgVisualObject;
begin
 try
  l_aVisualObject := TvgVisualObject(aCtx.rEngine.PopObjAs(TvgVisualObject));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVisualObject: TvgVisualObject : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((VgControlText(aCtx, l_aVisualObject)));
end;//TkwVgControlText.DoDoIt

class function TkwVgControlText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Text';
end;//TkwVgControlText.GetWordNameForRegister

function TkwVgControlText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwVgControlText.GetResultTypeInfo
{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Visible
 TkwVgControlVisible.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Height
 TkwVgControlHeight.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Width
 TkwVgControlWidth.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Left
 TkwVgControlLeft.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Top
 TkwVgControlTop.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Enabled
 TkwVgControlEnabled.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Name
 TkwVgControlName.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Click
 TkwVgControlClick.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_CountSiblingLikeMe
 TkwVgControlCountSiblingLikeMe.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_GetIsChecked
 TkwVgControlGetIsChecked.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_SetIsChecked
 TkwVgControlSetIsChecked.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_LeftInScene
 TkwVgControlLeftInScene.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_TopInScene
 TkwVgControlTopInScene.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Scene
 TkwVgControlScene.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_control_Text
 TkwVgControlText.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа TvgVisualObject
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvgVisualObject));
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа TControl
 TtfwTypeRegistrator.RegisterType(TypeInfo(TControl));
{$IfEnd} //not NoScripts AND not NoVGScene

end.