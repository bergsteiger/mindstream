unit tfwFileWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwFileWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::TtfwFileWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwFileWord = {abstract} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TtfwFileWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwFileWord

procedure TtfwFileWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F5084B60237_var*
//#UC END# *4DAEEDE10285_4F5084B60237_var*
begin
//#UC START# *4DAEEDE10285_4F5084B60237_impl*
 DoFile(aCtx.rEngine.PopFile, aCtx);
//#UC END# *4DAEEDE10285_4F5084B60237_impl*
end;//TtfwFileWord.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwFileWord
 TtfwFileWord.RegisterClass;
{$IfEnd} //not NoScripts

end.