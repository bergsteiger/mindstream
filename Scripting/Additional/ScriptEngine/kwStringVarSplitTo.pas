unit kwStringVarSplitTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringVarSplitTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::StringVar_SplitTo
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
 TkwStringVarSplitTo = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwStringVarSplitTo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStringVarSplitTo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringVarSplitTo

class function TkwStringVarSplitTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:SplitTo!';
end;//TkwStringVarSplitTo.GetWordNameForRegister

function TkwStringVarSplitTo.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5F147301EF_var*
//#UC END# *4DCC193801F1_4F5F147301EF_var*
begin
//#UC START# *4DCC193801F1_4F5F147301EF_impl*
 Result := TkwCompiledStringVarSplitTo;
//#UC END# *4DCC193801F1_4F5F147301EF_impl*
end;//TkwStringVarSplitTo.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StringVar_SplitTo
 TkwStringVarSplitTo.RegisterInEngine;
{$IfEnd} //not NoScripts

end.