unit kwStringPos;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringPos.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::string_Pos
//
// 'мама рыла яму' 'ры' string:Pos .
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
 TkwStringPos = {final scriptword} class(TtfwDualStrWord)
  {* 'мама рыла яму' 'ры' string:Pos . }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringPos
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

// start class TkwStringPos

procedure TkwStringPos.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_514955AC00E8_var*
//#UC END# *4DD0D021034C_514955AC00E8_var*
begin
//#UC START# *4DD0D021034C_514955AC00E8_impl*
 aCtx.rEngine.PushInt(l3Pos(aStr1, aStr2));
//#UC END# *4DD0D021034C_514955AC00E8_impl*
end;//TkwStringPos.DoStrings

class function TkwStringPos.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:Pos';
end;//TkwStringPos.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация string_Pos
 TkwStringPos.RegisterInEngine;
{$IfEnd} //not NoScripts

end.