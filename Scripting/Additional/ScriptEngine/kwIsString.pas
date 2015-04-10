unit kwIsString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIsString.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TypeChecking::TypeCheckingPack::IsString
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
 TkwIsString = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIsString;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIsString

procedure TkwIsString.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F5094D10103_var*
//#UC END# *4DAEEDE10285_4F5094D10103_var*
begin
//#UC START# *4DAEEDE10285_4F5094D10103_impl*
 aCtx.rEngine.PushBool(aCtx.rEngine.Pop.rType = tfw_svtStr);
//#UC END# *4DAEEDE10285_4F5094D10103_impl*
end;//TkwIsString.DoDoIt

class function TkwIsString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsString';
end;//TkwIsString.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.