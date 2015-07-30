unit tfwMembersIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwMembersIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::TtfwMembersIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwDictionaryPrim,
  tfwIteratableParent,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwMembersIterator = class(TtfwIteratableParent, ItfwValueList)
 private
 // private fields
   f_Dictionary : TtfwDictionaryPrim;
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
   constructor Create(aDictionary: TtfwDictionaryPrim); reintroduce;
   class function Make(aDictionary: TtfwDictionaryPrim): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwMembersIterator.Make }
 end;//TtfwMembersIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwMembersIterator

constructor TtfwMembersIterator.Create(aDictionary: TtfwDictionaryPrim);
//#UC START# *52E29FCF00BC_52E29F1A037E_var*
//#UC END# *52E29FCF00BC_52E29F1A037E_var*
begin
//#UC START# *52E29FCF00BC_52E29F1A037E_impl*
 inherited Create;
 aDictionary.SetRefTo(f_Dictionary);
//#UC END# *52E29FCF00BC_52E29F1A037E_impl*
end;//TtfwMembersIterator.Create

class function TtfwMembersIterator.Make(aDictionary: TtfwDictionaryPrim): ItfwValueList;
var
 l_Inst : TtfwMembersIterator;
begin
 l_Inst := Create(aDictionary);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TtfwMembersIterator.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_52E29F1A037E_var*
var
 l_I : Integer;
 l_K : TtfwKeyWord;
//#UC END# *52E23B7A00EC_52E29F1A037E_var*
begin
//#UC START# *52E23B7A00EC_52E29F1A037E_impl*
 if (f_Dictionary <> nil) then
 begin
  for l_I := 0 to Pred(f_Dictionary.Count) do
  begin
   l_K := f_Dictionary.Items[l_I] As TtfwKeyWord;
   if (l_K <> nil) AND (l_K.Word <> nil) then
   begin
    aCtx.rEngine.Push(TtfwStackValue_C(l_K.Word));
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
 end;//TkwCompiledWord(l_W).LocalDictionary.KeyWords <> nil
//#UC END# *52E23B7A00EC_52E29F1A037E_impl*
end;//TtfwMembersIterator.ForEach

procedure TtfwMembersIterator.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_52E29F1A037E_var*
var
 l_I : Integer;
 l_K : TtfwKeyWord;
//#UC END# *52E23BB102FA_52E29F1A037E_var*
begin
//#UC START# *52E23BB102FA_52E29F1A037E_impl*
 if (f_Dictionary <> nil) then
 begin
  for l_I := Pred(f_Dictionary.Count) downto 0 do
  begin
   l_K := f_Dictionary.Items[l_I] As TtfwKeyWord;
   if (l_K <> nil) AND (l_K.Word <> nil) then
   begin
    aCtx.rEngine.Push(TtfwStackValue_C(l_K.Word));
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
 end;//TkwCompiledWord(l_W).LocalDictionary.KeyWords <> nil
//#UC END# *52E23BB102FA_52E29F1A037E_impl*
end;//TtfwMembersIterator.ForEachBack

procedure TtfwMembersIterator.Cleanup;
//#UC START# *479731C50290_52E29F1A037E_var*
//#UC END# *479731C50290_52E29F1A037E_var*
begin
//#UC START# *479731C50290_52E29F1A037E_impl*
 FreeAndNil(f_Dictionary);
 inherited;
//#UC END# *479731C50290_52E29F1A037E_impl*
end;//TtfwMembersIterator.Cleanup

{$IfEnd} //not NoScripts

end.