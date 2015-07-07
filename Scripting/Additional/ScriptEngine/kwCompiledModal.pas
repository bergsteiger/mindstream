unit kwCompiledModal;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledModal.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CodeFlowWords::TkwCompiledModal
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
  seModalSupport
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  
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
   on EvcmTryEnterModalState do
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

end.