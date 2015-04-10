unit kwTreeGetItemHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetItemHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeGetItemHeight
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
 TkwTreeGetItemHeight = {final} class(_kwTreeItemWord_)
 protected
 // realized methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetItemHeight
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

type _Instance_R_ = TkwTreeGetItemHeight;

{$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}

// start class TkwTreeGetItemHeight

procedure TkwTreeGetItemHeight.DoTreeItem(aTreeControl: TvtCustomOutliner;
  anItemIndex: Integer;
  const aCtx: TtfwContext);
//#UC START# *504DD08101F1_504DD15D0168_var*
//#UC END# *504DD08101F1_504DD15D0168_var*
begin
//#UC START# *504DD08101F1_504DD15D0168_impl*
 with TvtCustomOutlinerHack(aTreeControl).GetDrawRect(anItemIndex) do
  aCtx.rEngine.PushInt(Bottom - Top);
//#UC END# *504DD08101F1_504DD15D0168_impl*
end;//TkwTreeGetItemHeight.DoTreeItem

class function TkwTreeGetItemHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem:Height';
end;//TkwTreeGetItemHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
{$IfEnd} //not NoScripts

end.