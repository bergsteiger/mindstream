unit kwPopReminderUserType;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopReminderUserType.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_Reminder_UserType
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
 TkwPopReminderUserType = {final} class(_kwReminderFromStackWord_)
 protected
 // realized methods
   procedure DoReminder(aReminder: TvgReminder;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopReminderUserType
{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}

type _Instance_R_ = TkwPopReminderUserType;

{$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}

// start class TkwPopReminderUserType

procedure TkwPopReminderUserType.DoReminder(aReminder: TvgReminder;
  const aCtx: TtfwContext);
//#UC START# *534FACD0001A_534FAE000008_var*
//#UC END# *534FACD0001A_534FAE000008_var*
begin
//#UC START# *534FACD0001A_534FAE000008_impl*
 aCtx.rEngine.PushInt(aReminder.UserType);
//#UC END# *534FACD0001A_534FAE000008_impl*
end;//TkwPopReminderUserType.DoReminder

class function TkwPopReminderUserType.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Reminder:UserType';
end;//TkwPopReminderUserType.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.