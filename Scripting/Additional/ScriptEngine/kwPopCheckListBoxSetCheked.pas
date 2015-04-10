unit kwPopCheckListBoxSetCheked;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopCheckListBoxSetCheked.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_CheckListBox_SetCheked
//
// aValue anIndex aCheckBoxList pop:CheckListBox:SetChecked
// anIndex - индекс CheckBox'а
// aCheckBoxList  - контрол
// Помечает элемент, если aValue = True и сбрасывает пометку, если aValue = False
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
 TkwPopCheckListBoxSetCheked = {final} class(_kwCheckListBox_)
  {* aValue anIndex aCheckBoxList pop:CheckListBox:SetChecked
anIndex - индекс CheckBox'а
aCheckBoxList  - контрол
Помечает элемент, если aValue = True и сбрасывает пометку, если aValue = False }
 protected
 // realized methods
   procedure DoWithCheckListBox(aControl: TCheckListBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopCheckListBoxSetCheked
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

type _Instance_R_ = TkwPopCheckListBoxSetCheked;

{$Include ..\ScriptEngine\kwCheckListBox.imp.pas}

// start class TkwPopCheckListBoxSetCheked

procedure TkwPopCheckListBoxSetCheked.DoWithCheckListBox(aControl: TCheckListBox;
  const aCtx: TtfwContext);
//#UC START# *51F24C220320_51F24CA9007D_var*
var
 l_Index: Integer;
 l_Value: Boolean;
//#UC END# *51F24C220320_51F24CA9007D_var*
begin
//#UC START# *51F24C220320_51F24CA9007D_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан индекс!', aCtx);
 l_Index := aCtx.rEngine.PopInt;
 RunnerAssert(aCtx.rEngine.IsTopBool, 'Не задан флаг!', aCtx);
 l_Value := aCtx.rEngine.PopBool;
 aControl.Checked[l_Index] := l_Value;
//#UC END# *51F24C220320_51F24CA9007D_impl*
end;//TkwPopCheckListBoxSetCheked.DoWithCheckListBox

class function TkwPopCheckListBoxSetCheked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:CheckListBox:SetCheked';
end;//TkwPopCheckListBoxSetCheked.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCheckListBox.imp.pas}
{$IfEnd} //not NoScripts

end.