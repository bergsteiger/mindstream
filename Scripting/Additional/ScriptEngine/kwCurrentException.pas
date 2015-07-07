unit kwCurrentException;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCurrentException.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::current_exception
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
 TkwCurrentException = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCurrentException
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCurrentException;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCurrentException

procedure TkwCurrentException.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53E1019B03B2_var*
//#UC END# *4DAEEDE10285_53E1019B03B2_var*
begin
//#UC START# *4DAEEDE10285_53E1019B03B2_impl*
 aCtx.rEngine.PushObj(aCtx.rException);
//#UC END# *4DAEEDE10285_53E1019B03B2_impl*
end;//TkwCurrentException.DoDoIt

class function TkwCurrentException.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception';
end;//TkwCurrentException.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.