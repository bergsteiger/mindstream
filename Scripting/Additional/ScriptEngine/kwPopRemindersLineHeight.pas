unit kwPopRemindersLineHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopRemindersLineHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_RemindersLine_Height
//
// Высота
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
 TkwPopRemindersLineHeight = {final} class(_kwRemindersLineFromStackWord_)
  {* Высота }
 protected
 // realized methods
   procedure DoRemindersLine(aRemindersLine: TvgRemindersLine;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopRemindersLineHeight
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

type _Instance_R_ = TkwPopRemindersLineHeight;

{$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}

// start class TkwPopRemindersLineHeight

procedure TkwPopRemindersLineHeight.DoRemindersLine(aRemindersLine: TvgRemindersLine;
  const aCtx: TtfwContext);
//#UC START# *534FAAAE0355_534FAD80031E_var*
//#UC END# *534FAAAE0355_534FAD80031E_var*
begin
//#UC START# *534FAAAE0355_534FAD80031E_impl*
 aCtx.rEngine.PushInt(aRemindersLine.Height);
//#UC END# *534FAAAE0355_534FAD80031E_impl*
end;//TkwPopRemindersLineHeight.DoRemindersLine

class function TkwPopRemindersLineHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RemindersLine:Height';
end;//TkwPopRemindersLineHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.