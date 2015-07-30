unit kwCompiledFileReadLines;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledFileReadLines.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::TkwCompiledFileReadLines
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledFileReadLines = class(TkwCompiledWordWorker)
 private
 // private methods
   procedure DoReadLines(const aFile: ItfwFile;
     const aCtx: TtfwContext);
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledFileReadLines
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledFileReadLines

procedure TkwCompiledFileReadLines.DoReadLines(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F50888301F3_4F50881D0135_var*
//#UC END# *4F50888301F3_4F50881D0135_var*
begin
//#UC START# *4F50888301F3_4F50881D0135_impl*
 aFile.ForEach(f_Word, aCtx);
//#UC END# *4F50888301F3_4F50881D0135_impl*
end;//TkwCompiledFileReadLines.DoReadLines

procedure TkwCompiledFileReadLines.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F50881D0135_var*
//#UC END# *4DAEEDE10285_4F50881D0135_var*
begin
//#UC START# *4DAEEDE10285_4F50881D0135_impl*
 DoReadLines(aCtx.rEngine.PopFile, aCtx);
//#UC END# *4DAEEDE10285_4F50881D0135_impl*
end;//TkwCompiledFileReadLines.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledFileReadLines
 TkwCompiledFileReadLines.RegisterClass;
{$IfEnd} //not NoScripts

end.