unit kwCharToString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCharToString.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::char_ToString
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
 TkwCharToString = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCharToString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCharToString

procedure TkwCharToString.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FDDC2031D_var*
//#UC END# *4DAEEDE10285_4F4FDDC2031D_var*
begin
//#UC START# *4DAEEDE10285_4F4FDDC2031D_impl*
 aCtx.rEngine.PushString(TtfwCStringFactory.C(aCtx.rEngine.PopChar));
//#UC END# *4DAEEDE10285_4F4FDDC2031D_impl*
end;//TkwCharToString.DoDoIt

class function TkwCharToString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'char:ToString';
end;//TkwCharToString.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация char_ToString
 TkwCharToString.RegisterInEngine;
{$IfEnd} //not NoScripts

end.