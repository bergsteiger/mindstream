unit kwIsUnder64;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIsUnder64.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::IsUnder64
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
 TkwIsUnder64 = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsUnder64
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIsUnder64;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIsUnder64

procedure TkwIsUnder64.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51A71C8702A5_var*
//#UC END# *4DAEEDE10285_51A71C8702A5_var*
begin
//#UC START# *4DAEEDE10285_51A71C8702A5_impl*
 aCtx.rEngine.PushBool(l3Is64System);
//#UC END# *4DAEEDE10285_51A71C8702A5_impl*
end;//TkwIsUnder64.DoDoIt

class function TkwIsUnder64.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsUnder64';
end;//TkwIsUnder64.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.