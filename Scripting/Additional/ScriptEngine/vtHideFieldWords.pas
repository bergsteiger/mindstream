unit vtHideFieldWords;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "vtHideFieldWords.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtHideFieldWords::vtHideFieldWords
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  vtHideField,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopHideFieldIsExpanded = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:HideField:IsExpanded
*Тип результата:* Boolean
*Пример:*
[code]
 aHideField pop:HideField:IsExpanded
[code]  }
 private
 // private methods
   function IsExpanded(const aCtx: TtfwContext;
    aHideField: TvtCustomHideField): Boolean;
     {* Реализация слова скрипта pop:HideField:IsExpanded }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopHideFieldIsExpanded

// start class TkwPopHideFieldIsExpanded

function TkwPopHideFieldIsExpanded.IsExpanded(const aCtx: TtfwContext;
  aHideField: TvtCustomHideField): Boolean;
//#UC START# *4A3348F91BD7_A0AE99A180FB_var*
//#UC END# *4A3348F91BD7_A0AE99A180FB_var*
begin
//#UC START# *4A3348F91BD7_A0AE99A180FB_impl*
 Result := (aHideField.State = hfsShow);
//#UC END# *4A3348F91BD7_A0AE99A180FB_impl*
end;//TkwPopHideFieldIsExpanded.IsExpanded

procedure TkwPopHideFieldIsExpanded.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aHideField : TvtCustomHideField;
begin
 try
  l_aHideField := TvtCustomHideField(aCtx.rEngine.PopObjAs(TvtCustomHideField));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aHideField: TvtCustomHideField : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsExpanded(aCtx, l_aHideField)));
end;//TkwPopHideFieldIsExpanded.DoDoIt

class function TkwPopHideFieldIsExpanded.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:HideField:IsExpanded';
end;//TkwPopHideFieldIsExpanded.GetWordNameForRegister

function TkwPopHideFieldIsExpanded.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopHideFieldIsExpanded.GetResultTypeInfo

type
 TkwPopHideFieldSetExpanded = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:HideField:SetExpanded
*Пример:*
[code]
 aValue aHideField pop:HideField:SetExpanded
[code]  }
 private
 // private methods
   procedure SetExpanded(const aCtx: TtfwContext;
    aHideField: TvtCustomHideField;
    aValue: Boolean);
     {* Реализация слова скрипта pop:HideField:SetExpanded }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopHideFieldSetExpanded

// start class TkwPopHideFieldSetExpanded

procedure TkwPopHideFieldSetExpanded.SetExpanded(const aCtx: TtfwContext;
  aHideField: TvtCustomHideField;
  aValue: Boolean);
//#UC START# *438029106CF0_D92EF59DAD00_var*
//#UC END# *438029106CF0_D92EF59DAD00_var*
begin
//#UC START# *438029106CF0_D92EF59DAD00_impl*
 if aValue then
  aHideField.State := hfsShow
 else
  aHideField.State := hfsHide;
//#UC END# *438029106CF0_D92EF59DAD00_impl*
end;//TkwPopHideFieldSetExpanded.SetExpanded

procedure TkwPopHideFieldSetExpanded.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aHideField : TvtCustomHideField;
 l_aValue : Boolean;
begin
 try
  l_aHideField := TvtCustomHideField(aCtx.rEngine.PopObjAs(TvtCustomHideField));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aHideField: TvtCustomHideField : ' + E.Message, aCtx);
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
 SetExpanded(aCtx, l_aHideField, l_aValue);
end;//TkwPopHideFieldSetExpanded.DoDoIt

class function TkwPopHideFieldSetExpanded.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:HideField:SetExpanded';
end;//TkwPopHideFieldSetExpanded.GetWordNameForRegister

function TkwPopHideFieldSetExpanded.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopHideFieldSetExpanded.GetResultTypeInfo

type
 TkwPopHideFieldGetCaption = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:HideField:GetCaption
*Тип результата:* String
*Пример:*
[code]
 aHideField pop:HideField:GetCaption
[code]  }
 private
 // private methods
   function GetCaption(const aCtx: TtfwContext;
    aHideField: TvtCustomHideField): AnsiString;
     {* Реализация слова скрипта pop:HideField:GetCaption }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopHideFieldGetCaption

// start class TkwPopHideFieldGetCaption

function TkwPopHideFieldGetCaption.GetCaption(const aCtx: TtfwContext;
  aHideField: TvtCustomHideField): AnsiString;
//#UC START# *8FFF95B683E4_D34E3A240E95_var*
//#UC END# *8FFF95B683E4_D34E3A240E95_var*
begin
//#UC START# *8FFF95B683E4_D34E3A240E95_impl*
 Result := aHideField.Caption;
//#UC END# *8FFF95B683E4_D34E3A240E95_impl*
end;//TkwPopHideFieldGetCaption.GetCaption

procedure TkwPopHideFieldGetCaption.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aHideField : TvtCustomHideField;
begin
 try
  l_aHideField := TvtCustomHideField(aCtx.rEngine.PopObjAs(TvtCustomHideField));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aHideField: TvtCustomHideField : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((GetCaption(aCtx, l_aHideField)));
end;//TkwPopHideFieldGetCaption.DoDoIt

class function TkwPopHideFieldGetCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:HideField:GetCaption';
end;//TkwPopHideFieldGetCaption.GetWordNameForRegister

function TkwPopHideFieldGetCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopHideFieldGetCaption.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_HideField_IsExpanded
 TkwPopHideFieldIsExpanded.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_HideField_SetExpanded
 TkwPopHideFieldSetExpanded.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_HideField_GetCaption
 TkwPopHideFieldGetCaption.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TvtCustomHideField
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtCustomHideField));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts

end.