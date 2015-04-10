{$IfNDef tfwStackChecking_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwStackChecking.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwStackChecking
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwStackChecking_imp}
{$If not defined(NoScripts)}
 _tfwStackChecking_ = {mixin} class(_tfwStackChecking_Parent_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   function StackCheckingMessage: AnsiString; virtual;
 end;//_tfwStackChecking_
{$IfEnd} //not NoScripts

{$Else tfwStackChecking_imp}

{$If not defined(NoScripts)}

// start class _tfwStackChecking_

function _tfwStackChecking_.StackCheckingMessage: AnsiString;
//#UC START# *528F7301033E_528F7DDA02BF_var*
//#UC END# *528F7301033E_528F7DDA02BF_var*
begin
//#UC START# *528F7301033E_528F7DDA02BF_impl*
 Result := 'Процедура не может возвращать значения через стек';
//#UC END# *528F7301033E_528F7DDA02BF_impl*
end;//_tfwStackChecking_.StackCheckingMessage

procedure _tfwStackChecking_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_528F7DDA02BF_var*
var
 l_StackCount : Integer;
 l_ParamCount : Integer;
//#UC END# *4DAEEDE10285_528F7DDA02BF_var*
begin
//#UC START# *4DAEEDE10285_528F7DDA02BF_impl*
 l_StackCount := aCtx.rEngine.ValuesCount;
 if (InParams = nil) then
  l_ParamCount := 0
 else
  l_ParamCount := InParams.Count;
 inherited;
 l_StackCount := aCtx.rEngine.ValuesCount - (l_StackCount - l_ParamCount);
 if (l_StackCount > 0) then
 begin
  while (l_StackCount > 0) do
  // - чистим мусор, чтобы он не достался остальным
  begin
   aCtx.rEngine.Drop;
   Dec(l_StackCount);
  end;//while (l_StackCount > 0)
  RunnerAssert(false, StackCheckingMessage, aCtx);
 end//l_StackCount > 0
 else
 if (l_StackCount < 0) then
 begin
  RunnerAssertFmt(false, 'Со стека забрали больше значений: %d, чем описано параметров: %d', [l_ParamCount-l_StackCount, l_ParamCount], aCtx);
 end;//l_StackCount < 0
//#UC END# *4DAEEDE10285_528F7DDA02BF_impl*
end;//_tfwStackChecking_.DoDoIt

{$IfEnd} //not NoScripts

{$EndIf tfwStackChecking_imp}
