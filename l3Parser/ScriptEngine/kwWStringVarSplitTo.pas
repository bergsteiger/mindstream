unit kwWStringVarSplitTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringVarSplitTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WStringVar_SplitTo
//
// Разделяет строку по заданному разделителю на две. Одну кладёт на стек, другую в переменную
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
 TkwWStringVarSplitTo = {final scriptword} class(TtfwVarWorker)
  {* Разделяет строку по заданному разделителю на две. Одну кладёт на стек, другую в переменную }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwWStringVarSplitTo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWStringVarSplitTo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringVarSplitTo

class function TkwWStringVarSplitTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:SplitTo!';
end;//TkwWStringVarSplitTo.GetWordNameForRegister

function TkwWStringVarSplitTo.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5613530240_var*
//#UC END# *4DCC193801F1_4F5613530240_var*
begin
//#UC START# *4DCC193801F1_4F5613530240_impl*
 Result := TkwCompiledWStringVarSplitTo;
//#UC END# *4DCC193801F1_4F5613530240_impl*
end;//TkwWStringVarSplitTo.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WStringVar_SplitTo
 TkwWStringVarSplitTo.RegisterInEngine;
{$IfEnd} //not NoScripts

end.