unit kwCompiledRules;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledRules.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::ExtendedPrimitives::TkwCompiledRules
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwCompiledRules = class(TkwRuntimeWordWithCode)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledRules
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledRules

procedure TkwCompiledRules.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F51EC380222_var*
var
 l_I : Integer;
 l_C : Integer;
//#UC END# *4DAEEDE10285_4F51EC380222_var*
begin
//#UC START# *4DAEEDE10285_4F51EC380222_impl*
 if (Code <> nil) then
 begin
  l_I := 0;
  l_C := Code.Count - 1;
  while (l_I < l_C) do
  begin
   if Code[l_I].IsDefaultBranch then
   begin
    Code[l_I + 1].DoIt(aCtx);
    RunnerAssert(l_I + 1 = l_C, 'После выполнения секции DEFAULT остался лишний код', aCtx);
    break;
   end//Code[l_I].IsDefaultBranch
   else
   begin
    Code[l_I].DoIt(aCtx);
    if aCtx.rEngine.PopBool then
    // - правило выполнилось
    begin
     Code[l_I + 1].DoIt(aCtx);
     // - выполняем код
     break;
     // - выходим
    end;//aCtx.rEngine.PopBoo
   end;//Code[l_I].IsDefaultBranch
   Inc(l_I, 2);
  end;//l_I < l_C
 end;//Code <> nil
//#UC END# *4DAEEDE10285_4F51EC380222_impl*
end;//TkwCompiledRules.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DF7BE20042*
 TkwCompiledRules.RegisterClass;
//#UC END# *53DF7BE20042*
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwCompiledRules
 TkwCompiledRules.RegisterClass;
{$IfEnd} //not NoScripts

end.