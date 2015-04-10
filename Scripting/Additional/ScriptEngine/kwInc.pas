unit kwInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwInc.pas"
// Начат: 26.04.2011 20:53
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwInc
//
// '++'. Увеличиваем верхнее значение в стеке на единицу
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
 TkwInc = class(_tfwAutoregisteringWord_)
  {* '++'. Увеличиваем верхнее значение в стеке на единицу }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwInc;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwInc

procedure TkwInc.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6F861006A_var*
//#UC END# *4DAEEDE10285_4DB6F861006A_var*
begin
//#UC START# *4DAEEDE10285_4DB6F861006A_impl*
 aCtx.rEngine.PushInt(aCtx.rEngine.PopInt + 1);
//#UC END# *4DAEEDE10285_4DB6F861006A_impl*
end;//TkwInc.DoDoIt

class function TkwInc.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DB6F861006A_var*
//#UC END# *4DB0614603C8_4DB6F861006A_var*
begin
//#UC START# *4DB0614603C8_4DB6F861006A_impl*
 Result := '++';
//#UC END# *4DB0614603C8_4DB6F861006A_impl*
end;//TkwInc.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.