unit kwNotImplemented;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNotImplemented.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::NotImplemented
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
 TkwNotImplemented = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNotImplemented
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNotImplemented;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwNotImplemented

procedure TkwNotImplemented.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4068660387_var*
//#UC END# *4DAEEDE10285_4F4068660387_var*
begin
//#UC START# *4DAEEDE10285_4F4068660387_impl*
 RunnerAssert(false, 'Не реализовано', aCtx);
//#UC END# *4DAEEDE10285_4F4068660387_impl*
end;//TkwNotImplemented.DoDoIt

class function TkwNotImplemented.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NotImplemented';
end;//TkwNotImplemented.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.