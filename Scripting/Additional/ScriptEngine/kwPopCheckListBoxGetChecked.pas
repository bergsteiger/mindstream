unit kwPopCheckListBoxGetChecked;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopCheckListBoxGetChecked.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_CheckListBox_GetChecked
//
// anIndex aCheckBoxList pop:CheckListBox:GetChecked
// anIndex - индекс CheckBox'а
// aCheckBoxList  - контрол
// Возвращает True, если элемент помечен и False - если нет.
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
  tfwScriptingInterfaces,
  CheckLst,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwCheckListBox.imp.pas}
 TkwPopCheckListBoxGetChecked = {final} class(_kwCheckListBox_)
  {* anIndex aCheckBoxList pop:CheckListBox:GetChecked
anIndex - индекс CheckBox'а
aCheckBoxList  - контрол
Возвращает True, если элемент помечен и False - если нет. }
 protected
 // realized methods
   procedure DoWithCheckListBox(aControl: TCheckListBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopCheckListBoxGetChecked
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

type _Instance_R_ = TkwPopCheckListBoxGetChecked;

{$Include ..\ScriptEngine\kwCheckListBox.imp.pas}

// start class TkwPopCheckListBoxGetChecked

procedure TkwPopCheckListBoxGetChecked.DoWithCheckListBox(aControl: TCheckListBox;
  const aCtx: TtfwContext);
//#UC START# *51F24C220320_51F24C7802B5_var*
var
 l_Index: Integer;
//#UC END# *51F24C220320_51F24C7802B5_var*
begin
//#UC START# *51F24C220320_51F24C7802B5_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан индекс!', aCtx);
 l_Index := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushBool(aControl.Checked[l_Index]);
//#UC END# *51F24C220320_51F24C7802B5_impl*
end;//TkwPopCheckListBoxGetChecked.DoWithCheckListBox

class function TkwPopCheckListBoxGetChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:CheckListBox:GetChecked';
end;//TkwPopCheckListBoxGetChecked.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCheckListBox.imp.pas}
{$IfEnd} //not NoScripts

end.