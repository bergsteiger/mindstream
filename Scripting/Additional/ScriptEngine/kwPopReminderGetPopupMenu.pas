unit kwPopReminderGetPopupMenu;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopReminderGetPopupMenu.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_Reminder_GetPopupMenu
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  tfwScriptingInterfaces,
  vgRemindersLine,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}
type
 {$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}
 TkwPopReminderGetPopupMenu = {final} class(_kwReminderFromStackWord_)
 protected
 // realized methods
   procedure DoReminder(aReminder: TvgReminder;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopReminderGetPopupMenu
{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmBaseMenuManager
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmMenuManager
  {$IfEnd} //not NoVCM
  ,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}

type _Instance_R_ = TkwPopReminderGetPopupMenu;

{$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}

// start class TkwPopReminderGetPopupMenu

procedure TkwPopReminderGetPopupMenu.DoReminder(aReminder: TvgReminder;
  const aCtx: TtfwContext);
//#UC START# *534FACD0001A_536B9D110151_var*
var
 l_Pt: TPoint;
//#UC END# *534FACD0001A_536B9D110151_var*
begin
//#UC START# *534FACD0001A_536B9D110151_impl*
 l_Pt.X := 0;
 l_Pt.Y := 0;
 aCtx.rEngine.PushObj((g_MenuManager As TvcmCustomMenuManager).FillPopupMenu(l_Pt, aReminder).Items);
//#UC END# *534FACD0001A_536B9D110151_impl*
end;//TkwPopReminderGetPopupMenu.DoReminder

class function TkwPopReminderGetPopupMenu.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Reminder:GetPopupMenu';
end;//TkwPopReminderGetPopupMenu.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.