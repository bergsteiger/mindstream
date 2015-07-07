unit tfwCodeIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwCodeIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::TtfwCodeIterator
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
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCodeIterator = class(TtfwIteratableParent, ItfwValueList)
 private
 // private fields
   f_Code : TtfwWordRefList;
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
   constructor Create(aCode: TtfwWordRefList); reintroduce;
   class function Make(aCode: TtfwWordRefList): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwCodeIterator.Make }
 end;//TtfwCodeIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwCodeIterator

constructor TtfwCodeIterator.Create(aCode: TtfwWordRefList);
//#UC START# *52E7D6F00293_52E7D66E02FF_var*
//#UC END# *52E7D6F00293_52E7D66E02FF_var*
begin
//#UC START# *52E7D6F00293_52E7D66E02FF_impl*
 inherited Create;
 aCode.SetRefTo(f_Code);
//#UC END# *52E7D6F00293_52E7D66E02FF_impl*
end;//TtfwCodeIterator.Create

class function TtfwCodeIterator.Make(aCode: TtfwWordRefList): ItfwValueList;
var
 l_Inst : TtfwCodeIterator;
begin
 l_Inst := Create(aCode);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TtfwCodeIterator.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_52E7D66E02FF_var*
var
 l_I : Integer;
 l_K : TtfwWord;
//#UC END# *52E23B7A00EC_52E7D66E02FF_var*
begin
//#UC START# *52E23B7A00EC_52E7D66E02FF_impl*
 if (f_Code <> nil) then
 begin
  for l_I := 0 to Pred(f_Code.Count) do
  begin
   l_K := f_Code.Items[l_I];
   if (l_K <> nil) then
   begin
    aCtx.rEngine.Push(TtfwStackValue_C(l_K));
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
   end;//l_K <> nil..
  end;//for l_I
 end;//f_Code <> nil
//#UC END# *52E23B7A00EC_52E7D66E02FF_impl*
end;//TtfwCodeIterator.ForEach

procedure TtfwCodeIterator.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_52E7D66E02FF_var*
var
 l_I : Integer;
 l_K : TtfwWord;
//#UC END# *52E23BB102FA_52E7D66E02FF_var*
begin
//#UC START# *52E23BB102FA_52E7D66E02FF_impl*
 if (f_Code <> nil) then
 begin
  for l_I := Pred(f_Code.Count) downto 0 do
  begin
   l_K := f_Code.Items[l_I];
   if (l_K <> nil) then
   begin
    aCtx.rEngine.Push(TtfwStackValue_C(l_K));
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
   end;//l_K <> nil..
  end;//for l_I
 end;//f_Code <> nil
//#UC END# *52E23BB102FA_52E7D66E02FF_impl*
end;//TtfwCodeIterator.ForEachBack

procedure TtfwCodeIterator.Cleanup;
//#UC START# *479731C50290_52E7D66E02FF_var*
//#UC END# *479731C50290_52E7D66E02FF_var*
begin
//#UC START# *479731C50290_52E7D66E02FF_impl*
 FreeAndNil(f_Code);
 inherited;
//#UC END# *479731C50290_52E7D66E02FF_impl*
end;//TtfwCodeIterator.Cleanup

{$IfEnd} //not NoScripts

end.