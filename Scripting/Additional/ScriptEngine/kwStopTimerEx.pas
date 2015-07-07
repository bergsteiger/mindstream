unit kwStopTimerEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStopTimerEx.pas"
// Начат: 16.01.2012 21:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::StopTimerEx
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
 TkwStopTimerEx = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStopTimerEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwStopTimerEx;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwStopTimerEx

procedure TkwStopTimerEx.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F145AEB0088_var*
var
 l_S1 : AnsiString;
 l_S2 : AnsiString;
//#UC END# *4DAEEDE10285_4F145AEB0088_var*
begin
//#UC START# *4DAEEDE10285_4F145AEB0088_impl*
 l_S2 := aCtx.rEngine.PopDelphiString;
 l_S1 := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushInt(aCtx.rCaller.StopTimer(l_S1, l_S2));
//#UC END# *4DAEEDE10285_4F145AEB0088_impl*
end;//TkwStopTimerEx.DoDoIt

class function TkwStopTimerEx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StopTimerEx';
end;//TkwStopTimerEx.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.