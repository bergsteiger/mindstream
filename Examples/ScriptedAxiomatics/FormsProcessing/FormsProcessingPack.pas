unit FormsProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "FormsProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::FormsProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Forms,
  ActnList,
  Menus,
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  tfwAxiomaticsResNameGetter
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3ObjectList,
  Classes,
  CustomFormProcessingPack,
  Controls,
  ActionListWordsPack,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
//#UC START# *38481B365F20ci*
//#UC END# *38481B365F20ci*
 TFormsProcessingPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *38481B365F20publ*
//#UC END# *38481B365F20publ*
 end;//TFormsProcessingPackResNameGetter

// start class TFormsProcessingPackResNameGetter

class function TFormsProcessingPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'FormsProcessingPack';
end;//TFormsProcessingPackResNameGetter.ResName

 {$R FormsProcessingPack.res FormsProcessingPack.rc}

type
 TkwPopFormActiveMDIChild = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:ActiveMDIChild
*Тип результата:* TForm
*Пример:*
[code]
OBJECT VAR l_TForm
 aForm pop:form:ActiveMDIChild &gt;&gt;&gt; l_TForm
[code]  }
 private
 // private methods
   function PopFormActiveMDIChild(const aCtx: TtfwContext;
    aForm: TForm): TForm;
     {* Реализация слова скрипта pop:form:ActiveMDIChild }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormActiveMDIChild

// start class TkwPopFormActiveMDIChild

function TkwPopFormActiveMDIChild.PopFormActiveMDIChild(const aCtx: TtfwContext;
  aForm: TForm): TForm;
//#UC START# *8AB0508CEF4C_90DD5B736D00_var*
//#UC END# *8AB0508CEF4C_90DD5B736D00_var*
begin
//#UC START# *8AB0508CEF4C_90DD5B736D00_impl*
 Result := aForm.ActiveMDIChild;
//#UC END# *8AB0508CEF4C_90DD5B736D00_impl*
end;//TkwPopFormActiveMDIChild.PopFormActiveMDIChild

procedure TkwPopFormActiveMDIChild.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((PopFormActiveMDIChild(aCtx, l_aForm)));
end;//TkwPopFormActiveMDIChild.DoDoIt

class function TkwPopFormActiveMDIChild.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:ActiveMDIChild';
end;//TkwPopFormActiveMDIChild.GetWordNameForRegister

function TkwPopFormActiveMDIChild.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TForm);
end;//TkwPopFormActiveMDIChild.GetResultTypeInfo

type
 TkwPopFormClose = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:Close
*Пример:*
[code]
 aForm pop:form:Close
[code]  }
 private
 // private methods
   procedure PopFormClose(const aCtx: TtfwContext;
    aForm: TForm);
     {* Реализация слова скрипта pop:form:Close }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormClose

// start class TkwPopFormClose

procedure TkwPopFormClose.PopFormClose(const aCtx: TtfwContext;
  aForm: TForm);
//#UC START# *2435574FF0DB_EF68563BBDE0_var*
//#UC END# *2435574FF0DB_EF68563BBDE0_var*
begin
//#UC START# *2435574FF0DB_EF68563BBDE0_impl*
 aForm.Close;
//#UC END# *2435574FF0DB_EF68563BBDE0_impl*
end;//TkwPopFormClose.PopFormClose

procedure TkwPopFormClose.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PopFormClose(aCtx, l_aForm);
end;//TkwPopFormClose.DoDoIt

class function TkwPopFormClose.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:Close';
end;//TkwPopFormClose.GetWordNameForRegister

function TkwPopFormClose.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopFormClose.GetResultTypeInfo

type
 TkwPopFormFindMenuItem = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:FindMenuItem
*Тип результата:* TMenuItem
*Пример:*
[code]
OBJECT VAR l_TMenuItem
 aName aForm pop:form:FindMenuItem &gt;&gt;&gt; l_TMenuItem
