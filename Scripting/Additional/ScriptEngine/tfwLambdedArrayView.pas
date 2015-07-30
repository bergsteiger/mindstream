unit tfwLambdedArrayView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwLambdedArrayView.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwLambdedArrayView
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  tfwArrayView,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwTwoLambdas = {abstract} class(TkwCompiledWordWorker)
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
  {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
  {$IfEnd} //not DesignTimeLibrary
 protected
 // protected fields
   f_Lambda : TtfwWord;
 public
 // public methods
   constructor Create(aLambda: TtfwWord;
     aWord: TtfwWord); reintroduce;
 end;//TtfwTwoLambdas

 RtfwTwoLambdas = class of TtfwTwoLambdas;

 TtfwLambdedArrayView = class(TtfwArrayView)
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   procedure DoForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext); override;
   procedure DoForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext); override;
 protected
 // protected fields
   f_Lambda : TtfwWord;
 protected
 // protected methods
   function TwoLabdasClass: RtfwTwoLambdas; virtual; abstract;
 public
 // public methods
   constructor Create(const anOther: ItfwValueList;
     aLambda: TtfwWord); reintroduce;
   class function Make(const anOther: ItfwValueList;
     aLambda: TtfwWord): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwLambdedArrayView.Make }
 end;//TtfwLambdedArrayView
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwLambdedArrayView

constructor TtfwLambdedArrayView.Create(const anOther: ItfwValueList;
  aLambda: TtfwWord);
//#UC START# *52E6671B033F_52E666BC0270_var*
//#UC END# *52E6671B033F_52E666BC0270_var*
begin
//#UC START# *52E6671B033F_52E666BC0270_impl*
 inherited Create(anOther);
 aLambda.SetRefTo(f_Lambda);
//#UC END# *52E6671B033F_52E666BC0270_impl*
end;//TtfwLambdedArrayView.Create

class function TtfwLambdedArrayView.Make(const anOther: ItfwValueList;
  aLambda: TtfwWord): ItfwValueList;
var
 l_Inst : TtfwLambdedArrayView;
begin
 l_Inst := Create(anOther, aLambda);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;
// start class TtfwTwoLambdas

constructor TtfwTwoLambdas.Create(aLambda: TtfwWord;
  aWord: TtfwWord);
//#UC START# *52EA8B2403DD_52EA8AD102B0_var*
//#UC END# *52EA8B2403DD_52EA8AD102B0_var*
begin
//#UC START# *52EA8B2403DD_52EA8AD102B0_impl*
 inherited Create(aWord, nil);
 aLambda.SetRefTo(f_Lambda);
//#UC END# *52EA8B2403DD_52EA8AD102B0_impl*
end;//TtfwTwoLambdas.Create

procedure TtfwTwoLambdas.Cleanup;
//#UC START# *479731C50290_52EA8AD102B0_var*
//#UC END# *479731C50290_52EA8AD102B0_var*
begin
//#UC START# *479731C50290_52EA8AD102B0_impl*
 FreeAndNil(f_Lambda);
 inherited;
//#UC END# *479731C50290_52EA8AD102B0_impl*
end;//TtfwTwoLambdas.Cleanup

{$If not defined(DesignTimeLibrary)}
class function TtfwTwoLambdas.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_52EA8AD102B0_var*
//#UC END# *47A6FEE600FC_52EA8AD102B0_var*
begin
//#UC START# *47A6FEE600FC_52EA8AD102B0_impl*
 Result := true;
//#UC END# *47A6FEE600FC_52EA8AD102B0_impl*
end;//TtfwTwoLambdas.IsCacheable
{$IfEnd} //not DesignTimeLibrary

procedure TtfwLambdedArrayView.Cleanup;
//#UC START# *479731C50290_52E666BC0270_var*
//#UC END# *479731C50290_52E666BC0270_var*
begin
//#UC START# *479731C50290_52E666BC0270_impl*
 FreeAndNil(f_Lambda);
 inherited;
//#UC END# *479731C50290_52E666BC0270_impl*
end;//TtfwLambdedArrayView.Cleanup

procedure TtfwLambdedArrayView.DoForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E666E80335_52E666BC0270_var*
var
 l_Lambda : TtfwWord;
//#UC END# *52E666E80335_52E666BC0270_var*
begin
//#UC START# *52E666E80335_52E666BC0270_impl*
 l_Lambda := TwoLabdasClass.Create(f_Lambda, TtfwWord(aLambda));
 try
  inherited DoForEach(l_Lambda, aCtx);
 finally
  FreeAndNil(l_Lambda);
 end;//try..finally
//#UC END# *52E666E80335_52E666BC0270_impl*
end;//TtfwLambdedArrayView.DoForEach

procedure TtfwLambdedArrayView.DoForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E666F6036E_52E666BC0270_var*
var
 l_Lambda : TtfwWord;
//#UC END# *52E666F6036E_52E666BC0270_var*
begin
//#UC START# *52E666F6036E_52E666BC0270_impl*
 l_Lambda := TwoLabdasClass.Create(f_Lambda, TtfwWord(aLambda));
 try
  inherited DoForEachBack(l_Lambda, aCtx);
 finally
  FreeAndNil(l_Lambda);
 end;//try..finally
//#UC END# *52E666F6036E_52E666BC0270_impl*
end;//TtfwLambdedArrayView.DoForEachBack

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwTwoLambdas
 TtfwTwoLambdas.RegisterClass;
{$IfEnd} //not NoScripts

end.