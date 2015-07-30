unit kwPopComboBoxIndexOf;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "kwPopComboBoxIndexOf.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$VT::vtComboBoxWords::pop_ComboBox_IndexOf
//
// *Формат:*
// {code}
// aStr aControlObj pop:ComboBox:IndexOf
// {code}
// *Описание:* Возвращает номер строки в выпадающем списке TComboBox. Если такой нет, то
// возвращается -1
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
 TkwPopComboBoxIndexOf = {final scriptword} class(TkwComboBoxFromStack)
  {* *Формат:* 
[code]
aStr aControlObj pop:ComboBox:IndexOf
[code] 
*Описание:* Возвращает номер строки в выпадающем списке TComboBox. Если такой нет, то возвращается -1 }
 protected
 // realized methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); override;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboBoxIndexOf
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopComboBoxIndexOf

procedure TkwPopComboBoxIndexOf.DoWithComboBox(aCombobox: TCustomCombo;
  const aCtx: TtfwContext);
//#UC START# *5049C8740203_5049D3E90186_var*
var
 l_String: AnsiString;
//#UC END# *5049C8740203_5049D3E90186_var*
begin
//#UC START# *5049C8740203_5049D3E90186_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задана строка для поиска в Combobox', aCtx);
 l_String := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushInt(aCombobox.Items.IndexOf(l_String))
//#UC END# *5049C8740203_5049D3E90186_impl*
end;//TkwPopComboBoxIndexOf.DoWithComboBox

procedure TkwPopComboBoxIndexOf.DoWithFakeBox(aFakeBox: TFakeBox;
  const aCtx: TtfwContext);
//#UC START# *52A046EA03E6_5049D3E90186_var*
var
 l_String: AnsiString;
//#UC END# *52A046EA03E6_5049D3E90186_var*
begin
//#UC START# *52A046EA03E6_5049D3E90186_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задана строка для поиска в Combobox', aCtx);
 l_String := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushInt(aFakeBox.Items.IndexOf(l_String))
//#UC END# *52A046EA03E6_5049D3E90186_impl*
end;//TkwPopComboBoxIndexOf.DoWithFakeBox

class function TkwPopComboBoxIndexOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:IndexOf';
end;//TkwPopComboBoxIndexOf.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_IndexOf
 TkwPopComboBoxIndexOf.RegisterInEngine;
{$IfEnd} //not NoScripts

end.