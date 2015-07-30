unit tfwDualWStrWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwDualWStrWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TtfwDualWStrWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwWStrWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDualWStrWord = {abstract} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // protected methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); virtual; abstract;
 end;//TtfwDualWStrWord
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

// start class TtfwDualWStrWord

procedure TtfwDualWStrWord.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FE56B01BF_var*
var
 l_S : Il3CString;
 l_C : AnsiChar;
//#UC END# *4F4FE51201BD_4F4FE56B01BF_var*
begin
//#UC START# *4F4FE51201BD_4F4FE56B01BF_impl*
 if aCtx.rEngine.IsTopType(tfw_svtStr) then
 begin
  l_S := aCtx.rEngine.PopString;
  DoStrings(aCtx, l3PCharLen(l_S), aStr);
 end//aCtx.rEngine.Last.rType = tfw_svtString
 else
 if aCtx.rEngine.IsTopType(tfw_svtChar) then
 begin
  l_C := aCtx.rEngine.PopChar;
  DoStrings(aCtx, l3PCharLen(l_C), aStr);
 end//aCtx.rEngine.IsTopType(tfw_svtChar)
 else
  DoStrings(aCtx, aCtx.rEngine.PopWStr, aStr);
//#UC END# *4F4FE51201BD_4F4FE56B01BF_impl*
end;//TtfwDualWStrWord.DoString

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwDualWStrWord
 TtfwDualWStrWord.RegisterClass;
{$IfEnd} //not NoScripts

end.