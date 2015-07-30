unit kwEtalonNeedsComputerName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEtalonNeedsComputerName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::EtalonNeedsComputerName
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwEtalonNeedsComputerName = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeedsComputerName
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeedsComputerName : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwEtalonNeedsComputerName

procedure TkwEtalonNeedsComputerName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_511522EF0076_var*
//#UC END# *4DAEEDE10285_511522EF0076_var*
begin
//#UC START# *4DAEEDE10285_511522EF0076_impl*
 g_EtalonNeedsComputerName := true;
//#UC END# *4DAEEDE10285_511522EF0076_impl*
end;//TkwEtalonNeedsComputerName.DoDoIt

class function TkwEtalonNeedsComputerName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsComputerName';
end;//TkwEtalonNeedsComputerName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация EtalonNeedsComputerName
 TkwEtalonNeedsComputerName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.