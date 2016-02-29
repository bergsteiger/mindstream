unit kwWStringVarInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringVarInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WStringVar_Inc
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
 TkwWStringVarInc = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwWStringVarInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWStringVarInc
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringVarInc

class function TkwWStringVarInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:++!';
end;//TkwWStringVarInc.GetWordNameForRegister

function TkwWStringVarInc.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F50988A015B_var*
//#UC END# *4DCC193801F1_4F50988A015B_var*
begin
//#UC START# *4DCC193801F1_4F50988A015B_impl*
 Result := TkwCompiledWStringVarInc;
//#UC END# *4DCC193801F1_4F50988A015B_impl*
end;//TkwWStringVarInc.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WStringVar_Inc
 TkwWStringVarInc.RegisterInEngine;
{$IfEnd} //not NoScripts

end.