[code]  }
 private
 // private methods
   function PopFormFindMenuItem(const aCtx: TtfwContext;
    aForm: TForm;
    const aName: AnsiString): TMenuItem;
     {* Реализация слова скрипта pop:form:FindMenuItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormFindMenuItem

// start class TkwPopFormFindMenuItem

function TkwPopFormFindMenuItem.PopFormFindMenuItem(const aCtx: TtfwContext;
  aForm: TForm;
  const aName: AnsiString): TMenuItem;
//#UC START# *91740A9F6F65_CCC0609B3BF5_var*
const
 cDelimiter = '/';

 function FindMainMenu(aComponent: TComponent): TMainMenu;
 var
  I: Integer;
 begin
  Result := nil;
  for I := 0 to aComponent.ComponentCount - 1 do
   if aComponent.Components[I] is TMainMenu then
   begin
    Result := aComponent.Components[I] as TMainMenu;
    Exit;
   end;    
  for I := 0 to aComponent.ComponentCount - 1 do
  begin
   Result := FindMainMenu(aComponent.Components[I]);
   if Assigned(Result) then
    Exit;
  end;
 end;

 function GetNextItem(var anItem: TMenuItem; var aPath: AnsiString): Boolean;
 var
  I: Integer;
  l_DelimiterIndex: Integer;
  l_Name: AnsiString;
  l_FindItem: TMenuItem;
 begin
  l_DelimiterIndex := Pos(cDelimiter, aPath);
  if l_DelimiterIndex = 0 then
   l_Name := aPath
  else
  begin
   l_Name := Copy(aPath, 1, l_DelimiterIndex - 1);
   aPath := Copy(aPath, l_DelimiterIndex + 1, MaxInt);
  end;
  l_FindItem := anItem.Find(l_Name);
  Result := Assigned(l_FindItem);
  if Result then
   anItem := l_FindItem;
 end;
               
var
 l_Path: AnsiString;
 l_Menu: TMainMenu;
 l_Item: TMenuItem;
//#UC END# *91740A9F6F65_CCC0609B3BF5_var*
begin
//#UC START# *91740A9F6F65_CCC0609B3BF5_impl*
 l_Menu := FindMainMenu(aForm);
 RunnerAssert(Assigned(l_Menu), 'На форме нет меню', aCtx);
 {$IfDef l3HackedVCL}
 l_Menu.Items.CallInitiateActions;
 {$EndIf l3HackedVCL}
 l_Menu.Items.RethinkHotkeys;
 l_Menu.Items.RethinkLines;
 l_Path := aName;
 l_Item := l_Menu.Items;
 {$IfDef l3HackedVCL}
 while GetNextItem(l_Item, l_Path) do
  l_Item.CallInitiateActions;
 {$EndIf l3HackedVCL}
 l_Item.RethinkHotkeys;
 l_Item.RethinkLines;
 Result := l_Item;
//#UC END# *91740A9F6F65_CCC0609B3BF5_impl*
end;//TkwPopFormFindMenuItem.PopFormFindMenuItem

procedure TkwPopFormFindMenuItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
 l_aName : AnsiString;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushObj((PopFormFindMenuItem(aCtx, l_aForm, l_aName)));
end;//TkwPopFormFindMenuItem.DoDoIt

class function TkwPopFormFindMenuItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:FindMenuItem';
end;//TkwPopFormFindMenuItem.GetWordNameForRegister

function TkwPopFormFindMenuItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TMenuItem);
end;//TkwPopFormFindMenuItem.GetResultTypeInfo

type
 TkwPopFormGetWindowState = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:GetWindowState
*Тип результата:* TWindowState
*Пример:*
[code]
INTEGER VAR l_TWindowState
 aForm pop:form:GetWindowState &gt;&gt;&gt; l_TWindowState
[code]  }
 private
 // private methods
   function PopFormGetWindowState(const aCtx: TtfwContext;
    aForm: TForm): TWindowState;
     {* Реализация слова скрипта pop:form:GetWindowState }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormGetWindowState

// start class TkwPopFormGetWindowState

function TkwPopFormGetWindowState.PopFormGetWindowState(const aCtx: TtfwContext;
  aForm: TForm): TWindowState;
//#UC START# *1AF6E71E5FCF_DA5ACD40FDF6_var*
//#UC END# *1AF6E71E5FCF_DA5ACD40FDF6_var*
begin
//#UC START# *1AF6E71E5FCF_DA5ACD40FDF6_impl*
 Result := aForm.WindowState;
//#UC END# *1AF6E71E5FCF_DA5ACD40FDF6_impl*
end;//TkwPopFormGetWindowState.PopFormGetWindowState

procedure TkwPopFormGetWindowState.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Ord(PopFormGetWindowState(aCtx, l_aForm)));
end;//TkwPopFormGetWindowState.DoDoIt

class function TkwPopFormGetWindowState.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:GetWindowState';
end;//TkwPopFormGetWindowState.GetWordNameForRegister

function TkwPopFormGetWindowState.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TWindowState);
end;//TkwPopFormGetWindowState.GetResultTypeInfo

