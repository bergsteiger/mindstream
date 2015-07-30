unit kwStringVarRSplitTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringVarRSplitTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::String_VarRSplitTo
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
 TkwStringVarRSplitTo = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwStringVarRSplitTo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStringVarRSplitTo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringVarRSplitTo

class function TkwStringVarRSplitTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:RSplitTo!';
end;//TkwStringVarRSplitTo.GetWordNameForRegister

function TkwStringVarRSplitTo.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F62D72F036D_var*
//#UC END# *4DCC193801F1_4F62D72F036D_var*
begin
//#UC START# *4DCC193801F1_4F62D72F036D_impl*
 Result := TkwCompiledStringVarRSplitTo;
//#UC END# *4DCC193801F1_4F62D72F036D_impl*
end;//TkwStringVarRSplitTo.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация String_VarRSplitTo
 TkwStringVarRSplitTo.RegisterInEngine;
{$IfEnd} //not NoScripts

end.