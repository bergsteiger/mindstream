unit kwPopRemindersLineCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopRemindersLineCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_RemindersLine_Count
//
// Количество медалей в линии
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
 TkwPopRemindersLineCount = {final} class(_kwRemindersLineFromStackWord_)
  {* Количество медалей в линии }
 protected
 // realized methods
   procedure DoRemindersLine(aRemindersLine: TvgRemindersLine;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopRemindersLineCount
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

type _Instance_R_ = TkwPopRemindersLineCount;

{$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}

// start class TkwPopRemindersLineCount

procedure TkwPopRemindersLineCount.DoRemindersLine(aRemindersLine: TvgRemindersLine;
  const aCtx: TtfwContext);
//#UC START# *534FAAAE0355_534FAD200348_var*
//#UC END# *534FAAAE0355_534FAD200348_var*
begin
//#UC START# *534FAAAE0355_534FAD200348_impl*
 aCtx.rEngine.PushInt(aRemindersLine.Count);
//#UC END# *534FAAAE0355_534FAD200348_impl*
end;//TkwPopRemindersLineCount.DoRemindersLine

class function TkwPopRemindersLineCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RemindersLine:Count';
end;//TkwPopRemindersLineCount.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.