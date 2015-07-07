unit kwEqualZero;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEqualZero.pas"
// Начат: 26.04.2011 20:07
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwEqualZero
//
// 0=                             "zero-equals"
// ( x -- flag )
// flag - true, если и только если x - равно нулю.
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
 TkwEqualZero = class(_tfwAutoregisteringWord_)
  {* 0=                             "zero-equals"                    
( x -- flag )
            flag - true, если и только если x - равно нулю. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEqualZero
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwEqualZero;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwEqualZero

procedure TkwEqualZero.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6EDB80222_var*
//#UC END# *4DAEEDE10285_4DB6EDB80222_var*
begin
//#UC START# *4DAEEDE10285_4DB6EDB80222_impl*
 aCtx.rEngine.PushBool(aCtx.rEngine.PopInt = 0);
//#UC END# *4DAEEDE10285_4DB6EDB80222_impl*
end;//TkwEqualZero.DoDoIt

class function TkwEqualZero.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DB6EDB80222_var*
//#UC END# *4DB0614603C8_4DB6EDB80222_var*
begin
//#UC START# *4DB0614603C8_4DB6EDB80222_impl*
 Result := '=0';
//#UC END# *4DB0614603C8_4DB6EDB80222_impl*
end;//TkwEqualZero.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.