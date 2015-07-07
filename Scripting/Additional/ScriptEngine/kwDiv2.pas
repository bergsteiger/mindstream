unit kwDiv2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDiv2.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwDiv2
//
// 2/                                "two-slash"
// ( x1 -- x2 )
// Деление на два
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
 TkwDiv2 = {final} class(_tfwAutoregisteringWord_)
  {* 2/                                "two-slash"
( x1 -- x2 )
 Деление на два }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDiv2
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDiv2;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDiv2

procedure TkwDiv2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F912066024E_var*
//#UC END# *4DAEEDE10285_4F912066024E_var*
begin
//#UC START# *4DAEEDE10285_4F912066024E_impl*
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushInt(aCtx.rEngine.PopInt shr 1)
 else
  Assert(False, 'Деление возможно только с целочисленными аргументами!');
//#UC END# *4DAEEDE10285_4F912066024E_impl*
end;//TkwDiv2.DoDoIt

class function TkwDiv2.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F912066024E_var*
//#UC END# *4DB0614603C8_4F912066024E_var*
begin
//#UC START# *4DB0614603C8_4F912066024E_impl*
 Result := '2/';
//#UC END# *4DB0614603C8_4F912066024E_impl*
end;//TkwDiv2.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.