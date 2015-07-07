unit kwCurrentExceptionMessage;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCurrentExceptionMessage.pas"
// Начат: 15.12.2011 20:30
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::current_exception_Message
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
 TkwCurrentExceptionMessage = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCurrentExceptionMessage
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCurrentExceptionMessage;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCurrentExceptionMessage

procedure TkwCurrentExceptionMessage.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EEA20930184_var*
//#UC END# *4DAEEDE10285_4EEA20930184_var*
begin
//#UC START# *4DAEEDE10285_4EEA20930184_impl*
 if (aCtx.rException = nil) then
  aCtx.rEngine.PushString('')
 else
  aCtx.rEngine.PushString(aCtx.rException.Message);
//#UC END# *4DAEEDE10285_4EEA20930184_impl*
end;//TkwCurrentExceptionMessage.DoDoIt

class function TkwCurrentExceptionMessage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception:Message';
end;//TkwCurrentExceptionMessage.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.