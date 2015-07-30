unit kwEtalonNeedsOSName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEtalonNeedsOSName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::EtalonNeedsOSName
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
 TkwEtalonNeedsOSName = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeedsOSName
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeedsOSName : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwEtalonNeedsOSName

procedure TkwEtalonNeedsOSName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AF4ADD0371_var*
//#UC END# *4DAEEDE10285_51AF4ADD0371_var*
begin
//#UC START# *4DAEEDE10285_51AF4ADD0371_impl*
 g_EtalonNeedsOSName := true;
//#UC END# *4DAEEDE10285_51AF4ADD0371_impl*
end;//TkwEtalonNeedsOSName.DoDoIt

class function TkwEtalonNeedsOSName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsOSName';
end;//TkwEtalonNeedsOSName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация EtalonNeedsOSName
 TkwEtalonNeedsOSName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.