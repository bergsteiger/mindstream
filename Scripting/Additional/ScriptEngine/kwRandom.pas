unit kwRandom;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRandom.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::Random
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
 TkwRandom = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRandom
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwRandom;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwRandom

procedure TkwRandom.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50599E3802CF_var*
//#UC END# *4DAEEDE10285_50599E3802CF_var*
begin
//#UC START# *4DAEEDE10285_50599E3802CF_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Функции Random надо передать число.', aCtx);
 aCtx.rEngine.PushInt(Random(aCtx.rEngine.PopInt));
//#UC END# *4DAEEDE10285_50599E3802CF_impl*
end;//TkwRandom.DoDoIt

class function TkwRandom.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Random';
end;//TkwRandom.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.