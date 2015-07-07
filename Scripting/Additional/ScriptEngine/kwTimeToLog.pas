unit kwTimeToLog;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTimeToLog.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::TimeToLog
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwTimeToLog = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTimeToLog
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTimeToLog;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwTimeToLog

procedure TkwTimeToLog.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_511BC86E000A_var*

 function Mangle(const aStr: AnsiString): AnsiString;
(* const
  cLimit = 30;*)
 begin
  Result := aStr;
(*  Result := l3Transliterate(aStr);
  l3Replace(Result, ' ', '_');
  l3Replace(Result, '''', '_');
  l3Replace(Result, '(', '_');
  l3Replace(Result, ')', '_');
  l3Replace(Result, '.', '_');
  if (Length(Result) > cLimit) then
   SetLength(Result, cLimit);*)
 end;
 
var
 l_S1 : AnsiString;
 l_S2 : AnsiString;
 l_I  : Integer;
//#UC END# *4DAEEDE10285_511BC86E000A_var*
begin
//#UC START# *4DAEEDE10285_511BC86E000A_impl*
 l_I := aCtx.rEngine.PopInt;
 l_S2 := Mangle(aCtx.rEngine.PopDelphiString);
 l_S1 := Mangle(aCtx.rEngine.PopDelphiString);
 aCtx.rCaller.TimeToLog(l_I, l_S1, l_S2);
//#UC END# *4DAEEDE10285_511BC86E000A_impl*
end;//TkwTimeToLog.DoDoIt

class function TkwTimeToLog.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'TimeToLog';
end;//TkwTimeToLog.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.