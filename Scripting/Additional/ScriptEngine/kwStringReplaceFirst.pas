unit kwStringReplaceFirst;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStringReplaceFirst.pas"
// Начат: 01.12.2011 19:18
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::string_ReplaceFirst
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwTripleStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStringReplaceFirst = {scriptword} class(TtfwTripleStrWord)
 protected
 // realized methods
   procedure DoTriple(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString;
     const aStr3: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringReplaceFirst
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

// start class TkwStringReplaceFirst

procedure TkwStringReplaceFirst.DoTriple(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString;
  const aStr3: Il3CString);
//#UC START# *4ED7970003A1_4ED79AA6007E_var*
//#UC END# *4ED7970003A1_4ED79AA6007E_var*
begin
//#UC START# *4ED7970003A1_4ED79AA6007E_impl*
 aCtx.rEngine.PushString(l3StringReplace(aStr1,
                                         l3PCharLen(aStr2),
                                         l3PCharLen(aStr3), [{rfReplaceAll}]));
//#UC END# *4ED7970003A1_4ED79AA6007E_impl*
end;//TkwStringReplaceFirst.DoTriple

class function TkwStringReplaceFirst.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:ReplaceFirst';
end;//TkwStringReplaceFirst.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация string_ReplaceFirst
 TkwStringReplaceFirst.RegisterInEngine;
{$IfEnd} //not NoScripts

end.