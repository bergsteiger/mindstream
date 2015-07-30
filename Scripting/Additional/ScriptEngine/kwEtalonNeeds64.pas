unit kwEtalonNeeds64;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEtalonNeeds64.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::EtalonNeeds64
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
 TkwEtalonNeeds64 = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeeds64
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeeds64 : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwEtalonNeeds64

procedure TkwEtalonNeeds64.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51B0AFE902E6_var*
//#UC END# *4DAEEDE10285_51B0AFE902E6_var*
begin
//#UC START# *4DAEEDE10285_51B0AFE902E6_impl*
 g_EtalonNeeds64 := true;
//#UC END# *4DAEEDE10285_51B0AFE902E6_impl*
end;//TkwEtalonNeeds64.DoDoIt

class function TkwEtalonNeeds64.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeeds64';
end;//TkwEtalonNeeds64.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация EtalonNeeds64
 TkwEtalonNeeds64.RegisterInEngine;
{$IfEnd} //not NoScripts

end.