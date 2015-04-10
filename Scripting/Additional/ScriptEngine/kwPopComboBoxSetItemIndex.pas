unit kwPopComboBoxSetItemIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComboBoxSetItemIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_ComboBox_SetItemIndex
//
// *Формат:*
// {code}
// anItemIndex aControlObj pop:ComboBox:SetItemIndex
// {code}
// *Описание:* Устанавливает значение свойства ItemIndex у контрола TComboBox, заданное в параметре
// anItemIndex
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
  StdCtrls,
  FakeBox,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}
 TkwPopComboBoxSetItemIndex = {final} class(_kwComboBoxFromStack_)
  {* *Формат:* 
[code]
anItemIndex aControlObj pop:ComboBox:SetItemIndex
[code] 
*Описание:* Устанавливает значение свойства ItemIndex у контрола TComboBox, заданное в параметре anItemIndex }
 protected
 // realized methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); override;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboBoxSetItemIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3TreeInterfaces,
  vtComboBoxQS,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopComboBoxSetItemIndex;

{$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}

type
  THack4SelectCombo = class(TCustomComboBox)
  end;//THack4SelectCombo

// start class TkwPopComboBoxSetItemIndex

procedure TkwPopComboBoxSetItemIndex.DoWithComboBox(aCombobox: TCustomCombo;
  const aCtx: TtfwContext);
//#UC START# *5049C8740203_5049C71F002B_var*
//#UC END# *5049C8740203_5049C71F002B_var*
begin
//#UC START# *5049C8740203_5049C71F002B_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задано значение ItemIndex у ComboBox', aCtx);
 aCombobox.ItemIndex := aCtx.rEngine.PopInt;
 THack4SelectCombo(aCombobox).Select;
//#UC END# *5049C8740203_5049C71F002B_impl*
end;//TkwPopComboBoxSetItemIndex.DoWithComboBox

procedure TkwPopComboBoxSetItemIndex.DoWithFakeBox(aFakeBox: TFakeBox;
  const aCtx: TtfwContext);
//#UC START# *52A046EA03E6_5049C71F002B_var*
var
 l_Node: Il3SimpleNode;
//#UC END# *52A046EA03E6_5049C71F002B_var*
begin
//#UC START# *52A046EA03E6_5049C71F002B_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задано значение ItemIndex у ComboBox', aCtx);
 if aFakeBox is TvtComboBoxQS then //561950536
  aFakeBox.ItemIndex := aCtx.rEngine.PopInt
 else
 begin
  l_Node := aFakeBox.Tree.GetNode(aCtx.rEngine.PopInt);
  aFakeBox.Tree.GotoOnNode(l_Node);
  aFakeBox.ShowNode(l_Node, True);
 end;
//#UC END# *52A046EA03E6_5049C71F002B_impl*
end;//TkwPopComboBoxSetItemIndex.DoWithFakeBox

class function TkwPopComboBoxSetItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:SetItemIndex';
end;//TkwPopComboBoxSetItemIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComboBoxFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.