unit kwCompiledWordWorkerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWordWorkerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledWordWorkerWordRunner
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
  tfwScriptingInterfaces,
  tfwWordRefList,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordWorkerWordRunner = class of TkwCompiledWordWorkerWordRunner;

 TkwCompiledWordWorkerWordRunner = class(TkwCompiledWordWorker)
 private
 // private fields
   f_LeftWordRefs : TtfwWordRefList;
   f_Compiled : TtfwWord;
    {* Поле для свойства Compiled}
 protected
 // property methods
   procedure pm_SetCompiled(aValue: TtfwWord);
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   function LeftWordRefParamsCount(const aCtx: TtfwContext): Integer; override;
   procedure AddLeftWordRefValue(const aCtx: TtfwContext;
     aValue: TtfwWord); override;
   function GetLeftWordRefValue(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
   function LeftWordRefValuesCount(const aCtx: TtfwContext): Integer; override;
 protected
 // protected methods
   procedure PushState(const aCtx: TtfwContext); virtual;
   procedure PushWordToWork(const aCtx: TtfwContext);
 public
 // public properties
   property Compiled: TtfwWord
     read f_Compiled
     write pm_SetCompiled;
 end;//TkwCompiledWordWorkerWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwRuntimeWordWithCode,
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWordWorkerWordRunner

procedure TkwCompiledWordWorkerWordRunner.PushState(const aCtx: TtfwContext);
//#UC START# *4F3FF6C20122_4F2198430108_var*
//#UC END# *4F3FF6C20122_4F2198430108_var*
begin
//#UC START# *4F3FF6C20122_4F2198430108_impl*
 PushWordToWork(aCtx);
//#UC END# *4F3FF6C20122_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.PushState

procedure TkwCompiledWordWorkerWordRunner.PushWordToWork(const aCtx: TtfwContext);
//#UC START# *4F414A1A0247_4F2198430108_var*
var
 l_RightParamsCount : Integer;
 l_Index : Integer;
//#UC END# *4F414A1A0247_4F2198430108_var*
begin
//#UC START# *4F414A1A0247_4F2198430108_impl*
 if (f_LeftWordRefs <> nil) then
  for l_Index := 0 to Pred(f_LeftWordRefs.Count) do
   aCtx.rEngine.Push(TtfwStackValue_C(f_LeftWordRefs.Items[l_Index]));

 l_RightParamsCount := f_Compiled.RightParamsCount(aCtx);
 if (l_RightParamsCount = 1) then
  aCtx.rEngine.Push(TtfwStackValue_C(f_Word))
 else
 begin
  for l_Index := 0 to Pred(l_RightParamsCount) do
   aCtx.rEngine.Push(TtfwStackValue_C((f_Word As TkwRuntimeWordWithCode).Code[l_Index]));
 end;//l_RightParamsCount = 1
//#UC END# *4F414A1A0247_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.PushWordToWork

procedure TkwCompiledWordWorkerWordRunner.pm_SetCompiled(aValue: TtfwWord);
//#UC START# *4F219F4E03CB_4F2198430108set_var*
//#UC END# *4F219F4E03CB_4F2198430108set_var*
begin
//#UC START# *4F219F4E03CB_4F2198430108set_impl*
 aValue.SetRefTo(f_Compiled);
//#UC END# *4F219F4E03CB_4F2198430108set_impl*
end;//TkwCompiledWordWorkerWordRunner.pm_SetCompiled

procedure TkwCompiledWordWorkerWordRunner.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F2198430108_var*
//#UC END# *4DAEEDE10285_4F2198430108_var*
begin
//#UC START# *4DAEEDE10285_4F2198430108_impl*
 PushState(aCtx);
 // - кладём лямбду на стек
 // - вообще говоря это можно унаследовать от TkwCompiledPushWord
 f_Compiled.DoIt(aCtx);
 // - выполняем собственно определённое слово
//#UC END# *4DAEEDE10285_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.DoDoIt

procedure TkwCompiledWordWorkerWordRunner.Cleanup;
//#UC START# *479731C50290_4F2198430108_var*
//#UC END# *479731C50290_4F2198430108_var*
begin
//#UC START# *479731C50290_4F2198430108_impl*
 FreeAndNil(f_Compiled);
 FreeAndNil(f_LeftWordRefs);
 inherited;
//#UC END# *479731C50290_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.Cleanup

function TkwCompiledWordWorkerWordRunner.LeftWordRefParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *53E4914101D2_4F2198430108_var*
//#UC END# *53E4914101D2_4F2198430108_var*
begin
//#UC START# *53E4914101D2_4F2198430108_impl*
 Result := f_Compiled.LeftWordRefParamsCount(aCtx);
//#UC END# *53E4914101D2_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.LeftWordRefParamsCount

procedure TkwCompiledWordWorkerWordRunner.AddLeftWordRefValue(const aCtx: TtfwContext;
  aValue: TtfwWord);
//#UC START# *53E49B2F01E4_4F2198430108_var*
//#UC END# *53E49B2F01E4_4F2198430108_var*
begin
//#UC START# *53E49B2F01E4_4F2198430108_impl*
 if (f_LeftWordRefs = nil) then
  f_LeftWordRefs := TtfwWordRefList.Create;
 f_LeftWordRefs.Insert(0, aValue);
//#UC END# *53E49B2F01E4_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.AddLeftWordRefValue

function TkwCompiledWordWorkerWordRunner.GetLeftWordRefValue(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *53E4A3C100AB_4F2198430108_var*
//#UC END# *53E4A3C100AB_4F2198430108_var*
begin
//#UC START# *53E4A3C100AB_4F2198430108_impl*
 CompilerAssert(f_LeftWordRefs <> nil, 'Нету значений для левых параметров по ссылке', aCtx);
 CompilerAssert((anIndex >= 0) AND (anIndex < f_LeftWordRefs.Count), 'Нету значения для левого параметра по ссылке, для индекса ' + IntToStr(anIndex), aCtx);
 Result := f_LeftWordRefs.Items[anIndex];
//#UC END# *53E4A3C100AB_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.GetLeftWordRefValue

function TkwCompiledWordWorkerWordRunner.LeftWordRefValuesCount(const aCtx: TtfwContext): Integer;
//#UC START# *53E4A96A0085_4F2198430108_var*
//#UC END# *53E4A96A0085_4F2198430108_var*
begin
//#UC START# *53E4A96A0085_4F2198430108_impl*
 if (f_LeftWordRefs = nil) then
  Result := 0
 else
  Result := f_LeftWordRefs.Count; 
//#UC END# *53E4A96A0085_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.LeftWordRefValuesCount

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DB793A03AA*
 TkwCompiledWordWorkerWordRunner.RegisterClass;
//#UC END# *53DB793A03AA*
{$IfEnd} //not NoScripts

end.