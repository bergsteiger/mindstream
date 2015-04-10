unit kwMOD;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMOD.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwMOD
//
// MOD
// ( n1 n2 -- n3 )
// Делит n1 на n2, возвращает остаток n3 одна-ячейка.
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
 TkwMOD = {final} class(_tfwAutoregisteringWord_)
  {* MOD                                                             
( n1 n2 -- n3 )
            Делит n1 на n2, возвращает остаток n3 одна-ячейка. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMOD
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMOD;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMOD

procedure TkwMOD.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F9120E702D5_var*
var
 l_First: Integer;
//#UC END# *4DAEEDE10285_4F9120E702D5_var*
begin
//#UC START# *4DAEEDE10285_4F9120E702D5_impl*
 if aCtx.rEngine.IsTopInt then
  l_First := aCtx.rEngine.PopInt
 else
  Assert(False, 'Деление возможно только с целочисленными аргументами!');
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushInt(aCtx.rEngine.PopInt mod l_First)
 else
  Assert(False, 'Деление возможно только с целочисленными аргументами!');
//#UC END# *4DAEEDE10285_4F9120E702D5_impl*
end;//TkwMOD.DoDoIt

class function TkwMOD.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F9120E702D5_var*
//#UC END# *4DB0614603C8_4F9120E702D5_var*
begin
//#UC START# *4DB0614603C8_4F9120E702D5_impl*
 Result := 'MOD'
//#UC END# *4DB0614603C8_4F9120E702D5_impl*
end;//TkwMOD.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.