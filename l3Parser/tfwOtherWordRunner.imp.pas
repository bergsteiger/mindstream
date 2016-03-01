{$IfNDef tfwOtherWordRunner_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwOtherWordRunner.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::tfwOtherWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwOtherWordRunner_imp}
{$If not defined(NoScripts)}
 _tfwOtherWordRunner_ = {abstract mixin} class(_tfwOtherWordRunner_Parent_)
 protected
 // protected methods
   procedure RunOther(const aCtx: TtfwContext);
   function GetWordToRun: TtfwAnonimousWord; virtual; abstract;
 end;//_tfwOtherWordRunner_
{$Else}

 _tfwOtherWordRunner_ = _tfwOtherWordRunner_Parent_;

{$IfEnd} //not NoScripts

{$Else tfwOtherWordRunner_imp}

{$If not defined(NoScripts)}

// start class _tfwOtherWordRunner_

procedure _tfwOtherWordRunner_.RunOther(const aCtx: TtfwContext);
//#UC START# *5563064D0054_556305F800A9_var*
//#UC END# *5563064D0054_556305F800A9_var*
begin
//#UC START# *5563064D0054_556305F800A9_impl*
 GetWordToRun.DoRun(aCtx);
//#UC END# *5563064D0054_556305F800A9_impl*
end;//_tfwOtherWordRunner_.RunOther

{$IfEnd} //not NoScripts

{$EndIf tfwOtherWordRunner_imp}
