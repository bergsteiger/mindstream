unit kwMenuitemGetCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMenuitemGetCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MenuWords::menuitem_GetCount
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
 TkwMenuitemGetCount = {final} class(_kwMenuItemFromStackWord_)
 protected
 // realized methods
   procedure DoMenuItem(anItem: TMenuItem;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMenuitemGetCount
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

type _Instance_R_ = TkwMenuitemGetCount;

{$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}

// start class TkwMenuitemGetCount

procedure TkwMenuitemGetCount.DoMenuItem(anItem: TMenuItem;
  const aCtx: TtfwContext);
//#UC START# *4FC7299801E5_4FC729DE0035_var*
//#UC END# *4FC7299801E5_4FC729DE0035_var*
begin
//#UC START# *4FC7299801E5_4FC729DE0035_impl*
 aCtx.rEngine.PushInt(anItem.Count);
//#UC END# *4FC7299801E5_4FC729DE0035_impl*
end;//TkwMenuitemGetCount.DoMenuItem

class function TkwMenuitemGetCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'menuitem:GetCount';
end;//TkwMenuitemGetCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.