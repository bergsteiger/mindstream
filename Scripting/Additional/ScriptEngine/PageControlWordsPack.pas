unit PageControlWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "PageControlWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtControlsFromStackWords::PageControlWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  ElPgCtl,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopPageControlFindPageByCaption = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:PageControl:FindPageByCaption
*Тип результата:* Integer
*Пример:*
[code]
 aCaption aPageControl pop:PageControl:FindPageByCaption
[code]  }
 private
 // private methods
   function FindPageByCaption(const aCtx: TtfwContext;
    aPageControl: TElCustomPageControl;
    const aCaption: Il3CString): Integer;
     {* Реализация слова скрипта pop:PageControl:FindPageByCaption }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopPageControlFindPageByCaption

// start class TkwPopPageControlFindPageByCaption

function TkwPopPageControlFindPageByCaption.FindPageByCaption(const aCtx: TtfwContext;
  aPageControl: TElCustomPageControl;
  const aCaption: Il3CString): Integer;
//#UC START# *FCC6A46AF340_39ABBBDC9493_var*
var
 I, l_PageNum: Integer;
//#UC END# *FCC6A46AF340_39ABBBDC9493_var*
begin
//#UC START# *FCC6A46AF340_39ABBBDC9493_impl*
 l_PageNum := 0;
 for I := 0 to aPageControl.PageCount - 1 do
  if aPageControl.Pages[I].TabVisible then
  begin
   if l3Same(aPageControl.Pages[I].Caption, aCaption) then
   begin
    Result := l_PageNum;
    Exit;
   end;
   Inc(l_PageNum);
  end;
 RunnerError('Вкладка не найдена!', aCtx);
 Result := -1;
//#UC END# *FCC6A46AF340_39ABBBDC9493_impl*
end;//TkwPopPageControlFindPageByCaption.FindPageByCaption

procedure TkwPopPageControlFindPageByCaption.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPageControl : TElCustomPageControl;
 l_aCaption : Il3CString;
