unit kwGreaterThan;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGreaterThan.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwGreaterThan
//
// >  "greater-than"
// ( n1 n2 -- flag )
// flag - true, если и только если n1 - больше чем n2.
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
 TkwGreaterThan = class(_tfwAutoregisteringWord_)
  {* >  "greater-than"
( n1 n2 -- flag )
            flag - true, если и только если n1 - больше чем n2. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGreaterThan
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGreaterThan;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwGreaterThan

procedure TkwGreaterThan.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4E01D6AB01E4_var*
var
 l_Value: TtfwStackValue;
//#UC END# *4DAEEDE10285_4E01D6AB01E4_var*
begin
//#UC START# *4DAEEDE10285_4E01D6AB01E4_impl*
 l_Value := aCtx.rEngine.Pop;
 if aCtx.rEngine.IsTopBool then
 begin
  RunnerAssert(l_Value.rType = tfw_svtBool, 'Сравниваются значения разных типов.', aCtx);
  aCtx.rEngine.PushBool(l_Value.AsBoolean < aCtx.rEngine.PopBool)
 end // if aCtx.rEngine.IsTopBool then
 else
  if aCtx.rEngine.IsTopInt then
  begin
   RunnerAssert(l_Value.rType = tfw_svtInt, 'Сравниваются значения разных типов.', aCtx);
   aCtx.rEngine.PushBool(l_Value.rInteger < aCtx.rEngine.PopInt)
  end //if aCtx.rEngine.IsTopInt then
  else
   RunnerAssert(False, 'Несравниваемые типы.', aCtx);
//#UC END# *4DAEEDE10285_4E01D6AB01E4_impl*
end;//TkwGreaterThan.DoDoIt

class function TkwGreaterThan.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4E01D6AB01E4_var*
//#UC END# *4DB0614603C8_4E01D6AB01E4_var*
begin
//#UC START# *4DB0614603C8_4E01D6AB01E4_impl*
 Result := 'GREATER';
//#UC END# *4DB0614603C8_4E01D6AB01E4_impl*
end;//TkwGreaterThan.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.