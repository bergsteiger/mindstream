unit kwGreaterThenZero;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGreaterThenZero.pas"
// Начат: 26.04.2011 20:06
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwGreaterThenZero
//
// >0                          "zero-greater"
// ( n -- flag )
// flag - true, если и только если n - больше нуля.
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
 TkwGreaterThenZero = class(_tfwAutoregisteringWord_)
  {* >0                          "zero-greater"                  
( n -- flag )
            flag - true, если и только если n - больше нуля. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGreaterThenZero
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGreaterThenZero;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwGreaterThenZero

procedure TkwGreaterThenZero.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6ED830058_var*
//#UC END# *4DAEEDE10285_4DB6ED830058_var*
begin
//#UC START# *4DAEEDE10285_4DB6ED830058_impl*
 aCtx.rEngine.PushBool(aCtx.rEngine.PopInt > 0);
//#UC END# *4DAEEDE10285_4DB6ED830058_impl*
end;//TkwGreaterThenZero.DoDoIt

class function TkwGreaterThenZero.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DB6ED830058_var*
//#UC END# *4DB0614603C8_4DB6ED830058_var*
begin
//#UC START# *4DB0614603C8_4DB6ED830058_impl*
 Result := '>0';
//#UC END# *4DB0614603C8_4DB6ED830058_impl*
end;//TkwGreaterThenZero.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.