type
 TkwPopFormHasControl = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:HasControl
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aName aForm pop:form:HasControl &gt;&gt;&gt; l_Boolean
[code]  }
 private
 // private methods
   function PopFormHasControl(const aCtx: TtfwContext;
    aForm: TForm;
    const aName: AnsiString): Boolean;
     {* Реализация слова скрипта pop:form:HasControl }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormHasControl

// start class TkwPopFormHasControl

function TkwPopFormHasControl.PopFormHasControl(const aCtx: TtfwContext;
  aForm: TForm;
  const aName: AnsiString): Boolean;
//#UC START# *1040311EDE6F_AF277B657685_var*
//#UC END# *1040311EDE6F_AF277B657685_var*
begin
//#UC START# *1040311EDE6F_AF277B657685_impl*
 Result := (aForm.FindChildControl(aName) &lt;&gt; nil);
//#UC END# *1040311EDE6F_AF277B657685_impl*
end;//TkwPopFormHasControl.PopFormHasControl

procedure TkwPopFormHasControl.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
 l_aName : AnsiString;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushBool((PopFormHasControl(aCtx, l_aForm, l_aName)));
end;//TkwPopFormHasControl.DoDoIt

class function TkwPopFormHasControl.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:HasControl';
end;//TkwPopFormHasControl.GetWordNameForRegister

function TkwPopFormHasControl.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopFormHasControl.GetResultTypeInfo

type
 TkwPopFormMDIChildCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:MDIChildCount
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aForm pop:form:MDIChildCount &gt;&gt;&gt; l_Integer
[code]  }
 private
 // private methods
   function PopFormMDIChildCount(const aCtx: TtfwContext;
    aForm: TForm): Integer;
     {* Реализация слова скрипта pop:form:MDIChildCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormMDIChildCount

// start class TkwPopFormMDIChildCount

function TkwPopFormMDIChildCount.PopFormMDIChildCount(const aCtx: TtfwContext;
  aForm: TForm): Integer;
//#UC START# *12B749ECF277_2C52284D1B9B_var*
//#UC END# *12B749ECF277_2C52284D1B9B_var*
begin
//#UC START# *12B749ECF277_2C52284D1B9B_impl*
 Result := aForm.MDIChildCount;
//#UC END# *12B749ECF277_2C52284D1B9B_impl*
end;//TkwPopFormMDIChildCount.PopFormMDIChildCount

procedure TkwPopFormMDIChildCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((PopFormMDIChildCount(aCtx, l_aForm)));
end;//TkwPopFormMDIChildCount.DoDoIt

class function TkwPopFormMDIChildCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:MDIChildCount';
end;//TkwPopFormMDIChildCount.GetWordNameForRegister

function TkwPopFormMDIChildCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopFormMDIChildCount.GetResultTypeInfo

type
 TkwPopFormMDIChildren = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:MDIChildren
*Тип результата:* TForm
*Пример:*
[code]
OBJECT VAR l_TForm
 anIndex aForm pop:form:MDIChildren &gt;&gt;&gt; l_TForm
[code]  }
 private
 // private methods
   function PopFormMDIChildren(const aCtx: TtfwContext;
    aForm: TForm;
    anIndex: Integer): TForm;
     {* Реализация слова скрипта pop:form:MDIChildren }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormMDIChildren

// start class TkwPopFormMDIChildren

function TkwPopFormMDIChildren.PopFormMDIChildren(const aCtx: TtfwContext;
  aForm: TForm;
  anIndex: Integer): TForm;
//#UC START# *3639BFFF59A0_8D30B82D3D31_var*
//#UC END# *3639BFFF59A0_8D30B82D3D31_var*
begin
//#UC START# *3639BFFF59A0_8D30B82D3D31_impl*
 Result := aForm.MDIChildren[anIndex];
//#UC END# *3639BFFF59A0_8D30B82D3D31_impl*
end;//TkwPopFormMDIChildren.PopFormMDIChildren

procedure TkwPopFormMDIChildren.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
 l_anIndex : Integer;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushObj((PopFormMDIChildren(aCtx, l_aForm, l_anIndex)));
end;//TkwPopFormMDIChildren.DoDoIt

class function TkwPopFormMDIChildren.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:MDIChildren';
end;//TkwPopFormMDIChildren.GetWordNameForRegister

function TkwPopFormMDIChildren.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TForm);
end;//TkwPopFormMDIChildren.GetResultTypeInfo

