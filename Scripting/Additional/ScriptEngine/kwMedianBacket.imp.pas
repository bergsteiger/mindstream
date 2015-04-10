{$IfNDef kwMedianBacket_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMedianBacket.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::MedianBacket
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwMedianBacket_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwMedianBacket_ = {abstract} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//_kwMedianBacket_
{$IfEnd} //not NoScripts

{$Else kwMedianBacket_imp}

{$IfNDef kwMedianBacket_imp_impl}
{$Define kwMedianBacket_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwMedianBacket_

procedure _kwMedianBacket_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52D7DD7A0120_var*
//#UC END# *4DAEEDE10285_52D7DD7A0120_var*
begin
//#UC START# *4DAEEDE10285_52D7DD7A0120_impl*
 if not aCtx.rWordCompilingNow.AcceptMedianBracket(Self, PtfwContext(@aCtx)^) then
  CompilerAssert(false, 'Непарная средняя скобка', aCtx);
//#UC END# *4DAEEDE10285_52D7DD7A0120_impl*
end;//_kwMedianBacket_.DoDoIt

function _kwMedianBacket_.IsImmediate: Boolean;
 {-}
begin
 Result := true;
end;//_kwMedianBacket_.IsImmediate

{$IfEnd} //not NoScripts

{$Else  kwMedianBacket_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwMedianBacket_imp_impl}
{$EndIf kwMedianBacket_imp}
