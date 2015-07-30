unit kwCompiledModal;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledModal.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::TkwCompiledModal
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWordWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledModal = class(TkwCompiledWordWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledModal
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  seModalSupport,
  l3AFWExceptions
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledModal

procedure TkwCompiledModal.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FC753D40064_var*
var
 l_Count : Integer;
//#UC END# *4DAEEDE10285_4FC753D40064_var*
begin
//#UC START# *4DAEEDE10285_4FC753D40064_impl*
 l_Count := seAddModalWorker(f_Word, aCtx);
 try
  try
   (aCtx.rEngine.PopObj As TTfwWord).DoIt(aCtx);
  except
   {$If defined(nsTest)}
   on El3TryEnterModalState do
    Exit;
   {$Else}
   raise; 
   {$IfEnd} //nsTest 
  end;//try..except
 finally
  RunnerAssert(seIsValidModalWorkersCount(l_Count), 'Видимо не выполнился код модального окна', aCtx);
 end;//try..finally
//#UC END# *4DAEEDE10285_4FC753D40064_impl*
end;//TkwCompiledModal.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledModal
 TkwCompiledModal.RegisterClass;
{$IfEnd} //not NoScripts

end.