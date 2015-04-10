unit kwApplicationExeName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwApplicationExeName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::application_ExeName
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
 TkwApplicationExeName = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwApplicationExeName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwApplicationExeName;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwApplicationExeName

procedure TkwApplicationExeName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53C51FD802CE_var*
//#UC END# *4DAEEDE10285_53C51FD802CE_var*
begin
//#UC START# *4DAEEDE10285_53C51FD802CE_impl*
 aCtx.rEngine.PushString(ParamStr(0));
//#UC END# *4DAEEDE10285_53C51FD802CE_impl*
end;//TkwApplicationExeName.DoDoIt

class function TkwApplicationExeName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:ExeName';
end;//TkwApplicationExeName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.