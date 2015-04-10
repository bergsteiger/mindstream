unit kwMenuitemIsVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMenuitemIsVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MenuWords::menuitem_IsVisible
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
 TkwMenuitemIsVisible = {final} class(_kwMenuItemFromStackWord_)
 protected
 // realized methods
   procedure DoMenuItem(anItem: TMenuItem;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMenuitemIsVisible
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

type _Instance_R_ = TkwMenuitemIsVisible;

{$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}

// start class TkwMenuitemIsVisible

procedure TkwMenuitemIsVisible.DoMenuItem(anItem: TMenuItem;
  const aCtx: TtfwContext);
//#UC START# *4FC7299801E5_4FC73652026C_var*
//#UC END# *4FC7299801E5_4FC73652026C_var*
begin
//#UC START# *4FC7299801E5_4FC73652026C_impl*
 aCtx.rEngine.PushBool(anItem.Visible);
//#UC END# *4FC7299801E5_4FC73652026C_impl*
end;//TkwMenuitemIsVisible.DoMenuItem

class function TkwMenuitemIsVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'menuitem:IsVisible';
end;//TkwMenuitemIsVisible.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.