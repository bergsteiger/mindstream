unit kwFileReadLines;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileReadLines.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_ReadLines
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordWorker,
  tfwScriptingInterfaces,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwFileReadLines = {final scriptword} class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileReadLines
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledFileReadLines
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileReadLines

function TkwFileReadLines.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F5087FD03E5_var*
//#UC END# *4DCBD67C0362_4F5087FD03E5_var*
begin
//#UC START# *4DCBD67C0362_4F5087FD03E5_impl*
 Result := TkwCompiledFileReadLines;
//#UC END# *4DCBD67C0362_4F5087FD03E5_impl*
end;//TkwFileReadLines.CompiledWorkerClass

class function TkwFileReadLines.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:ReadLines';
end;//TkwFileReadLines.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_ReadLines
 TkwFileReadLines.RegisterInEngine;
{$IfEnd} //not NoScripts

end.