type
 TkwPopFormModalResult = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:ModalResult
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aForm pop:form:ModalResult &gt;&gt;&gt; l_Integer
[code]  }
 private
 // private methods
   function PopFormModalResult(const aCtx: TtfwContext;
    aForm: TForm): Integer;
     {* Реализация слова скрипта pop:form:ModalResult }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormModalResult

// start class TkwPopFormModalResult

function TkwPopFormModalResult.PopFormModalResult(const aCtx: TtfwContext;
  aForm: TForm): Integer;
//#UC START# *258A2F5BBDB1_320C0D058217_var*
//#UC END# *258A2F5BBDB1_320C0D058217_var*
begin
//#UC START# *258A2F5BBDB1_320C0D058217_impl*
 RunnerAssert(fsModal in aForm.FormState, 'Это не модальная форма!', aCtx);
 Result := aForm.ModalResult;
//#UC END# *258A2F5BBDB1_320C0D058217_impl*
end;//TkwPopFormModalResult.PopFormModalResult

procedure TkwPopFormModalResult.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((PopFormModalResult(aCtx, l_aForm)));
end;//TkwPopFormModalResult.DoDoIt

class function TkwPopFormModalResult.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:ModalResult';
end;//TkwPopFormModalResult.GetWordNameForRegister

function TkwPopFormModalResult.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopFormModalResult.GetResultTypeInfo

type
 TkwPopFormNext = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:Next
*Пример:*
[code]
 aForm pop:form:Next
[code]  }
 private
 // private methods
   procedure PopFormNext(const aCtx: TtfwContext;
    aForm: TForm);
     {* Реализация слова скрипта pop:form:Next }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormNext

// start class TkwPopFormNext

procedure TkwPopFormNext.PopFormNext(const aCtx: TtfwContext;
  aForm: TForm);
//#UC START# *BE561C1EA571_12E2A5A1963A_var*
//#UC END# *BE561C1EA571_12E2A5A1963A_var*
begin
//#UC START# *BE561C1EA571_12E2A5A1963A_impl*
 aForm.Next;
//#UC END# *BE561C1EA571_12E2A5A1963A_impl*
end;//TkwPopFormNext.PopFormNext

procedure TkwPopFormNext.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PopFormNext(aCtx, l_aForm);
end;//TkwPopFormNext.DoDoIt

class function TkwPopFormNext.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:Next';
end;//TkwPopFormNext.GetWordNameForRegister

function TkwPopFormNext.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopFormNext.GetResultTypeInfo

type
 TkwPopFormSetWindowState = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:SetWindowState
*Пример:*
[code]
 aValue aForm pop:form:SetWindowState
[code]  }
 private
 // private methods
   procedure PopFormSetWindowState(const aCtx: TtfwContext;
    aForm: TForm;
    aValue: TWindowState);
     {* Реализация слова скрипта pop:form:SetWindowState }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormSetWindowState

// start class TkwPopFormSetWindowState

procedure TkwPopFormSetWindowState.PopFormSetWindowState(const aCtx: TtfwContext;
  aForm: TForm;
  aValue: TWindowState);
//#UC START# *84606C12BBFD_062C119864B2_var*
//#UC END# *84606C12BBFD_062C119864B2_var*
begin
//#UC START# *84606C12BBFD_062C119864B2_impl*
 aForm.WindowState := aValue;
//#UC END# *84606C12BBFD_062C119864B2_impl*
end;//TkwPopFormSetWindowState.PopFormSetWindowState

procedure TkwPopFormSetWindowState.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
 l_aValue : TWindowState;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := TWindowState(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TWindowState : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PopFormSetWindowState(aCtx, l_aForm, l_aValue);
end;//TkwPopFormSetWindowState.DoDoIt

class function TkwPopFormSetWindowState.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:SetWindowState';
end;//TkwPopFormSetWindowState.GetWordNameForRegister

function TkwPopFormSetWindowState.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopFormSetWindowState.GetResultTypeInfo

type
 TkwPopFormFindActionList = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:form:FindActionList
*Тип результата:* TActionList
*Пример:*
[code]
OBJECT VAR l_TActionList
 aListName aForm pop:form:FindActionList &gt;&gt;&gt; l_TActionList
[code]  }
 private
 // private methods
   function PopFormFindActionList(const aCtx: TtfwContext;
    aForm: TForm;
    const aListName: AnsiString): TActionList;
     {* Реализация слова скрипта pop:form:FindActionList }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopFormFindActionList

// start class TkwPopFormFindActionList

function TkwPopFormFindActionList.PopFormFindActionList(const aCtx: TtfwContext;
  aForm: TForm;
  const aListName: AnsiString): TActionList;
