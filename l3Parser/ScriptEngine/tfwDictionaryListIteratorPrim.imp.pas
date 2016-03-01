{$IfNDef tfwDictionaryListIteratorPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryListIteratorPrim.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::tfwDictionaryListIteratorPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDictionaryListIteratorPrim_imp}
{$If not defined(NoScripts)}
 _tfwDictionaryListIteratorPrim_ = {abstract mixin} class(_tfwDictionaryListIteratorPrim_Parent_, ItfwValueList)
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
 // protected methods
   function ListToIterate: _ListType_; virtual; abstract;
 end;//_tfwDictionaryListIteratorPrim_
{$Else}

 _tfwDictionaryListIteratorPrim_ = _tfwDictionaryListIteratorPrim_Parent_;

{$IfEnd} //not NoScripts

{$Else tfwDictionaryListIteratorPrim_imp}

{$If not defined(NoScripts)}

// start class _tfwDictionaryListIteratorPrim_

procedure _tfwDictionaryListIteratorPrim_.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_55E9A6C303B7_var*
var
 l_I : Integer;
 l_L : _ListType_;
//#UC END# *52E23B7A00EC_55E9A6C303B7_var*
begin
//#UC START# *52E23B7A00EC_55E9A6C303B7_impl*
 l_L := ListToIterate;
 if (l_L <> nil) then
 begin
  for l_I := 0 to Pred(l_L.Count) do
  begin
    aCtx.rEngine.Push(TtfwStackValue_C(l_L.ItemSlot(l_I)^));
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
 end;//l_L <> nil
//#UC END# *52E23B7A00EC_55E9A6C303B7_impl*
end;//_tfwDictionaryListIteratorPrim_.ForEach

procedure _tfwDictionaryListIteratorPrim_.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_55E9A6C303B7_var*
var
 l_I : Integer;
 l_L : _ListType_;
//#UC END# *52E23BB102FA_55E9A6C303B7_var*
begin
//#UC START# *52E23BB102FA_55E9A6C303B7_impl*
 l_L := ListToIterate;
 if (l_L <> nil) then
 begin
  for l_I := Pred(l_L.Count) downto 0 do
  begin
    aCtx.rEngine.Push(TtfwStackValue_C(l_L.ItemSlot(l_I)^));
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
 end;//l_L <> nil
//#UC END# *52E23BB102FA_55E9A6C303B7_impl*
end;//_tfwDictionaryListIteratorPrim_.ForEachBack

procedure _tfwDictionaryListIteratorPrim_.SetItem(anIndex: Integer;
  const aValue: TtfwStackValue);
//#UC START# *55CDF40C03D4_55E9A6C303B7_var*
//#UC END# *55CDF40C03D4_55E9A6C303B7_var*
begin
//#UC START# *55CDF40C03D4_55E9A6C303B7_impl*
 EtfwCheck.Fail('Массив неизменяемый');
//#UC END# *55CDF40C03D4_55E9A6C303B7_impl*
end;//_tfwDictionaryListIteratorPrim_.SetItem

function _tfwDictionaryListIteratorPrim_.ItemsCountInSlice: Integer;
//#UC START# *55E849210175_55E9A6C303B7_var*
//#UC END# *55E849210175_55E9A6C303B7_var*
begin
//#UC START# *55E849210175_55E9A6C303B7_impl*
 Result := 1;
//#UC END# *55E849210175_55E9A6C303B7_impl*
end;//_tfwDictionaryListIteratorPrim_.ItemsCountInSlice

{$IfEnd} //not NoScripts

{$EndIf tfwDictionaryListIteratorPrim_imp}
