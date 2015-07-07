unit kwTreeSetSelected;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeSetSelected.pas"
// Начат: 29.04.2011 16:19
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::tree_SetSelected
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
 TkwTreeSetSelected = class(_kwTreeItemWord_)
 protected
 // realized methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeSetSelected
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

type _Instance_R_ = TkwTreeSetSelected;

{$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}

// start class TkwTreeSetSelected

procedure TkwTreeSetSelected.DoTreeItem(aTreeControl: TvtCustomOutliner;
  anItemIndex: Integer;
  const aCtx: TtfwContext);
//#UC START# *504DD08101F1_4DBAACA1006B_var*
//#UC END# *504DD08101F1_4DBAACA1006B_var*
begin
//#UC START# *504DD08101F1_4DBAACA1006B_impl*
 RunnerAssert(aCtx.rEngine.IsTopBool, 'Не указано новое состояние отмеченности элемента дерева', aCtx);
 aTreeControl.Selected[anItemIndex] := aCtx.rEngine.PopBool;
//#UC END# *504DD08101F1_4DBAACA1006B_impl*
end;//TkwTreeSetSelected.DoTreeItem

class function TkwTreeSetSelected.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:SetSelected';
end;//TkwTreeSetSelected.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
{$IfEnd} //not NoScripts

end.