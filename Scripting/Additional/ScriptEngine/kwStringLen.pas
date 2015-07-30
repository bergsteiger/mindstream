unit kwStringLen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringLen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::string_Len
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
 TkwStringLen = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringLen
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

// start class TkwStringLen

procedure TkwStringLen.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F4FDA750005_var*
//#UC END# *4DD0CF6F0197_4F4FDA750005_var*
begin
//#UC START# *4DD0CF6F0197_4F4FDA750005_impl*
 if (aStr = nil) then
  aCtx.rEngine.PushInt(0)
 else
  aCtx.rEngine.PushInt(aStr.AsWStr.SLen);
//#UC END# *4DD0CF6F0197_4F4FDA750005_impl*
end;//TkwStringLen.DoString

class function TkwStringLen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:Len';
end;//TkwStringLen.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация string_Len
 TkwStringLen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.