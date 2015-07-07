unit kwRuntimeWordWithCodeExecution;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRuntimeWordWithCodeExecution.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwRuntimeWordWithCodeExecution
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
  kwRuntimeWordWithCode,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwRuntimeWordWithCodeExecution = class(TkwRuntimeWordWithCode)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwRuntimeWordWithCodeExecution
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwRuntimeWordWithCodeExecution

procedure TkwRuntimeWordWithCodeExecution.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52D69DF30179_var*
var
 l_Index : Integer;
//#UC END# *4DAEEDE10285_52D69DF30179_var*
begin
//#UC START# *4DAEEDE10285_52D69DF30179_impl*
 if (Code <> nil) then
  for l_Index := 0 to Pred(Code.Count) do
   Code[l_Index].DoIt(aCtx);
//#UC END# *4DAEEDE10285_52D69DF30179_impl*
end;//TkwRuntimeWordWithCodeExecution.DoDoIt

{$IfEnd} //not NoScripts

end.