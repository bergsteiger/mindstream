unit kwStringVarDecLen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringVarDecLen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::StringVar_DecLen
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
 TkwStringVarDecLen = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwStringVarDecLen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStringVarDecLen
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringVarDecLen

class function TkwStringVarDecLen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:--Len!';
end;//TkwStringVarDecLen.GetWordNameForRegister

function TkwStringVarDecLen.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5F01820031_var*
//#UC END# *4DCC193801F1_4F5F01820031_var*
begin
//#UC START# *4DCC193801F1_4F5F01820031_impl*
 Result := TkwCompiledStringVarDecLen;
//#UC END# *4DCC193801F1_4F5F01820031_impl*
end;//TkwStringVarDecLen.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StringVar_DecLen
 TkwStringVarDecLen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.