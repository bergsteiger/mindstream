unit kwStringToChar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringToChar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::string_ToChar
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStringToChar = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringToChar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringToChar

procedure TkwStringToChar.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F4FDDA700C6_var*
//#UC END# *4DD0CF6F0197_4F4FDDA700C6_var*
begin
//#UC START# *4DD0CF6F0197_4F4FDDA700C6_impl*
 RunnerAssert(aStr.AsWStr.SLen = 0, 'Длина строки должна равняться 1', aCtx);
 aCtx.rEngine.PushChar(aStr.AsWStr.S[0]);
//#UC END# *4DD0CF6F0197_4F4FDDA700C6_impl*
end;//TkwStringToChar.DoString

class function TkwStringToChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:ToChar';
end;//TkwStringToChar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация string_ToChar
 TkwStringToChar.RegisterInEngine;
{$IfEnd} //not NoScripts

end.