unit kwWStringVarRSplitTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringVarRSplitTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_VarRSplitTo
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
 TkwWStringVarRSplitTo = {final scriptword} class(TtfwVarWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 end;//TkwWStringVarRSplitTo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWStringVarRSplitTo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringVarRSplitTo

class function TkwWStringVarRSplitTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:RSplitTo!';
end;//TkwWStringVarRSplitTo.GetWordNameForRegister

function TkwWStringVarRSplitTo.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F62D6FF01BC_var*
//#UC END# *4DCC193801F1_4F62D6FF01BC_var*
begin
//#UC START# *4DCC193801F1_4F62D6FF01BC_impl*
 Result := TkwCompiledWStringVarRSplitTo;
//#UC END# *4DCC193801F1_4F62D6FF01BC_impl*
end;//TkwWStringVarRSplitTo.CompiledVarWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_VarRSplitTo
 TkwWStringVarRSplitTo.RegisterInEngine;
{$IfEnd} //not NoScripts

end.