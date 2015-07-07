unit kwCFEVEREST;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCFEVEREST.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::CF_EVEREST
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
 TkwCFEVEREST = {final} class(_tfwClipboardFormatWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFEVEREST
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

type _Instance_R_ = TkwCFEVEREST;

{$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}

// start class TkwCFEVEREST

procedure TkwCFEVEREST.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5052EB1003B3_var*
//#UC END# *4DAEEDE10285_5052EB1003B3_var*
begin
//#UC START# *4DAEEDE10285_5052EB1003B3_impl*
 aCtx.rEngine.PushInt(cf_EverestTxt);
//#UC END# *4DAEEDE10285_5052EB1003B3_impl*
end;//TkwCFEVEREST.DoDoIt

class function TkwCFEVEREST.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_EVEREST';
end;//TkwCFEVEREST.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
{$IfEnd} //not NoScripts

end.