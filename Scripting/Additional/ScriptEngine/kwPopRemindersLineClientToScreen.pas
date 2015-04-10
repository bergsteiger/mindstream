unit kwPopRemindersLineClientToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopRemindersLineClientToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_RemindersLine_ClientToScreen
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
 TkwPopRemindersLineClientToScreen = {final} class(_kwRemindersLineFromStackWord_)
 protected
 // realized methods
   procedure DoRemindersLine(aRemindersLine: TvgRemindersLine;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopRemindersLineClientToScreen
{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}

type _Instance_R_ = TkwPopRemindersLineClientToScreen;

{$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}

// start class TkwPopRemindersLineClientToScreen

procedure TkwPopRemindersLineClientToScreen.DoRemindersLine(aRemindersLine: TvgRemindersLine;
  const aCtx: TtfwContext);
//#UC START# *534FAAAE0355_536FA4C701F8_var*
var
 l_X: Integer;
 l_Y: Integer;
 l_Point: TPoint;
//#UC END# *534FAAAE0355_536FA4C701F8_var*
begin
//#UC START# *534FAAAE0355_536FA4C701F8_impl*
 l_X := 0;
 l_Y := 0;
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задана Y-координата!', aCtx);
 l_Y := aCtx.rEngine.PopInt;
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задана X-координата!', aCtx);
 l_X := aCtx.rEngine.PopInt;

 l_Point := TvgRemindersLineHack(aRemindersLine).Form.ClientToScreen((Point(l_X, l_Y)));
 aCtx.rEngine.PushInt(l_Point.X);
 aCtx.rEngine.PushInt(l_Point.Y);
//#UC END# *534FAAAE0355_536FA4C701F8_impl*
end;//TkwPopRemindersLineClientToScreen.DoRemindersLine

class function TkwPopRemindersLineClientToScreen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:RemindersLine:ClientToScreen';
end;//TkwPopRemindersLineClientToScreen.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwRemindersLineFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.