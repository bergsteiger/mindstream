{$IfNDef kwReminderFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwReminderFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ReminderWords::kwReminderFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwReminderFromStackWord_imp}
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
 _kwReminderFromStackWord_ = {mixin} class(_kwObjectFromStackWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoReminder(aReminder: TvgReminder;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwReminderFromStackWord_
{$IfEnd} //not NoScripts AND not NoVGScene

{$Else kwReminderFromStackWord_imp}

{$IfNDef kwReminderFromStackWord_imp_impl}
{$Define kwReminderFromStackWord_imp_impl}

{$If not defined(NoScripts) AND not defined(NoVGScene)}


{$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}

// start class _kwReminderFromStackWord_

procedure _kwReminderFromStackWord_.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_534FACB30373_var*
//#UC END# *4F212BD5010E_534FACB30373_var*
begin
//#UC START# *4F212BD5010E_534FACB30373_impl*
 RunnerAssert(anObject is TvgReminder, 'Переданный объект - не медаль, а ' + anObject.ClassName, aCtx);
 DoReminder(anObject as TvgReminder, aCtx);
//#UC END# *4F212BD5010E_534FACB30373_impl*
end;//_kwReminderFromStackWord_.DoObject

{$IfEnd} //not NoScripts AND not NoVGScene

{$Else  kwReminderFromStackWord_imp_impl}
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

{$EndIf kwReminderFromStackWord_imp_impl}
{$EndIf kwReminderFromStackWord_imp}
