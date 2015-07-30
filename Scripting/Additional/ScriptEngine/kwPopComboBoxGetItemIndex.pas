unit kwPopComboBoxGetItemIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "kwPopComboBoxGetItemIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$VT::vtComboBoxWords::pop_ComboBox_GetItemIndex
//
// *Формат:*
// {code}
// aControlObj pop:ComboBox:GetItemIdex
// {code}
// *Описание:* Возвращает текущее значение свойства ItemIndex у контрола TComboBox
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwComboBoxFromStack,
  StdCtrls,
  tfwScriptingInterfaces,
  FakeBox
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopComboBoxGetItemIndex = {final scriptword} class(TkwComboBoxFromStack)
  {* *Формат:* 
[code]
aControlObj pop:ComboBox:GetItemIdex
[code] 
*Описание:* Возвращает текущее значение свойства ItemIndex у контрола TComboBox }
 protected
 // realized methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); override;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboBoxGetItemIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopComboBoxGetItemIndex

procedure TkwPopComboBoxGetItemIndex.DoWithComboBox(aCombobox: TCustomCombo;
  const aCtx: TtfwContext);
//#UC START# *5049C8740203_5049C6F80317_var*
//#UC END# *5049C8740203_5049C6F80317_var*
begin
//#UC START# *5049C8740203_5049C6F80317_impl*
 aCtx.rEngine.PushInt(aCombobox.ItemIndex);
//#UC END# *5049C8740203_5049C6F80317_impl*
end;//TkwPopComboBoxGetItemIndex.DoWithComboBox

procedure TkwPopComboBoxGetItemIndex.DoWithFakeBox(aFakeBox: TFakeBox;
  const aCtx: TtfwContext);
//#UC START# *52A046EA03E6_5049C6F80317_var*
//#UC END# *52A046EA03E6_5049C6F80317_var*
begin
//#UC START# *52A046EA03E6_5049C6F80317_impl*
 if Assigned(aFakeBox.ChoosenValue)
  then aCtx.rEngine.PushInt(aFakeBox.FindIndexOf(aFakeBox.ChoosenValue))
  else aCtx.rEngine.PushInt(aFakeBox.ItemIndex);
//#UC END# *52A046EA03E6_5049C6F80317_impl*
end;//TkwPopComboBoxGetItemIndex.DoWithFakeBox

class function TkwPopComboBoxGetItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:GetItemIndex';
end;//TkwPopComboBoxGetItemIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_GetItemIndex
 TkwPopComboBoxGetItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts

end.