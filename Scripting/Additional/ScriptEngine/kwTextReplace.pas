unit kwTextReplace;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwTextReplace.pas"
// Начат: 01.12.2011 19:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::text_Replace
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
 TkwTextReplace = {scriptword} class(TtfwTripleStrWord)
 protected
 // realized methods
   procedure DoTriple(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString;
     const aStr3: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTextReplace
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

// start class TkwTextReplace

procedure TkwTextReplace.DoTriple(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString;
  const aStr3: Il3CString);
//#UC START# *4ED7970003A1_4ED79EE70301_var*
//#UC END# *4ED7970003A1_4ED79EE70301_var*
begin
//#UC START# *4ED7970003A1_4ED79EE70301_impl*
 aCtx.rEngine.PushString(l3StringReplace(aStr1,
                                         l3PCharLen(aStr2),
                                         l3PCharLen(aStr3), [rfReplaceAll, rfIgnoreCase]));
//#UC END# *4ED7970003A1_4ED79EE70301_impl*
end;//TkwTextReplace.DoTriple

class function TkwTextReplace.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'text:Replace';
end;//TkwTextReplace.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация text_Replace
 TkwTextReplace.RegisterInEngine;
{$IfEnd} //not NoScripts

end.