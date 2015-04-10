{$IfNDef kwDivide_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDivide.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::kwDivide
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwDivide_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwDivide_ = {mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoDivide(const aCtx: TtfwContext);
 end;//_kwDivide_
{$IfEnd} //not NoScripts

{$Else kwDivide_imp}

{$IfNDef kwDivide_imp_impl}
{$Define kwDivide_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwDivide_

procedure _kwDivide_.DoDivide(const aCtx: TtfwContext);
//#UC START# *4F912C05016C_4F912BAB0034_var*
var
 l_Second: Integer;
//#UC END# *4F912C05016C_4F912BAB0034_var*
begin
//#UC START# *4F912C05016C_4F912BAB0034_impl*
 if aCtx.rEngine.IsTopInt then
  l_Second := aCtx.rEngine.PopInt
 else
  Assert(False, 'Деление возможно только с целочисленными аргументами!');
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushInt(aCtx.rEngine.PopInt div l_Second)
 else
  Assert(False, 'Деление возможно только с целочисленными аргументами!');
//#UC END# *4F912C05016C_4F912BAB0034_impl*
end;//_kwDivide_.DoDivide

procedure _kwDivide_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F912BAB0034_var*
//#UC END# *4DAEEDE10285_4F912BAB0034_var*
begin
//#UC START# *4DAEEDE10285_4F912BAB0034_impl*
 DoDivide(aCtx);
//#UC END# *4DAEEDE10285_4F912BAB0034_impl*
end;//_kwDivide_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwDivide_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwDivide_imp_impl}
{$EndIf kwDivide_imp}
