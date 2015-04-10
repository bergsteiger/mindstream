unit kwNotZero;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNotZero.pas"
// Начат: 29.04.2011 18:33
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwNotZero
//
// !=0                        "zero-not-equals"                CORE EXT
// ( x -- flag )
// flag - true, если и только если x - не равно нулю.
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
 TkwNotZero = class(_tfwAutoregisteringWord_)
  {* !=0                        "zero-not-equals"                CORE EXT
( x -- flag )
            flag - true, если и только если x - не равно нулю. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNotZero
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNotZero;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwNotZero

procedure TkwNotZero.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBACC100333_var*
//#UC END# *4DAEEDE10285_4DBACC100333_var*
begin
//#UC START# *4DAEEDE10285_4DBACC100333_impl*
 aCtx.rEngine.PushBool(aCtx.rEngine.PopInt <> 0);
//#UC END# *4DAEEDE10285_4DBACC100333_impl*
end;//TkwNotZero.DoDoIt

class function TkwNotZero.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DBACC100333_var*
//#UC END# *4DB0614603C8_4DBACC100333_var*
begin
//#UC START# *4DB0614603C8_4DBACC100333_impl*
 Result := '!=0';
//#UC END# *4DB0614603C8_4DBACC100333_impl*
end;//TkwNotZero.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.