unit kwControlTreeChildrenCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwControlTreeChildrenCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::ControlTreeChildrenCount
//
// Возвращает число дочерних для узла по номеру.
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
 TkwControlTreeChildrenCount = class(_kwTreeItemWord_)
  {* Возвращает число дочерних для узла по номеру. }
 protected
 // realized methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwControlTreeChildrenCount
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

type _Instance_R_ = TkwControlTreeChildrenCount;

{$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}

// start class TkwControlTreeChildrenCount

procedure TkwControlTreeChildrenCount.DoTreeItem(aTreeControl: TvtCustomOutliner;
  anItemIndex: Integer;
  const aCtx: TtfwContext);
//#UC START# *504DD08101F1_4E01B7480206_var*
//#UC END# *504DD08101F1_4E01B7480206_var*
begin
//#UC START# *504DD08101F1_4E01B7480206_impl*
 aCtx.rEngine.PushInt(aTreeControl.GetNode(anItemIndex).ThisChildrenCount);
//#UC END# *504DD08101F1_4E01B7480206_impl*
end;//TkwControlTreeChildrenCount.DoTreeItem

class function TkwControlTreeChildrenCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:ChildrenCount';
end;//TkwControlTreeChildrenCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
{$IfEnd} //not NoScripts

end.