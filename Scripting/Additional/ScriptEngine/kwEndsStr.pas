unit kwEndsStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEndsStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwEndsStr
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
 TkwEndsStr = class(TtfwDualStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEndsStr
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

// start class TkwEndsStr

procedure TkwEndsStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EB2AF3801E5_var*
//#UC END# *4DD0D021034C_4EB2AF3801E5_var*
begin
//#UC START# *4DD0D021034C_4EB2AF3801E5_impl*
 aCtx.rEngine.PushBool(l3Ends(aStr1, aStr2, false));
//#UC END# *4DD0D021034C_4EB2AF3801E5_impl*
end;//TkwEndsStr.DoStrings

class function TkwEndsStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2AF3801E5_var*
//#UC END# *4DB0614603C8_4EB2AF3801E5_var*
begin
//#UC START# *4DB0614603C8_4EB2AF3801E5_impl*
 Result := 'EndsStr';
//#UC END# *4DB0614603C8_4EB2AF3801E5_impl*
end;//TkwEndsStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEndsStr
 TkwEndsStr.RegisterInEngine;
{$IfEnd} //not NoScripts

end.