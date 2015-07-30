unit tfwStandardProcedure;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwStandardProcedure.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TtfwStandardProcedure
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwProcedure,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStandardProcedure = {abstract} class(TtfwProcedure)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 end;//TtfwStandardProcedure
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwStandardProcedureCloseBracket
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwStandardProcedure

function TtfwStandardProcedure.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F37B27502EE_var*
//#UC END# *4DB6C99F026E_4F37B27502EE_var*
begin
//#UC START# *4DB6C99F026E_4F37B27502EE_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F37B27502EE_impl*
end;//TtfwStandardProcedure.EndBracket

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwStandardProcedure
 TtfwStandardProcedure.RegisterClass;
{$IfEnd} //not NoScripts

end.