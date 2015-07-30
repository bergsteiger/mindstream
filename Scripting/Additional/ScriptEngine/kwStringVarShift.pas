unit kwStringVarShift;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringVarShift.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::StringVar_Shift
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
 TkwStringVarShift = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwStringVarShift
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStringVarShift
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringVarShift

class function TkwStringVarShift.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:+!';
end;//TkwStringVarShift.GetWordNameForRegister

function TkwStringVarShift.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5F00CD02ED_var*
//#UC END# *4DCC193801F1_4F5F00CD02ED_var*
begin
//#UC START# *4DCC193801F1_4F5F00CD02ED_impl*
 Result := TkwCompiledStringVarShift;
//#UC END# *4DCC193801F1_4F5F00CD02ED_impl*
end;//TkwStringVarShift.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StringVar_Shift
 TkwStringVarShift.RegisterInEngine;
{$IfEnd} //not NoScripts

end.