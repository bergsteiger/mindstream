unit kwWStringInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_Inc
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWStringInc = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringInc

procedure TkwWStringInc.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FEBF70060_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4F4FE51201BD_4F4FEBF70060_var*
begin
//#UC START# *4F4FE51201BD_4F4FEBF70060_impl*
 l_P := Tl3PCharLen(aStr);
 l_P.Shift(+1);
 aCtx.rEngine.PushWStr(l_P);
//#UC END# *4F4FE51201BD_4F4FEBF70060_impl*
end;//TkwWStringInc.DoString

class function TkwWStringInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:++';
end;//TkwWStringInc.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_Inc
 TkwWStringInc.RegisterInEngine;
{$IfEnd} //not NoScripts

end.