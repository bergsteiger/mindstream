unit kwWStringVarPushCharAndInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringVarPushCharAndInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WStringVarPushCharAndInc
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
 TkwWStringVarPushCharAndInc = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwWStringVarPushCharAndInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWStringVarPushCharAndInc
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringVarPushCharAndInc

class function TkwWStringVarPushCharAndInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:[]++!';
end;//TkwWStringVarPushCharAndInc.GetWordNameForRegister

function TkwWStringVarPushCharAndInc.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F509C6901C6_var*
//#UC END# *4DCC193801F1_4F509C6901C6_var*
begin
//#UC START# *4DCC193801F1_4F509C6901C6_impl*
 Result := TkwCompiledWStringVarPushCharAndInc;
//#UC END# *4DCC193801F1_4F509C6901C6_impl*
end;//TkwWStringVarPushCharAndInc.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WStringVarPushCharAndInc
 TkwWStringVarPushCharAndInc.RegisterInEngine;
{$IfEnd} //not NoScripts

end.