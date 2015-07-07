unit kwMenuitemGetItem;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMenuitemGetItem.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MenuWords::menuitem_GetItem
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
  Menus,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
 TkwMenuitemGetItem = {final} class(_kwMenuItemFromStackWord_)
 protected
 // realized methods
   procedure DoMenuItem(anItem: TMenuItem;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMenuitemGetItem
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMenuitemGetItem;

{$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}

// start class TkwMenuitemGetItem

procedure TkwMenuitemGetItem.DoMenuItem(anItem: TMenuItem;
  const aCtx: TtfwContext);
//#UC START# *4FC7299801E5_4FC72A12013B_var*
var
 l_Index : Integer;
//#UC END# *4FC7299801E5_4FC72A12013B_var*
begin
//#UC START# *4FC7299801E5_4FC72A12013B_impl*
 l_Index := aCtx.rEngine.PopInt;
 anItem.Items[l_Index].InitiateAction;
 aCtx.rEngine.PushObj(anItem.Items[l_Index]);
//#UC END# *4FC7299801E5_4FC72A12013B_impl*
end;//TkwMenuitemGetItem.DoMenuItem

class function TkwMenuitemGetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'menuitem:GetItem';
end;//TkwMenuitemGetItem.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.