unit kwCompiledWordWorkerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledWordWorkerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledWordWorkerWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordRefList,
  kwCompiledWordWorker,
  tfwTypeInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordWorkerWordRunner = class of TkwCompiledWordWorkerWordRunner;

 TkwCompiledWordWorkerWordRunner = class(TkwCompiledWordWorker)
 private
 // private fields
   f_LeftWordRefs : TtfwWordRefList;
   f_WordToRun : TtfwWord;
    {* Поле для свойства WordToRun}
   f_Caller : TtfwWord;
    {* Поле для свойства Caller}
 private
 // private methods
   procedure DoCode(const aCtx: TtfwContext);
   function ReturnsRef(const aCtx: TtfwContext): Boolean;
 protected
 // property methods
   procedure pm_SetWordToRun(aValue: TtfwWord);
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); override;
   function LeftWordRefParamsCount(const aCtx: TtfwContext): Integer; override;
   procedure AddLeftWordRefValue(const aCtx: TtfwContext;
     aValue: TtfwWord); override;
   function GetLeftWordRefValue(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
   function LeftWordRefValuesCount(const aCtx: TtfwContext): Integer; override;
   function GetRef(const aCtx: TtfwContext): TtfwWord; override;
 protected
 // protected methods
   procedure PushState(const aCtx: TtfwContext);
   procedure PushWordToWork(const aCtx: TtfwContext);
 public
 // public properties
   property WordToRun: TtfwWord
     read f_WordToRun
     write pm_SetWordToRun;
   property Caller: TtfwWord
     read f_Caller
     write f_Caller;
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

procedure TkwCompiledWordWorkerWordRunner.DoCode(const aCtx: TtfwContext);
//#UC START# *558C303A01A1_4F2198430108_var*
//#UC END# *558C303A01A1_4F2198430108_var*
begin
//#UC START# *558C303A01A1_4F2198430108_impl*
 PushState(aCtx);
 // - кладём параметры справа и слева на стек
 WordToRun.DoIt(aCtx);
 // - выполняем собственно определённое слово
//#UC END# *558C303A01A1_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.DoCode

function TkwCompiledWordWorkerWordRunner.ReturnsRef(const aCtx: TtfwContext): Boolean;
//#UC START# *558C30D10043_4F2198430108_var*
//#UC END# *558C30D10043_4F2198430108_var*
begin
//#UC START# *558C30D10043_4F2198430108_impl*
 Result := f_WordToRun.ResultTypeInfo[aCtx].Has(tfw_wmLeftWordRef);
//#UC END# *558C30D10043_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.ReturnsRef

procedure TkwCompiledWordWorkerWordRunner.PushState(const aCtx: TtfwContext);
//#UC START# *4F3FF6C20122_4F2198430108_var*
//#UC END# *4F3FF6C20122_4F2198430108_var*
begin
//#UC START# *4F3FF6C20122_4F2198430108_impl*
 if WordToRun.ResultTypeInfo[aCtx].Has(tfw_wmCaller) then
  aCtx.rEngine.Push(TtfwStackValue_C(Caller));
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

 l_RightParamsCount := WordToRun.RightParamsCount(aCtx);
 if (l_RightParamsCount = 1) then
  aCtx.rEngine.Push(TtfwStackValue_C(WordToWork))
 else
 begin
  for l_Index := 0 to Pred(l_RightParamsCount) do
   aCtx.rEngine.Push(TtfwStackValue_C((WordToWork As TkwRuntimeWordWithCode).Code[l_Index]));
 end;//l_RightParamsCount = 1
//#UC END# *4F414A1A0247_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.PushWordToWork

procedure TkwCompiledWordWorkerWordRunner.pm_SetWordToRun(aValue: TtfwWord);
//#UC START# *4F219F4E03CB_4F2198430108set_var*
//#UC END# *4F219F4E03CB_4F2198430108set_var*
begin
//#UC START# *4F219F4E03CB_4F2198430108set_impl*
 aValue.SetRefTo(f_WordToRun);
//#UC END# *4F219F4E03CB_4F2198430108set_impl*
end;//TkwCompiledWordWorkerWordRunner.pm_SetWordToRun

procedure TkwCompiledWordWorkerWordRunner.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F2198430108_var*
//#UC END# *4DAEEDE10285_4F2198430108_var*
begin
//#UC START# *4DAEEDE10285_4F2198430108_impl*
 if ReturnsRef(aCtx) then
  GetRef(aCtx).DoIt(aCtx)
 else
  DoCode(aCtx);
//#UC END# *4DAEEDE10285_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.DoDoIt

procedure TkwCompiledWordWorkerWordRunner.Cleanup;
//#UC START# *479731C50290_4F2198430108_var*
//#UC END# *479731C50290_4F2198430108_var*
begin
//#UC START# *479731C50290_4F2198430108_impl*
 FreeAndNil(f_WordToRun);
 FreeAndNil(f_LeftWordRefs);
 inherited;
//#UC END# *479731C50290_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.Cleanup

function TkwCompiledWordWorkerWordRunner.IsImmediate(const aCtx: TtfwContext): Boolean;
//#UC START# *4DB6D7F70155_4F2198430108_var*
//#UC END# *4DB6D7F70155_4F2198430108_var*
begin
//#UC START# *4DB6D7F70155_4F2198430108_impl*
 Result := f_WordToRun.ResultTypeInfo[aCtx].Has(tfw_wmImmediate);
//#UC END# *4DB6D7F70155_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.IsImmediate

procedure TkwCompiledWordWorkerWordRunner.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_4F2198430108_var*
//#UC END# *52D00B00031A_4F2198430108_var*
begin
//#UC START# *52D00B00031A_4F2198430108_impl*
 if ReturnsRef(aCtx) then
  GetRef(aCtx).SetValue(aValue, aCtx, aNeedCheckType)
 else
  RunnerAssert(false, 'Пока невозможно присвоить значение оператору', aCtx);
//#UC END# *52D00B00031A_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.SetValue

function TkwCompiledWordWorkerWordRunner.LeftWordRefParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *53E4914101D2_4F2198430108_var*
//#UC END# *53E4914101D2_4F2198430108_var*
begin
//#UC START# *53E4914101D2_4F2198430108_impl*
 Result := WordToRun.LeftWordRefParamsCount(aCtx);
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

function TkwCompiledWordWorkerWordRunner.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_4F2198430108_var*
//#UC END# *558D2BCA0324_4F2198430108_var*
begin
//#UC START# *558D2BCA0324_4F2198430108_impl*
 if ReturnsRef(aCtx) then
 begin
  DoCode(aCtx);
  Result := aCtx.rEngine.PopObj As TtfwWord;
  Result := Result.GetRef(aCtx);
 end//ReturnsRef(aCtx)
 else
 begin
  Result := Self;
  //RunnerError('Оператор должен возвращать ссылку', aCtx);
 end;//ReturnsRef(aCtx)
//#UC END# *558D2BCA0324_4F2198430108_impl*
end;//TkwCompiledWordWorkerWordRunner.GetRef

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordWorkerWordRunner
 TkwCompiledWordWorkerWordRunner.RegisterClass;
{$IfEnd} //not NoScripts

end.