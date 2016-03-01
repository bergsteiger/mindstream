unit tfwJoinIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwJoinIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwJoinIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwJoinIterator = class(TtfwIteratableParent, ItfwValueList)
 private
 // private fields
   f_Left : ItfwValueList;
   f_Right : ItfwValueList;
 protected
 // realized methods
   procedure SetItem(anIndex: Integer;
     const aValue: TtfwStackValue);
   function ItemsCountInSlice: Integer;
 public
 // realized methods
   procedure ForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
   procedure ForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(const aLeft: ItfwValueList;
     const aRight: ItfwValueList); reintroduce;
   class function Make(const aLeft: ItfwValueList;
     const aRight: ItfwValueList): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwJoinIterator.Make }
 end;//TtfwJoinIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwJoinIterator

constructor TtfwJoinIterator.Create(const aLeft: ItfwValueList;
  const aRight: ItfwValueList);
//#UC START# *55E02B8D02E1_55E02B5D0129_var*
//#UC END# *55E02B8D02E1_55E02B5D0129_var*
begin
//#UC START# *55E02B8D02E1_55E02B5D0129_impl*
 inherited Create;
 f_Left := aLeft;
 f_Right := aRight;
//#UC END# *55E02B8D02E1_55E02B5D0129_impl*
end;//TtfwJoinIterator.Create

class function TtfwJoinIterator.Make(const aLeft: ItfwValueList;
  const aRight: ItfwValueList): ItfwValueList;
var
 l_Inst : TtfwJoinIterator;
begin
 l_Inst := Create(aLeft, aRight);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TtfwJoinIterator.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_55E02B5D0129_var*
//#UC END# *52E23B7A00EC_55E02B5D0129_var*
begin
//#UC START# *52E23B7A00EC_55E02B5D0129_impl*
 f_Left.ForEach(aLambda, aCtx);
 f_Right.ForEach(aLambda, aCtx);
//#UC END# *52E23B7A00EC_55E02B5D0129_impl*
end;//TtfwJoinIterator.ForEach

procedure TtfwJoinIterator.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_55E02B5D0129_var*
//#UC END# *52E23BB102FA_55E02B5D0129_var*
begin
//#UC START# *52E23BB102FA_55E02B5D0129_impl*
 f_Right.ForEachBack(aLambda, aCtx);
 f_Left.ForEachBack(aLambda, aCtx);
//#UC END# *52E23BB102FA_55E02B5D0129_impl*
end;//TtfwJoinIterator.ForEachBack

procedure TtfwJoinIterator.SetItem(anIndex: Integer;
  const aValue: TtfwStackValue);
//#UC START# *55CDF40C03D4_55E02B5D0129_var*
//#UC END# *55CDF40C03D4_55E02B5D0129_var*
begin
//#UC START# *55CDF40C03D4_55E02B5D0129_impl*
 EtfwCheck.Fail('Массив неизменяемый');
//#UC END# *55CDF40C03D4_55E02B5D0129_impl*
end;//TtfwJoinIterator.SetItem

function TtfwJoinIterator.ItemsCountInSlice: Integer;
//#UC START# *55E849210175_55E02B5D0129_var*
//#UC END# *55E849210175_55E02B5D0129_var*
begin
//#UC START# *55E849210175_55E02B5D0129_impl*
 Result := 1;
//#UC END# *55E849210175_55E02B5D0129_impl*
end;//TtfwJoinIterator.ItemsCountInSlice

procedure TtfwJoinIterator.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_Left := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwJoinIterator.ClearFields

{$IfEnd} //not NoScripts

end.