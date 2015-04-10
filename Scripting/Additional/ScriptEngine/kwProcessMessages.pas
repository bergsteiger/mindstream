unit kwProcessMessages;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwProcessMessages.pas"
// Начат: 25.04.2011 18:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::ProcessMessages
//
// Вызов Application.ProcessMessages для обработки поступивших от Windows сообщений.
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
 TkwProcessMessages = class(_tfwAutoregisteringWord_)
  {* Вызов Application.ProcessMessages для обработки поступивших от Windows сообщений. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwProcessMessages
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  afwFacade,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwProcessMessages;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwProcessMessages

procedure TkwProcessMessages.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB581050312_var*
//#UC END# *4DAEEDE10285_4DB581050312_var*
begin
//#UC START# *4DAEEDE10285_4DB581050312_impl*
 afw.ProcessMessages;
//#UC END# *4DAEEDE10285_4DB581050312_impl*
end;//TkwProcessMessages.DoDoIt

class function TkwProcessMessages.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ProcessMessages';
end;//TkwProcessMessages.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.