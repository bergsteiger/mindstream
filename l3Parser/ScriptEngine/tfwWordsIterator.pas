unit tfwWordsIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwWordsIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwWordsIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordRefList,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwWordsIterator = class(TtfwIteratableParent, ItfwValueList)
 private
 // private fields
   f_Words : TtfwWordRefList;
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
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aWords: TtfwWordRefList); reintroduce;
   class function Make(aWords: TtfwWordRefList): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwWordsIterator.Make }
 end;//TtfwWordsIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwWordsIterator

constructor TtfwWordsIterator.Create(aWords: TtfwWordRefList);
//#UC START# *55ED4DC20358_55ED4D040017_var*
//#UC END# *55ED4DC20358_55ED4D040017_var*
begin
//#UC START# *55ED4DC20358_55ED4D040017_impl*
 inherited Create;
 //f_Words := aWords;
 aWords.SetRefTo(f_Words);
//#UC END# *55ED4DC20358_55ED4D040017_impl*
end;//TtfwWordsIterator.Create

class function TtfwWordsIterator.Make(aWords: TtfwWordRefList): ItfwValueList;
var
 l_Inst : TtfwWordsIterator;
begin
 l_Inst := Create(aWords);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TtfwWordsIterator.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_55ED4D040017_var*
var
 l_I : Integer;
//#UC END# *52E23B7A00EC_55ED4D040017_var*
begin
//#UC START# *52E23B7A00EC_55ED4D040017_impl*
 if (f_Words <> nil) then
 begin
  for l_I := 0 to Pred(f_Words.Count) do
  begin
   aCtx.rEngine.Push(TtfwStackValue_C(f_Words.ItemSlot(l_I)^));
   try
    aLambda.DoIt(aCtx);
   except
    on EtfwBreakIterator do
     break;
    on EtfwBreak do
     break;
    on EtfwContinue do
     continue;
   end;//try..except
  end;//for l_I
 end;//f_Words <> nil
//#UC END# *52E23B7A00EC_55ED4D040017_impl*
end;//TtfwWordsIterator.ForEach

procedure TtfwWordsIterator.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_55ED4D040017_var*
var
 l_I : Integer;
//#UC END# *52E23BB102FA_55ED4D040017_var*
begin
//#UC START# *52E23BB102FA_55ED4D040017_impl*
 if (f_Words <> nil) then
 begin
  for l_I := Pred(f_Words.Count) downto 0 do
  begin
   aCtx.rEngine.Push(TtfwStackValue_C(f_Words.ItemSlot(l_I)^));
   try
    aLambda.DoIt(aCtx);
   except
    on EtfwBreakIterator do
     break;
    on EtfwBreak do
     break;
    on EtfwContinue do
     continue;
   end;//try..except
  end;//for l_I
 end;//f_Words <> nil
//#UC END# *52E23BB102FA_55ED4D040017_impl*
end;//TtfwWordsIterator.ForEachBack

procedure TtfwWordsIterator.SetItem(anIndex: Integer;
  const aValue: TtfwStackValue);
//#UC START# *55CDF40C03D4_55ED4D040017_var*
//#UC END# *55CDF40C03D4_55ED4D040017_var*
begin
//#UC START# *55CDF40C03D4_55ED4D040017_impl*
 EtfwCheck.Fail('Массив неизменяемый');
//#UC END# *55CDF40C03D4_55ED4D040017_impl*
end;//TtfwWordsIterator.SetItem

function TtfwWordsIterator.ItemsCountInSlice: Integer;
//#UC START# *55E849210175_55ED4D040017_var*
//#UC END# *55E849210175_55ED4D040017_var*
begin
//#UC START# *55E849210175_55ED4D040017_impl*
 Result := 1;
//#UC END# *55E849210175_55ED4D040017_impl*
end;//TtfwWordsIterator.ItemsCountInSlice

procedure TtfwWordsIterator.Cleanup;
//#UC START# *479731C50290_55ED4D040017_var*
//#UC END# *479731C50290_55ED4D040017_var*
begin
//#UC START# *479731C50290_55ED4D040017_impl*
 FreeAndNil(f_Words);
 //f_Words := nil;
 inherited;
//#UC END# *479731C50290_55ED4D040017_impl*
end;//TtfwWordsIterator.Cleanup

{$IfEnd} //not NoScripts

end.