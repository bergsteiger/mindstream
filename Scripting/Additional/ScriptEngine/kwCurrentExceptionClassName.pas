unit kwCurrentExceptionClassName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCurrentExceptionClassName.pas"
// Начат: 15.12.2011 20:29
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::current_exception_ClassName
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
 TkwCurrentExceptionClassName = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCurrentExceptionClassName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCurrentExceptionClassName;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCurrentExceptionClassName

procedure TkwCurrentExceptionClassName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EEA2060022E_var*
//#UC END# *4DAEEDE10285_4EEA2060022E_var*
begin
//#UC START# *4DAEEDE10285_4EEA2060022E_impl*
 if (aCtx.rException = nil) then
  aCtx.rEngine.PushString('')
 else
  aCtx.rEngine.PushString(aCtx.rException.ClassName);
//#UC END# *4DAEEDE10285_4EEA2060022E_impl*
end;//TkwCurrentExceptionClassName.DoDoIt

class function TkwCurrentExceptionClassName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception:ClassName';
end;//TkwCurrentExceptionClassName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.