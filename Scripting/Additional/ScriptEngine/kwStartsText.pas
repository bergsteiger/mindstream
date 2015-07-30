unit kwStartsText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStartsText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwStartsText
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
 TkwStartsText = class(TtfwDualStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStartsText
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

// start class TkwStartsText

procedure TkwStartsText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EB2AF5F02ED_var*
//#UC END# *4DD0D021034C_4EB2AF5F02ED_var*
begin
//#UC START# *4DD0D021034C_4EB2AF5F02ED_impl*
 aCtx.rEngine.PushBool(l3Starts(aStr1, aStr2, true));
//#UC END# *4DD0D021034C_4EB2AF5F02ED_impl*
end;//TkwStartsText.DoStrings

class function TkwStartsText.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2AF5F02ED_var*
//#UC END# *4DB0614603C8_4EB2AF5F02ED_var*
begin
//#UC START# *4DB0614603C8_4EB2AF5F02ED_impl*
 Result := 'StartsText';
//#UC END# *4DB0614603C8_4EB2AF5F02ED_impl*
end;//TkwStartsText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwStartsText
 TkwStartsText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.