unit kwPopCheckListBoxUncheckAll;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopCheckListBoxUncheckAll.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_CheckListBox_UncheckAll
//
// aCheckBoxList pop:CheckListBox:UncheckAll
// Сбрасыват пометки у всех пунктов контрола.
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
 TkwPopCheckListBoxUncheckAll = {final} class(_kwCheckListBox_)
  {* aCheckBoxList pop:CheckListBox:UncheckAll
Сбрасыват пометки у всех пунктов контрола. }
 protected
 // realized methods
   procedure DoWithCheckListBox(aControl: TCheckListBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopCheckListBoxUncheckAll
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

type _Instance_R_ = TkwPopCheckListBoxUncheckAll;

{$Include ..\ScriptEngine\kwCheckListBox.imp.pas}

// start class TkwPopCheckListBoxUncheckAll

procedure TkwPopCheckListBoxUncheckAll.DoWithCheckListBox(aControl: TCheckListBox;
  const aCtx: TtfwContext);
//#UC START# *51F24C220320_51F24D200015_var*
var
 i: Integer;
//#UC END# *51F24C220320_51F24D200015_var*
begin
//#UC START# *51F24C220320_51F24D200015_impl*
 for i := 0 to aControl.Count - 1 do
  aControl.Checked[i] := False;
//#UC END# *51F24C220320_51F24D200015_impl*
end;//TkwPopCheckListBoxUncheckAll.DoWithCheckListBox

class function TkwPopCheckListBoxUncheckAll.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:CheckListBox:UncheckAll';
end;//TkwPopCheckListBoxUncheckAll.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCheckListBox.imp.pas}
{$IfEnd} //not NoScripts

end.