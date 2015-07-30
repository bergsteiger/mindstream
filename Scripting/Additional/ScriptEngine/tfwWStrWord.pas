unit tfwWStrWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwWStrWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TtfwWStrWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwSysUtilsWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _tfwWStrWordUses_Parent_ = TtfwSysUtilsWord;
 {$Include ..\ScriptEngine\tfwWStrWordUses.imp.pas}
 TtfwWStrWord = {abstract} class(_tfwWStrWordUses_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); virtual; abstract;
 end;//TtfwWStrWord
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

{$Include ..\ScriptEngine\tfwWStrWordUses.imp.pas}

// start class TtfwWStrWord

procedure TtfwWStrWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FE4E800D3_var*
var
 l_S : Il3CString;
 l_C : AnsiChar;
//#UC END# *4DAEEDE10285_4F4FE4E800D3_var*
begin
//#UC START# *4DAEEDE10285_4F4FE4E800D3_impl*
 if aCtx.rEngine.IsTopType(tfw_svtStr) then
 begin
  l_S := aCtx.rEngine.PopString;
  DoString(aCtx, l3PCharLen(l_S));
 end//aCtx.rEngine.Last.rType = tfw_svtString
 else
 if aCtx.rEngine.IsTopType(tfw_svtChar) then
 begin
  l_C := aCtx.rEngine.PopChar;
  DoString(aCtx, l3PCharLen(l_C));
 end//aCtx.rEngine.IsTopType(tfw_svtChar)
 else
  DoString(aCtx, aCtx.rEngine.PopWStr);
//#UC END# *4DAEEDE10285_4F4FE4E800D3_impl*
end;//TtfwWStrWord.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwWStrWord
 TtfwWStrWord.RegisterClass;
{$IfEnd} //not NoScripts

end.