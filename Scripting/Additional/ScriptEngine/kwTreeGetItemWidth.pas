unit kwTreeGetItemWidth;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetItemWidth.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeGetItemWidth
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
 TkwTreeGetItemWidth = {final} class(_kwTreeItemWord_)
 protected
 // realized methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetItemWidth
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

type _Instance_R_ = TkwTreeGetItemWidth;

{$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}

// start class TkwTreeGetItemWidth

procedure TkwTreeGetItemWidth.DoTreeItem(aTreeControl: TvtCustomOutliner;
  anItemIndex: Integer;
  const aCtx: TtfwContext);
//#UC START# *504DD08101F1_504DD16B01C0_var*
//#UC END# *504DD08101F1_504DD16B01C0_var*
begin
//#UC START# *504DD08101F1_504DD16B01C0_impl*
 with TvtCustomOutlinerHack(aTreeControl).GetDrawRect(anItemIndex) do
  aCtx.rEngine.PushInt(Right - Left);
//#UC END# *504DD08101F1_504DD16B01C0_impl*
end;//TkwTreeGetItemWidth.DoTreeItem

class function TkwTreeGetItemWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem:Width';
end;//TkwTreeGetItemWidth.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
{$IfEnd} //not NoScripts

end.