unit kwIsXE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwIsXE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::IsXE
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
 TkwIsXE = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsXE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwIsXE

procedure TkwIsXE.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AF577B036C_var*
//#UC END# *4DAEEDE10285_51AF577B036C_var*
begin
//#UC START# *4DAEEDE10285_51AF577B036C_impl*
 {$IfDef XE}
 aCtx.rEngine.PushBool(true);
 {$Else  XE}
 aCtx.rEngine.PushBool(false);
 {$EndIf XE}
//#UC END# *4DAEEDE10285_51AF577B036C_impl*
end;//TkwIsXE.DoDoIt

class function TkwIsXE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsXE';
end;//TkwIsXE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IsXE
 TkwIsXE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.