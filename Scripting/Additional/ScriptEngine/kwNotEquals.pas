unit kwNotEquals;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNotEquals.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwNotEquals
//
// <>                               "not-equals"
// ( x1 x2 -- flag )
// flag - true, если и только если x1 не эквивалентно x2.
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
 TkwNotEquals = class(_tfwAutoregisteringWord_)
  {* <>                               "not-equals"               
( x1 x2 -- flag )
            flag - true, если и только если x1 не эквивалентно x2. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNotEquals
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNotEquals;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwNotEquals

procedure TkwNotEquals.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4E01CB3E02A2_var*
var
 l_Value: TtfwStackValue;
//#UC END# *4DAEEDE10285_4E01CB3E02A2_var*
begin
//#UC START# *4DAEEDE10285_4E01CB3E02A2_impl*
 l_Value := aCtx.rEngine.Pop;
 if aCtx.rEngine.IsTopBool then
 begin
  RunnerAssert(l_Value.rType = tfw_svtBool, 'Сравниваются значения разных типов.', aCtx);
  aCtx.rEngine.PushBool(l_Value.AsBoolean <> aCtx.rEngine.PopBool)
 end // if aCtx.rEngine.IsTopBool then
 else
  if aCtx.rEngine.IsTopInt then
  begin
   RunnerAssert(l_Value.rType = tfw_svtInt, 'Сравниваются значения разных типов.', aCtx);
   aCtx.rEngine.PushBool(l_Value.rInteger <> aCtx.rEngine.PopInt)
  end //if aCtx.rEngine.IsTopInt then
  else
   if aCtx.rEngine.IsTopString then
   begin
    RunnerAssert(l_Value.rType = tfw_svtStr, 'Сравниваются значения разных типов.', aCtx);
    aCtx.rEngine.PushBool(not l3Same(l_Value.rString, aCtx.rEngine.PopString))
   end else
    RunnerAssert(False, 'Слово "<>" ничего не сделало!', aCtx);
//#UC END# *4DAEEDE10285_4E01CB3E02A2_impl*
end;//TkwNotEquals.DoDoIt

class function TkwNotEquals.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4E01CB3E02A2_var*
//#UC END# *4DB0614603C8_4E01CB3E02A2_var*
begin
//#UC START# *4DB0614603C8_4E01CB3E02A2_impl*
 Result := '!=';
//#UC END# *4DB0614603C8_4E01CB3E02A2_impl*
end;//TkwNotEquals.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.