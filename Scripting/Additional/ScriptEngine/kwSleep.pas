unit kwSleep;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSleep.pas"
// Начат: 29.04.2011 21:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwSleep
//
// Приостановка на заданное количество времени.
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
 TkwSleep = class(_tfwAutoregisteringWord_)
  {* Приостановка на заданное количество времени. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSleep
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSleep;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwSleep

procedure TkwSleep.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBAF6B3007F_var*
//#UC END# *4DAEEDE10285_4DBAF6B3007F_var*
begin
//#UC START# *4DAEEDE10285_4DBAF6B3007F_impl*
 Sleep(aCtx.rEngine.PopInt);
//#UC END# *4DAEEDE10285_4DBAF6B3007F_impl*
end;//TkwSleep.DoDoIt

class function TkwSleep.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DBAF6B3007F_var*
//#UC END# *4DB0614603C8_4DBAF6B3007F_var*
begin
//#UC START# *4DB0614603C8_4DBAF6B3007F_impl*
 Result := 'SLEEP';
//#UC END# *4DB0614603C8_4DBAF6B3007F_impl*
end;//TkwSleep.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.