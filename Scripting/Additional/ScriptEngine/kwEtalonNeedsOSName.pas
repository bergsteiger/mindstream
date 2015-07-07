unit kwEtalonNeedsOSName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEtalonNeedsOSName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::EtalonNeedsOSName
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
 TkwEtalonNeedsOSName = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeedsOSName
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeedsOSName : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwEtalonNeedsOSName;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwEtalonNeedsOSName

procedure TkwEtalonNeedsOSName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AF4ADD0371_var*
//#UC END# *4DAEEDE10285_51AF4ADD0371_var*
begin
//#UC START# *4DAEEDE10285_51AF4ADD0371_impl*
 g_EtalonNeedsOSName := true;
//#UC END# *4DAEEDE10285_51AF4ADD0371_impl*
end;//TkwEtalonNeedsOSName.DoDoIt

class function TkwEtalonNeedsOSName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsOSName';
end;//TkwEtalonNeedsOSName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.