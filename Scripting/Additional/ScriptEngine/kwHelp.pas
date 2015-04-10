unit kwHelp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwHelp.pas"
// Начат: 22.04.2011 16:24
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Basics::Help
//
// Выводит список всех зарегистрированных слов.
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
 TkwHelp = class(_tfwAutoregisteringWord_)
  {* Выводит список всех зарегистрированных слов. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwHelp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Chars,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwHelp;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwHelp

procedure TkwHelp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB1736C02D8_var*
//#UC END# *4DAEEDE10285_4DB1736C02D8_var*
begin
//#UC START# *4DAEEDE10285_4DB1736C02D8_impl*
 if aCtx.rEngine.IsTopString then
  aCtx.rEngine.PrintDictionary(aCtx, l3PCharLen(aCtx.rEngine.PopString))
 else
  aCtx.rEngine.PrintDictionary(aCtx, cc_EmptyStr);
//#UC END# *4DAEEDE10285_4DB1736C02D8_impl*
end;//TkwHelp.DoDoIt

class function TkwHelp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'help';
end;//TkwHelp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.