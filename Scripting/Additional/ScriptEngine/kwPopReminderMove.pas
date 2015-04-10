unit kwPopReminderMove;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopReminderMove.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::pop_Reminder_Move
//
// *Формат:*
// {code}
// aDeltaX aDeltaY aReminder pop:Reminder:Move
// {code}
// *Описание:* Перемещение линейки со значаками на aDetaX по горизонтали и на aDeltaY по вертикали
// относительно текущей позиции. *Внимание! aDeltaX и aDeltaY - смещения, а не координаты!*
// *Пример:*
// {code}
// CONST "Красная медаль с восклицательным знаком" 'OldBaseWarning'
// 
// 500 500 "Красная медаль с восклицательным знаком" byname:control:Push pop:Reminder:Move
// {code}
// Смещает медали на 500 пикселей по горизонтали и 500  пикселей по вертикали относительно текущего
// положения.
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
 TkwPopReminderMove = {final} class(_kwReminderFromStackWord_)
  {* *Формат:* 
[code]
aDeltaX aDeltaY aReminder pop:Reminder:Move
[code] 
*Описание:* Перемещение линейки со значаками на aDetaX по горизонтали и на aDeltaY по вертикали относительно текущей позиции. *Внимание! aDeltaX и aDeltaY - смещения, а не координаты!* 
*Пример:* 
[code]
CONST "Красная медаль с восклицательным знаком" 'OldBaseWarning'

500 500 "Красная медаль с восклицательным знаком" byname:control:Push pop:Reminder:Move
[code] 
Смещает медали на 500 пикселей по горизонтали и 500  пикселей по вертикали относительно текущего положения. }
 protected
 // realized methods
   procedure DoReminder(aReminder: TvgReminder;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopReminderMove
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

type _Instance_R_ = TkwPopReminderMove;

{$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}

// start class TkwPopReminderMove

procedure TkwPopReminderMove.DoReminder(aReminder: TvgReminder;
  const aCtx: TtfwContext);
//#UC START# *534FACD0001A_4FFD37650303_var*
var
 l_DeltaX: Integer;
 l_DeltaY: Integer;
//#UC END# *534FACD0001A_4FFD37650303_var*
begin
//#UC START# *534FACD0001A_4FFD37650303_impl*
 if aCtx.rEngine.IsTopBool then
  aCtx.rEngine.PopBool; // больше флаг не нужен

 if aCtx.rEngine.IsTopInt then
 begin
  l_DeltaY := aCtx.rEngine.PopInt;
  if aCtx.rEngine.IsTopInt then
   l_DeltaX := aCtx.rEngine.PopInt
  else
   RunnerAssert(False, 'Не задано смещение по оси X', aCtx);
  RunnerAssert(aReminder.Owner is TvgRemindersLine, 'Не найдена линия медали', aCtx);
  (aReminder.Owner as TvgRemindersLine).OffSetLine(l_DeltaX, l_DeltaY);
  //aReminder.MoveReminder(l_DeltaX, l_DeltaY, l_Remember);
 end // if aCtx.rEngine.IsTopInt then
 else
  RunnerAssert(False, 'Не задано смещение по оси Y', aCtx);
//#UC END# *534FACD0001A_4FFD37650303_impl*
end;//TkwPopReminderMove.DoReminder

class function TkwPopReminderMove.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Reminder:Move';
end;//TkwPopReminderMove.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwReminderFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.