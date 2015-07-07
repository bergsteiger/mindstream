unit kwFalse;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люилин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFalse.pas"
// Начат: 21.04.2011 15:24
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Basics::False
//
// Зарезервированное слово false
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
 TkwFalse = class(_tfwAutoregisteringWord_)
  {* Зарезервированное слово false }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFalse
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFalse;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFalse

procedure TkwFalse.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB013BF0367_var*
//#UC END# *4DAEEDE10285_4DB013BF0367_var*
begin
//#UC START# *4DAEEDE10285_4DB013BF0367_impl*
 aCtx.rEngine.PushBool(false);
//#UC END# *4DAEEDE10285_4DB013BF0367_impl*
end;//TkwFalse.DoDoIt

class function TkwFalse.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'false';
end;//TkwFalse.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.