//#UC START# *2D6AE1A8E910_76B7945239DF_var*
var
 l_Component : TComponent;
 i : Integer;
 l_Control : TControl;
//#UC END# *2D6AE1A8E910_76B7945239DF_var*
begin
//#UC START# *2D6AE1A8E910_76B7945239DF_impl*
 Result := nil;
 l_Component := aForm.FindComponent(aListName);
 if (l_Component = nil) then
 // Попробуем спросить у дочерних фреймов...
 begin
  for i := 0 to aForm.ControlCount - 1 do
  begin
   l_Control := aForm.Controls[i];
   if (l_Control is TFrame) then
   begin
    l_Component := l_Control.FindComponent(aListName);
    if (l_Component &lt;&gt; nil) then
     Break;
   end // if l_Control is TFrame then
  end; // for i := 0 to aForm.ControlCount - 1 do
 end; // if l_Component = nil then
 Result := l_Component As TActionList;
//#UC END# *2D6AE1A8E910_76B7945239DF_impl*
end;//TkwPopFormFindActionList.PopFormFindActionList

procedure TkwPopFormFindActionList.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aForm : TForm;
 l_aListName : AnsiString;
begin
 try
  l_aForm := TForm(aCtx.rEngine.PopObjAs(TForm));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aForm: TForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aListName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aListName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((PopFormFindActionList(aCtx, l_aForm, l_aListName)));
end;//TkwPopFormFindActionList.DoDoIt

class function TkwPopFormFindActionList.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:FindActionList';
end;//TkwPopFormFindActionList.GetWordNameForRegister

function TkwPopFormFindActionList.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TActionList);
end;//TkwPopFormFindActionList.GetResultTypeInfo

type
 TkwIterateForms = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IterateForms
*Пример:*
[code]
 aLambda IterateForms
[code]  }
 private
 // private methods
   procedure IterateForms(const aCtx: TtfwContext;
    aLambda: TtfwWord);
     {* Реализация слова скрипта IterateForms }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIterateForms

// start class TkwIterateForms

procedure TkwIterateForms.IterateForms(const aCtx: TtfwContext;
  aLambda: TtfwWord);
//#UC START# *B1D8BF8B68F8_DBFEA799BB20_var*
var
 l_Obj: TObject;
 I: Integer;
 l_FormsList: Tl3ObjectList;
//#UC END# *B1D8BF8B68F8_DBFEA799BB20_var*
begin
//#UC START# *B1D8BF8B68F8_DBFEA799BB20_impl*
 l_FormsList := Tl3ObjectList.Create;
 try
  for I := 0 to Screen.CustomFormCount - 1 do
   l_FormsList.Add(Screen.CustomForms[I]);

  for I := 0 to l_FormsList.Count - 1 do
  try
   aCtx.rEngine.PushObj(l_FormsList[I]);
   aLambda.DoIt(aCtx);
  except
   on EtfwBreakIterator do
    Exit;
  end;//try..except
 finally
  l_FormsList.Free;
 end;
//#UC END# *B1D8BF8B68F8_DBFEA799BB20_impl*
end;//TkwIterateForms.IterateForms

procedure TkwIterateForms.DoDoIt(const aCtx: TtfwContext);
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
 IterateForms(aCtx, l_aLambda);
end;//TkwIterateForms.DoDoIt

class function TkwIterateForms.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateForms';
end;//TkwIterateForms.GetWordNameForRegister

function TkwIterateForms.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwIterateForms.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TFormsProcessingPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_ActiveMDIChild
 TkwPopFormActiveMDIChild.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_Close
 TkwPopFormClose.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_FindMenuItem
 TkwPopFormFindMenuItem.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_GetWindowState
 TkwPopFormGetWindowState.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_HasControl
 TkwPopFormHasControl.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_MDIChildCount
 TkwPopFormMDIChildCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_MDIChildren
 TkwPopFormMDIChildren.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_ModalResult
 TkwPopFormModalResult.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_Next
 TkwPopFormNext.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_SetWindowState
 TkwPopFormSetWindowState.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_form_FindActionList
 TkwPopFormFindActionList.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IterateForms
 TkwIterateForms.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TForm
 TtfwTypeRegistrator.RegisterType(TypeInfo(TForm));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TMenuItem
 TtfwTypeRegistrator.RegisterType(TypeInfo(TMenuItem));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TWindowState
 TtfwTypeRegistrator.RegisterType(TypeInfo(TWindowState));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TActionList
 TtfwTypeRegistrator.RegisterType(TypeInfo(TActionList));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts

end.