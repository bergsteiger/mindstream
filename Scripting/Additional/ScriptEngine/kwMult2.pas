unit kwMult2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMult2.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwMult2
//
// 2*                                "two-star"
// ( x1 -- x2 )
// Умножение на два.
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
 TkwMult2 = {final} class(_tfwAutoregisteringWord_)
  {* 2*                                "two-star"                    
( x1 -- x2 )
Умножение на два. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMult2
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMult2;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMult2

procedure TkwMult2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F91207803B1_var*
//#UC END# *4DAEEDE10285_4F91207803B1_var*
begin
//#UC START# *4DAEEDE10285_4F91207803B1_impl*
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushInt(aCtx.rEngine.PopInt shl 1)
 else
  Assert(False, 'Умножение возможно только с целочисленными аргументами!');
//#UC END# *4DAEEDE10285_4F91207803B1_impl*
end;//TkwMult2.DoDoIt

class function TkwMult2.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F91207803B1_var*
//#UC END# *4DB0614603C8_4F91207803B1_var*
begin
//#UC START# *4DB0614603C8_4F91207803B1_impl*
 Result := '2*';
//#UC END# *4DB0614603C8_4F91207803B1_impl*
end;//TkwMult2.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.