begin
 try
  l_aPageControl := TElCustomPageControl(aCtx.rEngine.PopObjAs(TElCustomPageControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPageControl: TElCustomPageControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aCaption := (aCtx.rEngine.PopString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCaption: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((FindPageByCaption(aCtx, l_aPageControl, l_aCaption)));
end;//TkwPopPageControlFindPageByCaption.DoDoIt

class function TkwPopPageControlFindPageByCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:FindPageByCaption';
end;//TkwPopPageControlFindPageByCaption.GetWordNameForRegister

function TkwPopPageControlFindPageByCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopPageControlFindPageByCaption.GetResultTypeInfo

type
 TkwPopPageControlPageCaptionByIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:PageControl:PageCaptionByIndex
*Тип результата:* String
*Пример:*
[code]
 anIndex aPageControl pop:PageControl:PageCaptionByIndex
[code]  }
 private
 // private methods
   function PageCaptionByIndex(const aCtx: TtfwContext;
    aPageControl: TElCustomPageControl;
    anIndex: Integer): AnsiString;
     {* Реализация слова скрипта pop:PageControl:PageCaptionByIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopPageControlPageCaptionByIndex

// start class TkwPopPageControlPageCaptionByIndex

function TkwPopPageControlPageCaptionByIndex.PageCaptionByIndex(const aCtx: TtfwContext;
  aPageControl: TElCustomPageControl;
  anIndex: Integer): AnsiString;
//#UC START# *600644323CE8_1C7B18964322_var*
var
 I : Integer;
//#UC END# *600644323CE8_1C7B18964322_var*
begin
//#UC START# *600644323CE8_1C7B18964322_impl*
 RunnerAssert(anIndex >= 0, 'Давай положительное число!', aCtx);
 RunnerAssert(anIndex < aPageControl.PageCount, 'На PageControl меньше вкладок!', aCtx);
 for I := 0 to aPageControl.PageCount - 1 do
  if aPageControl.Pages[I].TabVisible then
  begin
   if anIndex = 0 then
   begin
    Result := aPageControl.Pages[I].Caption;
    Break;
   end;
   Dec(anIndex);
  end;
//#UC END# *600644323CE8_1C7B18964322_impl*
end;//TkwPopPageControlPageCaptionByIndex.PageCaptionByIndex

procedure TkwPopPageControlPageCaptionByIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPageControl : TElCustomPageControl;
 l_anIndex : Integer;
begin
 try
  l_aPageControl := TElCustomPageControl(aCtx.rEngine.PopObjAs(TElCustomPageControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPageControl: TElCustomPageControl : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushString((PageCaptionByIndex(aCtx, l_aPageControl, l_anIndex)));
end;//TkwPopPageControlPageCaptionByIndex.DoDoIt

class function TkwPopPageControlPageCaptionByIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:PageCaptionByIndex';
end;//TkwPopPageControlPageCaptionByIndex.GetWordNameForRegister

function TkwPopPageControlPageCaptionByIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopPageControlPageCaptionByIndex.GetResultTypeInfo

type
 TkwPopPageControlPageByIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:PageControl:PageByIndex
*Тип результата:* TElTabSheet
*Пример:*
[code]
 anIndex aPageControl pop:PageControl:PageByIndex
[code]  }
 private
 // private methods
   function PageByIndex(const aCtx: TtfwContext;
    aPageControl: TElCustomPageControl;
    anIndex: Integer): TElTabSheet;
     {* Реализация слова скрипта pop:PageControl:PageByIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopPageControlPageByIndex

// start class TkwPopPageControlPageByIndex

function TkwPopPageControlPageByIndex.PageByIndex(const aCtx: TtfwContext;
  aPageControl: TElCustomPageControl;
  anIndex: Integer): TElTabSheet;
//#UC START# *2BB966C33F13_CF3FBFFD21B3_var*
//#UC END# *2BB966C33F13_CF3FBFFD21B3_var*
begin
//#UC START# *2BB966C33F13_CF3FBFFD21B3_impl*
 RunnerAssert(anIndex >= 0, 'Давай положительное число!', aCtx);
 RunnerAssert(anIndex < aPageControl.PageCount, 'На PageControl меньше вкладок!', aCtx);
 Result := aPageControl.Pages[anIndex];
//#UC END# *2BB966C33F13_CF3FBFFD21B3_impl*
end;//TkwPopPageControlPageByIndex.PageByIndex

procedure TkwPopPageControlPageByIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPageControl : TElCustomPageControl;
 l_anIndex : Integer;
begin
 try
  l_aPageControl := TElCustomPageControl(aCtx.rEngine.PopObjAs(TElCustomPageControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPageControl: TElCustomPageControl : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushObj((PageByIndex(aCtx, l_aPageControl, l_anIndex)));
end;//TkwPopPageControlPageByIndex.DoDoIt

class function TkwPopPageControlPageByIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:PageByIndex';
end;//TkwPopPageControlPageByIndex.GetWordNameForRegister

function TkwPopPageControlPageByIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TElTabSheet);
end;//TkwPopPageControlPageByIndex.GetResultTypeInfo

type
 TkwPopPageControlGetAllPageCaptions = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:PageControl:GetAllPageCaptions
*Тип результата:* String
*Пример:*
[code]
 aPageControl pop:PageControl:GetAllPageCaptions
[code]  }
 private
 // private methods
   function GetAllPageCaptions(const aCtx: TtfwContext;
    aPageControl: TElCustomPageControl): AnsiString;
     {* Реализация слова скрипта pop:PageControl:GetAllPageCaptions }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopPageControlGetAllPageCaptions

// start class TkwPopPageControlGetAllPageCaptions

function TkwPopPageControlGetAllPageCaptions.GetAllPageCaptions(const aCtx: TtfwContext;
  aPageControl: TElCustomPageControl): AnsiString;
//#UC START# *29701A9D9F2B_2A5E921BA82F_var*
var
 l_Captions: AnsiString;
 I: Integer;
//#UC END# *29701A9D9F2B_2A5E921BA82F_var*
begin
//#UC START# *29701A9D9F2B_2A5E921BA82F_impl*
 l_Captions := '';
 for I := 0 to aPageControl.PageCount - 1 do
  if aPageControl.Pages[I].TabVisible then
   if (Length(l_Captions) > 0) then
    l_Captions := l_Captions + ' | ' + l3Str(aPageControl.Pages[I].Caption)
   else
    l_Captions := l3Str(aPageControl.Pages[I].Caption);

 Result := l_Captions;
//#UC END# *29701A9D9F2B_2A5E921BA82F_impl*
end;//TkwPopPageControlGetAllPageCaptions.GetAllPageCaptions

procedure TkwPopPageControlGetAllPageCaptions.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPageControl : TElCustomPageControl;
begin
 try
  l_aPageControl := TElCustomPageControl(aCtx.rEngine.PopObjAs(TElCustomPageControl));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPageControl: TElCustomPageControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((GetAllPageCaptions(aCtx, l_aPageControl)));
end;//TkwPopPageControlGetAllPageCaptions.DoDoIt

class function TkwPopPageControlGetAllPageCaptions.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:GetAllPageCaptions';
end;//TkwPopPageControlGetAllPageCaptions.GetWordNameForRegister

function TkwPopPageControlGetAllPageCaptions.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopPageControlGetAllPageCaptions.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_PageControl_FindPageByCaption
 TkwPopPageControlFindPageByCaption.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_PageControl_PageCaptionByIndex
 TkwPopPageControlPageCaptionByIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_PageControl_PageByIndex
 TkwPopPageControlPageByIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_PageControl_GetAllPageCaptions
 TkwPopPageControlGetAllPageCaptions.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TElCustomPageControl
 TtfwTypeRegistrator.RegisterType(TypeInfo(TElCustomPageControl));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TElTabSheet
 TtfwTypeRegistrator.RegisterType(TypeInfo(TElTabSheet));
{$IfEnd} //not NoScripts

end.