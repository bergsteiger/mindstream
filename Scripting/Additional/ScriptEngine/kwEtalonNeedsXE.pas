unit kwEtalonNeedsXE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEtalonNeedsXE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::EtalonNeedsXE
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
 TkwEtalonNeedsXE = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeedsXE
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeedsXE : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwEtalonNeedsXE

procedure TkwEtalonNeedsXE.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AF4A900048_var*
//#UC END# *4DAEEDE10285_51AF4A900048_var*
begin
//#UC START# *4DAEEDE10285_51AF4A900048_impl*
 g_EtalonNeedsXE := true;
//#UC END# *4DAEEDE10285_51AF4A900048_impl*
end;//TkwEtalonNeedsXE.DoDoIt

class function TkwEtalonNeedsXE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsXE';
end;//TkwEtalonNeedsXE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация EtalonNeedsXE
 TkwEtalonNeedsXE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.