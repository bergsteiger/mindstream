unit tfwTripleStrWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "tfwTripleStrWord.pas"
// Начат: 01.12.2011 18:57
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TtfwTripleStrWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwDualStrWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwTripleStrWord = {abstract} class(TtfwDualStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // protected methods
   procedure DoTriple(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString;
     const aStr3: Il3CString); virtual; abstract;
 end;//TtfwTripleStrWord
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

// start class TtfwTripleStrWord

procedure TtfwTripleStrWord.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4ED795C300AC_var*
//#UC END# *4DD0D021034C_4ED795C300AC_var*
begin
//#UC START# *4DD0D021034C_4ED795C300AC_impl*
 DoTriple(aCtx, aCtx.rEngine.PopString, aStr1, aStr2);
//#UC END# *4DD0D021034C_4ED795C300AC_impl*
end;//TtfwTripleStrWord.DoStrings

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwTripleStrWord
 TtfwTripleStrWord.RegisterClass;
{$IfEnd} //not NoScripts

end.