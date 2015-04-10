unit kwTreeGetSelected;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetSelected.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::tree_GetSelected
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
  vtOutliner,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
 TkwTreeGetSelected = {final} class(_kwTreeItemWord_)
 protected
 // realized methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetSelected
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

type _Instance_R_ = TkwTreeGetSelected;

{$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}

// start class TkwTreeGetSelected

procedure TkwTreeGetSelected.DoTreeItem(aTreeControl: TvtCustomOutliner;
  anItemIndex: Integer;
  const aCtx: TtfwContext);
//#UC START# *504DD08101F1_5093FC8202F4_var*
//#UC END# *504DD08101F1_5093FC8202F4_var*
begin
//#UC START# *504DD08101F1_5093FC8202F4_impl*
 aCtx.rEngine.PushBool(aTreeControl.Selected[anItemIndex]);
//#UC END# *504DD08101F1_5093FC8202F4_impl*
end;//TkwTreeGetSelected.DoTreeItem

class function TkwTreeGetSelected.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetSelected';
end;//TkwTreeGetSelected.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
{$IfEnd} //not NoScripts

end.