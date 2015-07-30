unit CheckListBoxWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "CheckListBoxWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtControlsFromStackWords::CheckListBoxWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  CheckLst,
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
 TkwPopCheckListBoxGetChecked = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:CheckListBox:GetChecked
[panel]anIndex aCheckBoxList pop:CheckListBox:GetChecked
anIndex - индекс CheckBox'а
aCheckBoxList  - контрол
Возвращает True, если элемент помечен и False - если нет.[panel]
*Тип результата:* Boolean
*Пример:*
[code]
 anIndex aCheckListBox pop:CheckListBox:GetChecked
[code]  }
 private
 // private methods
   function GetChecked(const aCtx: TtfwContext;
    aCheckListBox: TCheckListBox;
    anIndex: Integer): Boolean;
     {* Реализация слова скрипта pop:CheckListBox:GetChecked }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopCheckListBoxGetChecked

// start class TkwPopCheckListBoxGetChecked

function TkwPopCheckListBoxGetChecked.GetChecked(const aCtx: TtfwContext;
  aCheckListBox: TCheckListBox;
  anIndex: Integer): Boolean;
//#UC START# *5C7C4E6C6645_61EE94402745_var*
//#UC END# *5C7C4E6C6645_61EE94402745_var*
begin
//#UC START# *5C7C4E6C6645_61EE94402745_impl*
 Result := aCheckListBox.Checked[anIndex];
//#UC END# *5C7C4E6C6645_61EE94402745_impl*
end;//TkwPopCheckListBoxGetChecked.GetChecked

procedure TkwPopCheckListBoxGetChecked.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aCheckListBox : TCheckListBox;
 l_anIndex : Integer;
begin
 try
  l_aCheckListBox := TCheckListBox(aCtx.rEngine.PopObjAs(TCheckListBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCheckListBox: TCheckListBox : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushBool((GetChecked(aCtx, l_aCheckListBox, l_anIndex)));
end;//TkwPopCheckListBoxGetChecked.DoDoIt

class function TkwPopCheckListBoxGetChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:CheckListBox:GetChecked';
end;//TkwPopCheckListBoxGetChecked.GetWordNameForRegister

function TkwPopCheckListBoxGetChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopCheckListBoxGetChecked.GetResultTypeInfo

type
 TkwPopCheckListBoxSetChecked = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:CheckListBox:SetChecked
[panel]aValue anIndex aCheckBoxList pop:CheckListBox:SetChecked
anIndex - индекс CheckBox'а
aCheckBoxList  - контрол
Помечает элемент, если aValue = True и сбрасывает пометку, если aValue = False[panel]
*Пример:*
[code]
 aValue anIndex aCheckListBox pop:CheckListBox:SetChecked
[code]  }
 private
 // private methods
   procedure SetChecked(const aCtx: TtfwContext;
    aCheckListBox: TCheckListBox;
    anIndex: Integer;
    aValue: Boolean);
     {* Реализация слова скрипта pop:CheckListBox:SetChecked }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopCheckListBoxSetChecked

// start class TkwPopCheckListBoxSetChecked

procedure TkwPopCheckListBoxSetChecked.SetChecked(const aCtx: TtfwContext;
  aCheckListBox: TCheckListBox;
  anIndex: Integer;
  aValue: Boolean);
//#UC START# *AEDB5415872F_CA2863D28A34_var*
//#UC END# *AEDB5415872F_CA2863D28A34_var*
begin
//#UC START# *AEDB5415872F_CA2863D28A34_impl*
 aCheckListBox.Checked[anIndex] := aValue;
//#UC END# *AEDB5415872F_CA2863D28A34_impl*
end;//TkwPopCheckListBoxSetChecked.SetChecked

procedure TkwPopCheckListBoxSetChecked.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aCheckListBox : TCheckListBox;
 l_anIndex : Integer;
 l_aValue : Boolean;
begin
 try
  l_aCheckListBox := TCheckListBox(aCtx.rEngine.PopObjAs(TCheckListBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCheckListBox: TCheckListBox : ' + E.Message, aCtx);
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
 try
  l_aValue := (aCtx.rEngine.PopBool);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetChecked(aCtx, l_aCheckListBox, l_anIndex, l_aValue);
end;//TkwPopCheckListBoxSetChecked.DoDoIt

class function TkwPopCheckListBoxSetChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:CheckListBox:SetChecked';
end;//TkwPopCheckListBoxSetChecked.GetWordNameForRegister

function TkwPopCheckListBoxSetChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopCheckListBoxSetChecked.GetResultTypeInfo

type
 TkwPopCheckListBoxUncheckAll = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:CheckListBox:UncheckAll
[panel]aCheckBoxList pop:CheckListBox:UncheckAll
Сбрасыват пометки у всех пунктов контрола.[panel]
*Пример:*
[code]
 aCheckListBox pop:CheckListBox:UncheckAll
[code]  }
 private
 // private methods
   procedure UncheckAll(const aCtx: TtfwContext;
    aCheckListBox: TCheckListBox);
     {* Реализация слова скрипта pop:CheckListBox:UncheckAll }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopCheckListBoxUncheckAll

// start class TkwPopCheckListBoxUncheckAll

procedure TkwPopCheckListBoxUncheckAll.UncheckAll(const aCtx: TtfwContext;
  aCheckListBox: TCheckListBox);
//#UC START# *9D7C5A3CC63F_CC902BB857AE_var*
var
 i: Integer;
//#UC END# *9D7C5A3CC63F_CC902BB857AE_var*
begin
//#UC START# *9D7C5A3CC63F_CC902BB857AE_impl*
 for i := 0 to aCheckListBox.Count - 1 do
  aCheckListBox.Checked[i] := False;
//#UC END# *9D7C5A3CC63F_CC902BB857AE_impl*
end;//TkwPopCheckListBoxUncheckAll.UncheckAll

procedure TkwPopCheckListBoxUncheckAll.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aCheckListBox : TCheckListBox;
begin
 try
  l_aCheckListBox := TCheckListBox(aCtx.rEngine.PopObjAs(TCheckListBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCheckListBox: TCheckListBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 UncheckAll(aCtx, l_aCheckListBox);
end;//TkwPopCheckListBoxUncheckAll.DoDoIt

class function TkwPopCheckListBoxUncheckAll.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:CheckListBox:UncheckAll';
end;//TkwPopCheckListBoxUncheckAll.GetWordNameForRegister

function TkwPopCheckListBoxUncheckAll.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopCheckListBoxUncheckAll.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_CheckListBox_GetChecked
 TkwPopCheckListBoxGetChecked.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_CheckListBox_SetChecked
 TkwPopCheckListBoxSetChecked.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_CheckListBox_UncheckAll
 TkwPopCheckListBoxUncheckAll.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TCheckListBox
 TtfwTypeRegistrator.RegisterType(TypeInfo(TCheckListBox));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts

end.