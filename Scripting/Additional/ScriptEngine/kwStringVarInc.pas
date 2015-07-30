unit kwStringVarInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringVarInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::StringVar_Inc
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwVarWorker,
  kwCompiledVarWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStringVarInc = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwStringVarInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStringVarInc
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringVarInc

class function TkwStringVarInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:++!';
end;//TkwStringVarInc.GetWordNameForRegister

function TkwStringVarInc.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5F008401A6_var*
//#UC END# *4DCC193801F1_4F5F008401A6_var*
begin
//#UC START# *4DCC193801F1_4F5F008401A6_impl*
 Result := TkwCompiledStringVarInc;
//#UC END# *4DCC193801F1_4F5F008401A6_impl*
end;//TkwStringVarInc.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StringVar_Inc
 TkwStringVarInc.RegisterInEngine;
{$IfEnd} //not NoScripts

end.