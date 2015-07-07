{$IfNDef tfwStandardProcedure_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwStandardProcedure.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwStandardProcedure
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwStandardProcedure_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwProcedure.imp.pas}
 _tfwStandardProcedure_ = {abstract mixin} class(_tfwProcedure_)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 end;//_tfwStandardProcedure_
{$IfEnd} //not NoScripts

{$Else tfwStandardProcedure_imp}

{$IfNDef tfwStandardProcedure_imp_impl}
{$Define tfwStandardProcedure_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwProcedure.imp.pas}

// start class _tfwStandardProcedure_

function _tfwStandardProcedure_.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F37B27502EE_var*
//#UC END# *4DB6C99F026E_4F37B27502EE_var*
begin
//#UC START# *4DB6C99F026E_4F37B27502EE_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F37B27502EE_impl*
end;//_tfwStandardProcedure_.EndBracket

{$IfEnd} //not NoScripts

{$Else  tfwStandardProcedure_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwProcedure.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwStandardProcedure_imp_impl}
{$EndIf tfwStandardProcedure_imp}
