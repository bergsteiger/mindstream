unit kwApplicationExeName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwApplicationExeName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::application_ExeName
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
 TkwApplicationExeName = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwApplicationExeName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwApplicationExeName

procedure TkwApplicationExeName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53C51FD802CE_var*
//#UC END# *4DAEEDE10285_53C51FD802CE_var*
begin
//#UC START# *4DAEEDE10285_53C51FD802CE_impl*
 aCtx.rEngine.PushString(ParamStr(0));
//#UC END# *4DAEEDE10285_53C51FD802CE_impl*
end;//TkwApplicationExeName.DoDoIt

class function TkwApplicationExeName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:ExeName';
end;//TkwApplicationExeName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация application_ExeName
 TkwApplicationExeName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.