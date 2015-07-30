unit kwIsUnder64;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwIsUnder64.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::IsUnder64
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
 TkwIsUnder64 = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsUnder64
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwIsUnder64

procedure TkwIsUnder64.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51A71C8702A5_var*
//#UC END# *4DAEEDE10285_51A71C8702A5_var*
begin
//#UC START# *4DAEEDE10285_51A71C8702A5_impl*
 aCtx.rEngine.PushBool(l3Is64System);
//#UC END# *4DAEEDE10285_51A71C8702A5_impl*
end;//TkwIsUnder64.DoDoIt

class function TkwIsUnder64.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsUnder64';
end;//TkwIsUnder64.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IsUnder64
 TkwIsUnder64.RegisterInEngine;
{$IfEnd} //not NoScripts

end.