unit RadioButtonWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "RadioButtonWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtControlsFromStackWords::RadioButtonWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  StdCtrls,
  tfwScriptingInterfaces,
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
 TkwPopRadioButtonGetChecked = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:RadioButton:GetChecked
*Тип результата:* Boolean
*Пример:*
[code]
 aRadioButton pop:RadioButton:GetChecked
[code]  }
 private
 // private methods
   function GetChecked(const aCtx: TtfwContext;
    aRadioButton: TRadioButton): Boolean;
     {* Реализация слова скрипта pop:RadioButton:GetChecked }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopRadioButtonGetChecked

// start class TkwPopRadioButtonGetChecked

function TkwPopRadioButtonGetChecked.GetChecked(const aCtx: TtfwContext;
  aRadioButton: TRadioButton): Boolean;
 {-}
begin
 Result := aRadioButton.Checked;
end;//TkwPopRadioButtonGetChecked.GetChecked

procedure TkwPopRadioButtonGetChecked.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aRadioButton : TRadioButton;
begin
 try
  l_aRadioButton := TRadioButton(aCtx.rEngine.PopObjAs(TRadioButton));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aRadioButton: TRadioButton : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((GetChecked(aCtx, l_aRadioButton)));
end;//TkwPopRadioButtonGetChecked.DoDoIt

class function TkwPopRadioButtonGetChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RadioButton:GetChecked';
end;//TkwPopRadioButtonGetChecked.GetWordNameForRegister

function TkwPopRadioButtonGetChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopRadioButtonGetChecked.GetResultTypeInfo

type
 TkwPopRadioButtonSetChecked = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:RadioButton:SetChecked
*Пример:*
[code]
 aValue aRadioButton pop:RadioButton:SetChecked
[code]  }
 private
 // private methods
   procedure SetChecked(const aCtx: TtfwContext;
    aRadioButton: TRadioButton;
    aValue: Boolean);
     {* Реализация слова скрипта pop:RadioButton:SetChecked }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopRadioButtonSetChecked

// start class TkwPopRadioButtonSetChecked

procedure TkwPopRadioButtonSetChecked.SetChecked(const aCtx: TtfwContext;
  aRadioButton: TRadioButton;
  aValue: Boolean);
 {-}
begin
 aRadioButton.Checked := aValue;
end;//TkwPopRadioButtonSetChecked.SetChecked

procedure TkwPopRadioButtonSetChecked.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aRadioButton : TRadioButton;
 l_aValue : Boolean;
begin
 try
  l_aRadioButton := TRadioButton(aCtx.rEngine.PopObjAs(TRadioButton));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aRadioButton: TRadioButton : ' + E.Message, aCtx);
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
 SetChecked(aCtx, l_aRadioButton, l_aValue);
end;//TkwPopRadioButtonSetChecked.DoDoIt

class function TkwPopRadioButtonSetChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RadioButton:SetChecked';
end;//TkwPopRadioButtonSetChecked.GetWordNameForRegister

function TkwPopRadioButtonSetChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopRadioButtonSetChecked.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_RadioButton_GetChecked
 TkwPopRadioButtonGetChecked.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_RadioButton_SetChecked
 TkwPopRadioButtonSetChecked.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TRadioButton
 TtfwTypeRegistrator.RegisterType(TypeInfo(TRadioButton));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts

end.