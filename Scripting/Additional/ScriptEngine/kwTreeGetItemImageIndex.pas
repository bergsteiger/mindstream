unit kwTreeGetItemImageIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetItemImageIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeGetItemImageIndex
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
 TkwTreeGetItemImageIndex = {final} class(_kwTreeItemWord_)
 protected
 // realized methods
   procedure DoTreeItem(aTreeControl: TvtCustomOutliner;
     anItemIndex: Integer;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetItemImageIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  ImgList,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTreeGetItemImageIndex;

{$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}

// start class TkwTreeGetItemImageIndex

procedure TkwTreeGetItemImageIndex.DoTreeItem(aTreeControl: TvtCustomOutliner;
  anItemIndex: Integer;
  const aCtx: TtfwContext);
//#UC START# *504DD08101F1_503F92230358_var*
var
 l_IL: TCustomImageList;
 l_Index: Integer;
//#UC END# *504DD08101F1_503F92230358_var*
begin
//#UC START# *504DD08101F1_503F92230358_impl*
 if Assigned(aTreeControl.OnGetItemImage)
  then l_Index := aTreeControl.OnGetItemImage(aTreeControl, anItemIndex, l_IL)
  else l_Index := vtItemWithoutImage;
 aCtx.rEngine.PushInt(l_Index);
//#UC END# *504DD08101F1_503F92230358_impl*
end;//TkwTreeGetItemImageIndex.DoTreeItem

class function TkwTreeGetItemImageIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItemImageIndex';
end;//TkwTreeGetItemImageIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeItemWord.imp.pas}
{$IfEnd} //not NoScripts

end.