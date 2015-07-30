unit kwStringChar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStringChar.pas"
// Начат: 01.12.2011 18:59
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::tfwStringWords::string_Char
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
 TkwStringChar = {scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringChar
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

// start class TkwStringChar

procedure TkwStringChar.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F4FDAC800FC_var*
//#UC END# *4DD0CF6F0197_4F4FDAC800FC_var*
begin
//#UC START# *4DD0CF6F0197_4F4FDAC800FC_impl*
 aCtx.rEngine.PushChar(aStr.AsWStr.S[aCtx.rEngine.PopInt]);
//#UC END# *4DD0CF6F0197_4F4FDAC800FC_impl*
end;//TkwStringChar.DoString

class function TkwStringChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:[i]';
end;//TkwStringChar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация string_Char
 TkwStringChar.RegisterInEngine;
{$IfEnd} //not NoScripts

end.