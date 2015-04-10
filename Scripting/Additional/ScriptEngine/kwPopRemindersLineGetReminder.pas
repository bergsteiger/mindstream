unit kwPopRemindersLineGetReminder;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopRemindersLineGetReminder.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_RemindersLine_GetReminder
//
// Медаль по индексу
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
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}
type
 {$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}
 TkwPopRemindersLineGetReminder = {final} class(_kwRemindersLineFromStackWord_)
  {* Медаль по индексу }
 protected
 // realized methods
   procedure DoRemindersLine(aRemindersLine: TvgRemindersLine;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopRemindersLineGetReminder
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

type _Instance_R_ = TkwPopRemindersLineGetReminder;

{$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}

// start class TkwPopRemindersLineGetReminder

procedure TkwPopRemindersLineGetReminder.DoRemindersLine(aRemindersLine: TvgRemindersLine;
  const aCtx: TtfwContext);
//#UC START# *534FAAAE0355_534FAD3B02D8_var*
var
 I: Integer;
//#UC END# *534FAAAE0355_534FAD3B02D8_var*
begin
//#UC START# *534FAAAE0355_534FAD3B02D8_impl*
 I := aCtx.rEngine.PopInt;
 RunnerAssert(I >= 0, 'Индекс не может быть отрицательным', aCtx);
 RunnerAssert(I < aRemindersLine.Count, 'Индекс не может быть больше количества медалей', aCtx);
 aCtx.rEngine.PushObj(aRemindersLine.Reminder[I]);
//#UC END# *534FAAAE0355_534FAD3B02D8_impl*
end;//TkwPopRemindersLineGetReminder.DoRemindersLine

class function TkwPopRemindersLineGetReminder.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RemindersLine:GetReminder';
end;//TkwPopRemindersLineGetReminder.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.