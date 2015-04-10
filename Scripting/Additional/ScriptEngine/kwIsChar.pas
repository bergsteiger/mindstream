unit kwIsChar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIsChar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TypeChecking::TypeCheckingPack::IsChar
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
 TkwIsChar = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsChar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIsChar;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIsChar

procedure TkwIsChar.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F5094B40149_var*
//#UC END# *4DAEEDE10285_4F5094B40149_var*
begin
//#UC START# *4DAEEDE10285_4F5094B40149_impl*
 aCtx.rEngine.PushBool(aCtx.rEngine.Pop.rType = tfw_svtChar);
//#UC END# *4DAEEDE10285_4F5094B40149_impl*
end;//TkwIsChar.DoDoIt

class function TkwIsChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsChar';
end;//TkwIsChar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.