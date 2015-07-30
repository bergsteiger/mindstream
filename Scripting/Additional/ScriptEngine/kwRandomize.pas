unit kwRandomize;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwRandomize.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::Randomize
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
 TkwRandomize = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRandomize
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwRandomize

procedure TkwRandomize.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50599E4403E1_var*
//#UC END# *4DAEEDE10285_50599E4403E1_var*
begin
//#UC START# *4DAEEDE10285_50599E4403E1_impl*
 Randomize;
//#UC END# *4DAEEDE10285_50599E4403E1_impl*
end;//TkwRandomize.DoDoIt

class function TkwRandomize.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Randomize';
end;//TkwRandomize.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Randomize
 TkwRandomize.RegisterInEngine;
{$IfEnd} //not NoScripts

end.