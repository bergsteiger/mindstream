unit kwIsClass;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIsClass.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TypeChecking::TypeCheckingPack::IsClass
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
 TkwIsClass = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsClass
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIsClass;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIsClass

procedure TkwIsClass.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_508527A001B1_var*
//#UC END# *4DAEEDE10285_508527A001B1_var*
begin
//#UC START# *4DAEEDE10285_508527A001B1_impl*
 aCtx.rEngine.PushBool(aCtx.rEngine.Pop.rType = tfw_svtClass);
//#UC END# *4DAEEDE10285_508527A001B1_impl*
end;//TkwIsClass.DoDoIt

class function TkwIsClass.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsClass';
end;//TkwIsClass.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.