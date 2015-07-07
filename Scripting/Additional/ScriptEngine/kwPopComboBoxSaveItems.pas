unit kwPopComboBoxSaveItems;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComboBoxSaveItems.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_ComboBox_SaveItems
//
// *Формат:* имя_файла  контрол pop:ComboBox:SaveItems
// *Описание:* Сохраняет все пункты выпадающего списка (задается параметром контрол) в файл
// (задается параметром имя_файла)  и сравнивает с эталоном.
// *Пример:*
// {code}
// 'MyList.cmbx' 'StyleComboBox' byname:control:push pop:ComboBox:SaveItems
// {code}
// *Результат:* Сохраняет содержимое комбобокса 'StyleComboBox' в  файл  'MyList.cmbx' и сравнивает
// с эталоном.
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
  l3Filer,
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
 TkwPopComboBoxSaveItems = {final} class(_kwComboBoxFromStack_)
  {* *Формат:* имя_файла  контрол pop:ComboBox:SaveItems 
*Описание:* Сохраняет все пункты выпадающего списка (задается параметром контрол) в файл (задается параметром имя_файла)  и сравнивает с эталоном.
*Пример:*
[code]
'MyList.cmbx' 'StyleComboBox' byname:control:push pop:ComboBox:SaveItems
[code] 
*Результат:* Сохраняет содержимое комбобокса 'StyleComboBox' в  файл  'MyList.cmbx' и сравнивает с эталоном. }
 private
 // private fields
   f_Filer : Tl3CustomDosFiler;
 protected
 // realized methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); override;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboBoxSaveItems
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Types,
  l3Interfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopComboBoxSaveItems;

{$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}

// start class TkwPopComboBoxSaveItems

procedure TkwPopComboBoxSaveItems.DoWithComboBox(aCombobox: TCustomCombo;
  const aCtx: TtfwContext);
//#UC START# *5049C8740203_5135B94E0354_var*
var
 I: Integer;
 l_Count: Integer;
//#UC END# *5049C8740203_5135B94E0354_var*
begin
//#UC START# *5049C8740203_5135B94E0354_impl*
 l_Count := aCombobox.Items.Count;
 for I := 0 to l_Count - 1 do
  f_Filer.WriteLn(aCombobox.Items[I]);
//#UC END# *5049C8740203_5135B94E0354_impl*
end;//TkwPopComboBoxSaveItems.DoWithComboBox

procedure TkwPopComboBoxSaveItems.DoWithFakeBox(aFakeBox: TFakeBox;
  const aCtx: TtfwContext);
//#UC START# *52A046EA03E6_5135B94E0354_var*
//#UC END# *52A046EA03E6_5135B94E0354_var*
begin
//#UC START# *52A046EA03E6_5135B94E0354_impl*
 f_Filer.WriteLn((aFakeBox.Items as Il3Strings).Items.Text);
//#UC END# *52A046EA03E6_5135B94E0354_impl*
end;//TkwPopComboBoxSaveItems.DoWithFakeBox

class function TkwPopComboBoxSaveItems.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:SaveItems';
end;//TkwPopComboBoxSaveItems.GetWordNameForRegister

procedure TkwPopComboBoxSaveItems.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_5135B94E0354_var*
var
 l_S: AnsiString;
//#UC END# *4F212C3A015A_5135B94E0354_var*
begin
//#UC START# *4F212C3A015A_5135B94E0354_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString);
 l_S := ChangeFileExt(l_S, '.cmbx');
 f_Filer := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  f_Filer.Open;
  try
   inherited DoControl(aControl, aCtx);
  finally
   f_Filer.Close;
  end;
 finally
  FreeAndNil(f_Filer);
 end;//try..finally
//#UC END# *4F212C3A015A_5135B94E0354_impl*
end;//TkwPopComboBoxSaveItems.DoControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.