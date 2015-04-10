unit kwEtalonNeedsComputerName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEtalonNeedsComputerName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::EtalonNeedsComputerName
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
 TkwEtalonNeedsComputerName = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeedsComputerName
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeedsComputerName : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwEtalonNeedsComputerName;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwEtalonNeedsComputerName

procedure TkwEtalonNeedsComputerName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_511522EF0076_var*
//#UC END# *4DAEEDE10285_511522EF0076_var*
begin
//#UC START# *4DAEEDE10285_511522EF0076_impl*
 g_EtalonNeedsComputerName := true;
//#UC END# *4DAEEDE10285_511522EF0076_impl*
end;//TkwEtalonNeedsComputerName.DoDoIt

class function TkwEtalonNeedsComputerName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsComputerName';
end;//TkwEtalonNeedsComputerName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.