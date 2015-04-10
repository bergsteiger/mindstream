unit kwMenuitemGetMenuHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMenuitemGetMenuHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MenuWords::menuitem_GetMenuHeight
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
 TMenuItemHack = class(TMenuItem)
 end;//TMenuItemHack

 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
 TkwMenuitemGetMenuHeight = {final} class(_kwMenuItemFromStackWord_)
 protected
 // realized methods
   procedure DoMenuItem(anItem: TMenuItem;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMenuitemGetMenuHeight
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3ScreenIC,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMenuitemGetMenuHeight;

{$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}

// start class TkwMenuitemGetMenuHeight

procedure TkwMenuitemGetMenuHeight.DoMenuItem(anItem: TMenuItem;
  const aCtx: TtfwContext);
//#UC START# *4FC7299801E5_517ABE700052_var*
var
 I: Integer;
 l_Width, l_Height, l_TotalHeight: Integer;
 l_Canvas: TControlCanvas;
//#UC END# *4FC7299801E5_517ABE700052_var*
begin
//#UC START# *4FC7299801E5_517ABE700052_impl*
 l_TotalHeight := 0;
 l_Canvas := TControlCanvas.Create;
 try
  l_Canvas.Handle := L3CrtIC.DC;
  l_Canvas.Font := Screen.MenuFont;
  for I := 0 to anItem.Count - 1 do
  begin
   l_Height := 0;
   TMenuItemHack(anItem.Items[I]).MeasureItem(l_Canvas, l_Width, l_Height);
   l_TotalHeight := l_TotalHeight + l_Height;
  end;
 finally
  l3Free(l_Canvas);
 end;
 aCtx.rEngine.PushInt(l_TotalHeight);
//#UC END# *4FC7299801E5_517ABE700052_impl*
end;//TkwMenuitemGetMenuHeight.DoMenuItem

class function TkwMenuitemGetMenuHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'menuitem:GetMenuHeight';
end;//TkwMenuitemGetMenuHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMenuItemFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.