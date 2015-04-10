unit kwPopComboBoxDropDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComboBoxDropDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_ComboBox_DropDown
//
// *Формат:*
// {code}
// aDown aControlObj pop:ComboBox:DropDown
// {code}
// *Описание:* Показывает/прячет выпадающий список у ComboBox'а в зависимости от значения параметра
// aDown.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  FakeBox,
  StdCtrls,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}
 TkwPopComboBoxDropDown = {final} class(_kwComboBoxFromStack_)
  {* *Формат:* 
[code]
aDown aControlObj pop:ComboBox:DropDown
[code] 
*Описание:* Показывает/прячет выпадающий список у ComboBox'а в зависимости от значения параметра aDown. }
 protected
 // realized methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); override;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboBoxDropDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopComboBoxDropDown;

{$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}

// start class TkwPopComboBoxDropDown

procedure TkwPopComboBoxDropDown.DoWithComboBox(aCombobox: TCustomCombo;
  const aCtx: TtfwContext);
//#UC START# *5049C8740203_504D87D30327_var*
//#UC END# *5049C8740203_504D87D30327_var*
begin
//#UC START# *5049C8740203_504D87D30327_impl*
 RunnerAssert(aCtx.rEngine.IsTopBool, 'Не задан флаг для выпадающего списка.', aCtx);
 aCombobox.DroppedDown := aCtx.rEngine.PopBool;
//#UC END# *5049C8740203_504D87D30327_impl*
end;//TkwPopComboBoxDropDown.DoWithComboBox

procedure TkwPopComboBoxDropDown.DoWithFakeBox(aFakeBox: TFakeBox;
  const aCtx: TtfwContext);
//#UC START# *52A046EA03E6_504D87D30327_var*
//#UC END# *52A046EA03E6_504D87D30327_var*
begin
//#UC START# *52A046EA03E6_504D87D30327_impl*
 RunnerAssert(aCtx.rEngine.IsTopBool, 'Не задан флаг для выпадающего списка.', aCtx);
 aFakeBox.Dropped := aCtx.rEngine.PopBool;
//#UC END# *52A046EA03E6_504D87D30327_impl*
end;//TkwPopComboBoxDropDown.DoWithFakeBox

class function TkwPopComboBoxDropDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:DropDown';
end;//TkwPopComboBoxDropDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.