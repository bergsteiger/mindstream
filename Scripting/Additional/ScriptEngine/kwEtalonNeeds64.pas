unit kwEtalonNeeds64;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEtalonNeeds64.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::EtalonNeeds64
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
 TkwEtalonNeeds64 = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEtalonNeeds64
{$IfEnd} //not NoScripts

  {$If not defined(NoScripts)}
var
   g_EtalonNeeds64 : Boolean = false;
  {$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwEtalonNeeds64;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwEtalonNeeds64

procedure TkwEtalonNeeds64.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51B0AFE902E6_var*
//#UC END# *4DAEEDE10285_51B0AFE902E6_var*
begin
//#UC START# *4DAEEDE10285_51B0AFE902E6_impl*
 g_EtalonNeeds64 := true;
//#UC END# *4DAEEDE10285_51B0AFE902E6_impl*
end;//TkwEtalonNeeds64.DoDoIt

class function TkwEtalonNeeds64.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeeds64';
end;//TkwEtalonNeeds64.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.