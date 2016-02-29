unit kwWStringVarShift;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringVarShift.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WStringVar_Shift
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
 TkwWStringVarShift = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwWStringVarShift
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWStringShift
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringVarShift

class function TkwWStringVarShift.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:+!';
end;//TkwWStringVarShift.GetWordNameForRegister

function TkwWStringVarShift.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5098E0034E_var*
//#UC END# *4DCC193801F1_4F5098E0034E_var*
begin
//#UC START# *4DCC193801F1_4F5098E0034E_impl*
 Result := TkwCompiledWStringShift;
//#UC END# *4DCC193801F1_4F5098E0034E_impl*
end;//TkwWStringVarShift.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WStringVar_Shift
 TkwWStringVarShift.RegisterInEngine;
{$IfEnd} //not NoScripts

end.