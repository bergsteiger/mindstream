unit kwCurrentExceptionClass;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCurrentExceptionClass.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::current_exception_class
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
 TkwCurrentExceptionClass = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCurrentExceptionClass
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCurrentExceptionClass;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCurrentExceptionClass

procedure TkwCurrentExceptionClass.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53E0F2E300C1_var*
//#UC END# *4DAEEDE10285_53E0F2E300C1_var*
begin
//#UC START# *4DAEEDE10285_53E0F2E300C1_impl*
 if (aCtx.rException = nil) then
  aCtx.rEngine.PushClass(nil)
 else
  aCtx.rEngine.PushClass(aCtx.rException.ClassType);
//#UC END# *4DAEEDE10285_53E0F2E300C1_impl*
end;//TkwCurrentExceptionClass.DoDoIt

class function TkwCurrentExceptionClass.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception:class';
end;//TkwCurrentExceptionClass.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.