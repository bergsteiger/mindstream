unit kwStartsStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStartsStr.pas"
// Начат: 03.11.2011 19:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwStartsStr
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDualStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStartsStr = class(TtfwDualStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStartsStr
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

// start class TkwStartsStr

procedure TkwStartsStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EB2AF0600C1_var*
//#UC END# *4DD0D021034C_4EB2AF0600C1_var*
begin
//#UC START# *4DD0D021034C_4EB2AF0600C1_impl*
 aCtx.rEngine.PushBool(l3Starts(aStr1, aStr2, false));
//#UC END# *4DD0D021034C_4EB2AF0600C1_impl*
end;//TkwStartsStr.DoStrings

class function TkwStartsStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2AF0600C1_var*
//#UC END# *4DB0614603C8_4EB2AF0600C1_var*
begin
//#UC START# *4DB0614603C8_4EB2AF0600C1_impl*
 Result := 'StartsStr';
//#UC END# *4DB0614603C8_4EB2AF0600C1_impl*
end;//TkwStartsStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwStartsStr
 TkwStartsStr.RegisterInEngine;
{$IfEnd} //not NoScripts

end.