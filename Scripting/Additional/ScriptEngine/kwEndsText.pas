unit kwEndsText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEndsText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwEndsText
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
 TkwEndsText = class(TtfwDualStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEndsText
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

// start class TkwEndsText

procedure TkwEndsText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EB2AF7301CE_var*
//#UC END# *4DD0D021034C_4EB2AF7301CE_var*
begin
//#UC START# *4DD0D021034C_4EB2AF7301CE_impl*
 aCtx.rEngine.PushBool(l3Ends(aStr1, aStr2, true));
//#UC END# *4DD0D021034C_4EB2AF7301CE_impl*
end;//TkwEndsText.DoStrings

class function TkwEndsText.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2AF7301CE_var*
//#UC END# *4DB0614603C8_4EB2AF7301CE_var*
begin
//#UC START# *4DB0614603C8_4EB2AF7301CE_impl*
 Result := 'EndsText';
//#UC END# *4DB0614603C8_4EB2AF7301CE_impl*
end;//TkwEndsText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEndsText
 TkwEndsText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.