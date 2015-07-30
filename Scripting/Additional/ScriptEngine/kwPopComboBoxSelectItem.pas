unit kwPopComboBoxSelectItem;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "kwPopComboBoxSelectItem.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$VT::vtComboBoxWords::pop_ComboBox_SelectItem
//
// *Формат:*
// {code}
// aStr aControlObj pop:ComboBox:SelectItem
// {code}
// *Описание:* Выбирает значение aStr в списке TComboBox, если такое присуствует. Аналогично работа
// пользователя (вызываются обработчики, связанные с изменением содержимого).
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  StdCtrls,
  kwComboBoxFromStack,
  tfwScriptingInterfaces,
  FakeBox
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopComboBoxSelectItem = {final scriptword} class(TkwComboBoxFromStack)
  {* *Формат:* 
[code]
aStr aControlObj pop:ComboBox:SelectItem
[code] 
*Описание:* Выбирает значение aStr в списке TComboBox, если такое присуствует. Аналогично работа пользователя (вызываются обработчики, связанные с изменением содержимого). }
 protected
 // realized methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); override;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboBoxSelectItem
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

type
  THackCustomComboBox = class(TCustomComboBox)
  end;//THackCustomComboBox

// start class TkwPopComboBoxSelectItem

procedure TkwPopComboBoxSelectItem.DoWithComboBox(aCombobox: TCustomCombo;
  const aCtx: TtfwContext);
//#UC START# *5049C8740203_504D9BE9028F_var*
var
 l_Item: AnsiString;
//#UC END# *5049C8740203_504D9BE9028F_var*
begin
//#UC START# *5049C8740203_504D9BE9028F_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задан пункт для выделения.', aCtx);
 l_Item := aCtx.rEngine.PopDelphiString;
 THackCustomComboBox(aCombobox).SelectItem(l_Item);
//#UC END# *5049C8740203_504D9BE9028F_impl*
end;//TkwPopComboBoxSelectItem.DoWithComboBox

procedure TkwPopComboBoxSelectItem.DoWithFakeBox(aFakeBox: TFakeBox;
  const aCtx: TtfwContext);
//#UC START# *52A046EA03E6_504D9BE9028F_var*
var
 l_Item: AnsiString;
//#UC END# *52A046EA03E6_504D9BE9028F_var*
begin
//#UC START# *52A046EA03E6_504D9BE9028F_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задан пункт для выделения.', aCtx);
 l_Item := aCtx.rEngine.PopDelphiString;
 aFakeBox.ItemIndex := aFakeBox.Items.IndexOf(l_Item);
//#UC END# *52A046EA03E6_504D9BE9028F_impl*
end;//TkwPopComboBoxSelectItem.DoWithFakeBox

class function TkwPopComboBoxSelectItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:SelectItem';
end;//TkwPopComboBoxSelectItem.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_SelectItem
 TkwPopComboBoxSelectItem.RegisterInEngine;
{$IfEnd} //not NoScripts

end.