unit kwCFEVERESTBIN;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCFEVERESTBIN.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::CF_EVERESTBIN
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
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
 TkwCFEVERESTBIN = {final} class(_tfwClipboardFormatWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFEVERESTBIN
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCFEVERESTBIN;

{$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}

// start class TkwCFEVERESTBIN

procedure TkwCFEVERESTBIN.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52E11B1F02E7_var*
//#UC END# *4DAEEDE10285_52E11B1F02E7_var*
begin
//#UC START# *4DAEEDE10285_52E11B1F02E7_impl*
 aCtx.rEngine.PushInt(cf_EverestBin);
//#UC END# *4DAEEDE10285_52E11B1F02E7_impl*
end;//TkwCFEVERESTBIN.DoDoIt

class function TkwCFEVERESTBIN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_EVERESTBIN';
end;//TkwCFEVERESTBIN.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
{$IfEnd} //not NoScripts

end.