unit kwMenuitemClick;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMenuitemClick.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MenuWords::menuitem_Click
//
// Вызывает действие связанное с пунктом меню
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
 TkwMenuitemClick = {final} class(_kwMenuItemFromStackWord_)
  {* Вызывает действие связанное с пунктом меню }
 protected
 // realized methods
   procedure DoMenuItem(anItem: TMenuItem;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMenuitemClick
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

type _Instance_R_ = TkwMenuitemClick;

{$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}

// start class TkwMenuitemClick

procedure TkwMenuitemClick.DoMenuItem(anItem: TMenuItem;
  const aCtx: TtfwContext);
//#UC START# *4FC7299801E5_5025035E0318_var*
//#UC END# *4FC7299801E5_5025035E0318_var*
begin
//#UC START# *4FC7299801E5_5025035E0318_impl*
 anItem.Click;
//#UC END# *4FC7299801E5_5025035E0318_impl*
end;//TkwMenuitemClick.DoMenuItem

class function TkwMenuitemClick.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'menuitem:Click';
end;//TkwMenuitemClick.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.