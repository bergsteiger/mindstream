unit SpinEditWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "SpinEditWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtControlsFromStackWords::SpinEditWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  vtSpinEdit,
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
 TkwPopSpinEditGetValue = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:SpinEdit:GetValue
*Тип результата:* Integer
*Пример:*
[code]
 aSpinEdit pop:SpinEdit:GetValue
[code]  }
 private
 // private methods
   function GetValue(const aCtx: TtfwContext;
    aSpinEdit: TvtSpinEdit): Integer;
     {* Реализация слова скрипта pop:SpinEdit:GetValue }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopSpinEditGetValue

// start class TkwPopSpinEditGetValue

function TkwPopSpinEditGetValue.GetValue(const aCtx: TtfwContext;
  aSpinEdit: TvtSpinEdit): Integer;
//#UC START# *7366517D8188_0F40F0279E11_var*
//#UC END# *7366517D8188_0F40F0279E11_var*
begin
//#UC START# *7366517D8188_0F40F0279E11_impl*
 Result := aSpinEdit.AsInteger;
//#UC END# *7366517D8188_0F40F0279E11_impl*
end;//TkwPopSpinEditGetValue.GetValue

procedure TkwPopSpinEditGetValue.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSpinEdit : TvtSpinEdit;
begin
 try
  l_aSpinEdit := TvtSpinEdit(aCtx.rEngine.PopObjAs(TvtSpinEdit));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSpinEdit: TvtSpinEdit : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetValue(aCtx, l_aSpinEdit)));
end;//TkwPopSpinEditGetValue.DoDoIt

class function TkwPopSpinEditGetValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:SpinEdit:GetValue';
end;//TkwPopSpinEditGetValue.GetWordNameForRegister

function TkwPopSpinEditGetValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopSpinEditGetValue.GetResultTypeInfo

type
 TkwPopSpinEditSetValue = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:SpinEdit:SetValue
*Пример:*
[code]
 aValue aSpinEdit pop:SpinEdit:SetValue
[code]  }
 private
 // private methods
   procedure SetValue(const aCtx: TtfwContext;
    aSpinEdit: TvtSpinEdit;
    aValue: Integer);
     {* Реализация слова скрипта pop:SpinEdit:SetValue }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopSpinEditSetValue

// start class TkwPopSpinEditSetValue

procedure TkwPopSpinEditSetValue.SetValue(const aCtx: TtfwContext;
  aSpinEdit: TvtSpinEdit;
  aValue: Integer);
//#UC START# *B4BF5227484E_BAB10D2B92BD_var*
//#UC END# *B4BF5227484E_BAB10D2B92BD_var*
begin
//#UC START# *B4BF5227484E_BAB10D2B92BD_impl*
 aSpinEdit.AsInteger := aValue;
//#UC END# *B4BF5227484E_BAB10D2B92BD_impl*
end;//TkwPopSpinEditSetValue.SetValue

procedure TkwPopSpinEditSetValue.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSpinEdit : TvtSpinEdit;
 l_aValue : Integer;
begin
 try
  l_aSpinEdit := TvtSpinEdit(aCtx.rEngine.PopObjAs(TvtSpinEdit));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSpinEdit: TvtSpinEdit : ' + E.Message, aCtx);
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
 SetValue(aCtx, l_aSpinEdit, l_aValue);
end;//TkwPopSpinEditSetValue.DoDoIt

class function TkwPopSpinEditSetValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:SpinEdit:SetValue';
end;//TkwPopSpinEditSetValue.GetWordNameForRegister

function TkwPopSpinEditSetValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopSpinEditSetValue.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_SpinEdit_GetValue
 TkwPopSpinEditGetValue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_SpinEdit_SetValue
 TkwPopSpinEditSetValue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TvtSpinEdit
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtSpinEdit));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts

end.