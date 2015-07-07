{$IfNDef kwCloseBracket_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCloseBracket.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::CloseBracket
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCloseBracket_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwCloseBracket_ = {abstract} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
   function IsCloseBracket: Boolean; override;
 end;//_kwCloseBracket_
{$IfEnd} //not NoScripts

{$Else kwCloseBracket_imp}

{$IfNDef kwCloseBracket_imp_impl}
{$Define kwCloseBracket_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwCloseBracket_

procedure _kwCloseBracket_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52D6AC0F0186_var*
//#UC END# *4DAEEDE10285_52D6AC0F0186_var*
begin
//#UC START# *4DAEEDE10285_52D6AC0F0186_impl*
 if (Self.ClassType = aCtx.rWordCompilingNow.GetEndBracket(aCtx, false)) then
  PtfwContext(@aCtx)^.rWasCloseBracket := true
 else
  CompilerAssert(false, 'Непарная закрывающаяся скобка', aCtx);
//#UC END# *4DAEEDE10285_52D6AC0F0186_impl*
end;//_kwCloseBracket_.DoDoIt

function _kwCloseBracket_.IsImmediate: Boolean;
 {-}
begin
 Result := true;
end;//_kwCloseBracket_.IsImmediate

function _kwCloseBracket_.IsCloseBracket: Boolean;
//#UC START# *52D6ABCB0026_52D6AC0F0186_var*
//#UC END# *52D6ABCB0026_52D6AC0F0186_var*
begin
//#UC START# *52D6ABCB0026_52D6AC0F0186_impl*
 Result := true;
//#UC END# *52D6ABCB0026_52D6AC0F0186_impl*
end;//_kwCloseBracket_.IsCloseBracket

{$IfEnd} //not NoScripts

{$Else  kwCloseBracket_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwCloseBracket_imp_impl}
{$EndIf kwCloseBracket_imp}
