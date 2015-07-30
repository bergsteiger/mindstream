unit tfwIteratorFromFunctor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwIteratorFromFunctor.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwIteratorFromFunctor
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwArray,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwArrayCollector = class(TtfwWord)
 private
 // private fields
   f_Array : TtfwArray;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(anArray: TtfwArray); reintroduce;
 end;//TtfwArrayCollector

 TtfwIteratorFromFunctor = class(TtfwIteratableParent, ItfwValueList)
 private
 // private fields
   f_Functor : TtfwWord;
 public
 // realized methods
   procedure ForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
   procedure ForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aFunctor: TtfwWord); reintroduce;
   class function Make(aFunctor: TtfwWord): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwIteratorFromFunctor.Make }
 end;//TtfwIteratorFromFunctor
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwIteratorFromFunctor

constructor TtfwIteratorFromFunctor.Create(aFunctor: TtfwWord);
//#UC START# *52EB870B01E6_52EB863801C3_var*
//#UC END# *52EB870B01E6_52EB863801C3_var*
begin
//#UC START# *52EB870B01E6_52EB863801C3_impl*
 inherited Create;
 aFunctor.SetRefTo(f_Functor);
//#UC END# *52EB870B01E6_52EB863801C3_impl*
end;//TtfwIteratorFromFunctor.Create

class function TtfwIteratorFromFunctor.Make(aFunctor: TtfwWord): ItfwValueList;
var
 l_Inst : TtfwIteratorFromFunctor;
begin
 l_Inst := Create(aFunctor);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;
// start class TtfwArrayCollector

constructor TtfwArrayCollector.Create(anArray: TtfwArray);
//#UC START# *52EB8CDA0033_52EB8C930076_var*
//#UC END# *52EB8CDA0033_52EB8C930076_var*
begin
//#UC START# *52EB8CDA0033_52EB8C930076_impl*
 inherited Create;
 anArray.SetRefTo(f_Array);
//#UC END# *52EB8CDA0033_52EB8C930076_impl*
end;//TtfwArrayCollector.Create

procedure TtfwArrayCollector.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EB8C930076_var*
//#UC END# *4DAEEDE10285_52EB8C930076_var*
begin
//#UC START# *4DAEEDE10285_52EB8C930076_impl*
 f_Array.Add(aCtx.rEngine.Pop);
//#UC END# *4DAEEDE10285_52EB8C930076_impl*
end;//TtfwArrayCollector.DoDoIt

procedure TtfwArrayCollector.Cleanup;
//#UC START# *479731C50290_52EB8C930076_var*
//#UC END# *479731C50290_52EB8C930076_var*
begin
//#UC START# *479731C50290_52EB8C930076_impl*
 FreeAndNil(f_Array);
 inherited;
//#UC END# *479731C50290_52EB8C930076_impl*
end;//TtfwArrayCollector.Cleanup

procedure TtfwIteratorFromFunctor.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_52EB863801C3_var*
//#UC END# *52E23B7A00EC_52EB863801C3_var*
begin
//#UC START# *52E23B7A00EC_52EB863801C3_impl*
 aCtx.rEngine.PushObj(aLambda);
 f_Functor.DoIt(aCtx);
//#UC END# *52E23B7A00EC_52EB863801C3_impl*
end;//TtfwIteratorFromFunctor.ForEach

procedure TtfwIteratorFromFunctor.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_52EB863801C3_var*
var
 l_Array : TtfwArray;
 l_Collector : TtfwArrayCollector;
//#UC END# *52E23BB102FA_52EB863801C3_var*
begin
//#UC START# *52E23BB102FA_52EB863801C3_impl*
 l_Array := TtfwArray.Create;
 try
  l_Collector := TtfwArrayCollector.Create(l_Array);
  try
   Self.ForEach(l_Collector, aCtx);
   l_Array.ForEachBack(aLambda, aCtx);
  finally
   FreeAndNil(l_Collector);
  end;//try..finally
 finally
  FreeAndNil(l_Array);
 end;//try..finally
//#UC END# *52E23BB102FA_52EB863801C3_impl*
end;//TtfwIteratorFromFunctor.ForEachBack

procedure TtfwIteratorFromFunctor.Cleanup;
//#UC START# *479731C50290_52EB863801C3_var*
//#UC END# *479731C50290_52EB863801C3_var*
begin
//#UC START# *479731C50290_52EB863801C3_impl*
 FreeAndNil(f_Functor);
 inherited;
//#UC END# *479731C50290_52EB863801C3_impl*
end;//TtfwIteratorFromFunctor.Cleanup

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwArrayCollector
 TtfwArrayCollector.RegisterClass;
{$IfEnd} //not NoScripts

end.