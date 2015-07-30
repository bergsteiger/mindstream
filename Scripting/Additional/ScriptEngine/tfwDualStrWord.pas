unit tfwDualStrWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "tfwDualStrWord.pas"
// Начат: 16.05.2011 11:18
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TtfwDualStrWord
//
// Поддержка работы с парами строк.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwStrWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDualStrWord = {abstract} class(TtfwStrWord)
  {* Поддержка работы с парами строк. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // protected methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); virtual; abstract;
 end;//TtfwDualStrWord
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

// start class TtfwDualStrWord

procedure TtfwDualStrWord.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DD0CFBC012F_var*
//#UC END# *4DD0CF6F0197_4DD0CFBC012F_var*
begin
//#UC START# *4DD0CF6F0197_4DD0CFBC012F_impl*
 DoStrings(aCtx, aCtx.rEngine.PopString, aStr);
//#UC END# *4DD0CF6F0197_4DD0CFBC012F_impl*
end;//TtfwDualStrWord.DoString

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwDualStrWord
 TtfwDualStrWord.RegisterClass;
{$IfEnd} //not NoScripts

end.