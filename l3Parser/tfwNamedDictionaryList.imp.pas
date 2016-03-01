{$IfNDef tfwNamedDictionaryList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwNamedDictionaryList.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::tfwNamedDictionaryList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwNamedDictionaryList_imp}
{$If not defined(NoScripts)}
 _tfwNamedDictionaryList_ = {abstract mixin} class(_tfwNamedDictionaryList_Parent_)
 public
 // public methods
   procedure Insert(anIndex: Integer;
     const anItem: _ItemType_);
   procedure Add(const anItem: _ItemType_);
   function FindDictionary(const aFileName: Il3CString): _ItemType_; virtual;
   procedure Remove(const anItem: _ItemType_); virtual;
   procedure RemoveUsersOf(anItem: TtfwDictionaryExPrim);
   procedure CollectNotValidTo(anOther: _tfwNamedDictionaryList_);
   procedure RemoveElementsOf(aList: _tfwNamedDictionaryList_);
   procedure RemoveNotValid;
 end;//_tfwNamedDictionaryList_
{$Else}

 _tfwNamedDictionaryList_ = _tfwNamedDictionaryList_Parent_;

{$IfEnd} //not NoScripts

{$Else tfwNamedDictionaryList_imp}

{$If not defined(NoScripts)}

// start class _tfwNamedDictionaryList_

procedure _tfwNamedDictionaryList_.Insert(anIndex: Integer;
  const anItem: _ItemType_);
//#UC START# *55A3DF6602FC_55A63C1701BE_var*
//#UC END# *55A3DF6602FC_55A63C1701BE_var*
begin
//#UC START# *55A3DF6602FC_55A63C1701BE_impl*
 Assert(FindDictionary(anItem.FileName) = nil);
 inherited Insert(anIndex, anItem);
//#UC END# *55A3DF6602FC_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.Insert

procedure _tfwNamedDictionaryList_.Add(const anItem: _ItemType_);
//#UC START# *55A3DF510076_55A63C1701BE_var*
//#UC END# *55A3DF510076_55A63C1701BE_var*
begin
//#UC START# *55A3DF510076_55A63C1701BE_impl*
 Assert(FindDictionary(anItem.FileName) = nil);
 inherited Add(anItem);
//#UC END# *55A3DF510076_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.Add

function _tfwNamedDictionaryList_.FindDictionary(const aFileName: Il3CString): _ItemType_;
//#UC START# *559E857A037A_55A63C1701BE_var*
var
 l_Index : Integer;
 l_D : _ItemType_;
//#UC END# *559E857A037A_55A63C1701BE_var*
begin
//#UC START# *559E857A037A_55A63C1701BE_impl*
 Result := nil;
 for l_Index := 0 to Pred(Count) do
 begin
  l_D := Items[l_Index];
  if l3Same(l_D.FileName, aFileName, true) then
  begin
   Result := l_D;
   Exit;
  end;//l3Same(l_D.FileName, aFileName, true)
 end;//for l_Index
//#UC END# *559E857A037A_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.FindDictionary

procedure _tfwNamedDictionaryList_.Remove(const anItem: _ItemType_);
//#UC START# *55A663000019_55A63C1701BE_var*
var
 l_Item : _ItemType_;
//#UC END# *55A663000019_55A63C1701BE_var*
begin
//#UC START# *55A663000019_55A63C1701BE_impl*
 l_Item := anItem.Use;
 try
  inherited Remove(anItem);
  RemoveUsersOf(anItem);
 finally
  FreeAndNil(l_Item);
 end;//try..finally
//#UC END# *55A663000019_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.Remove

procedure _tfwNamedDictionaryList_.RemoveUsersOf(anItem: TtfwDictionaryExPrim);
//#UC START# *55A66DCF00D9_55A63C1701BE_var*
var
 l_Index : Integer;
 l_D : _ItemType_;
//#UC END# *55A66DCF00D9_55A63C1701BE_var*
begin
//#UC START# *55A66DCF00D9_55A63C1701BE_impl*
 l_Index := 0;
 while (l_Index < Count) do
 begin
  l_D := Items[l_Index];
  if l_D.UsesDictionary(anItem) then
   Remove(l_D)
  else
   Inc(l_Index);
 end;//l_Index < Count
//#UC END# *55A66DCF00D9_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.RemoveUsersOf

procedure _tfwNamedDictionaryList_.CollectNotValidTo(anOther: _tfwNamedDictionaryList_);
//#UC START# *55AE379002EB_55A63C1701BE_var*
var
 l_Index : Integer;
 l_D     : _ItemType_;
//#UC END# *55AE379002EB_55A63C1701BE_var*
begin
//#UC START# *55AE379002EB_55A63C1701BE_impl*
 for l_Index := 0 to Pred(Count) do
 begin
  l_D := Items[l_Index];
  if not l_D.IsValidCode then
   anOther.Add(l_D);
 end;//for l_Index
//#UC END# *55AE379002EB_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.CollectNotValidTo

procedure _tfwNamedDictionaryList_.RemoveElementsOf(aList: _tfwNamedDictionaryList_);
//#UC START# *55AFA4930133_55A63C1701BE_var*
var
 l_Index : Integer;
 l_D     : _ItemType_;
//#UC END# *55AFA4930133_55A63C1701BE_var*
begin
//#UC START# *55AFA4930133_55A63C1701BE_impl*
 for l_Index := 0 to Pred(aList.Count) do
 begin
  l_D := aList.Items[l_Index];
  Self.Remove(l_D);
 end;//for l_Index
//#UC END# *55AFA4930133_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.RemoveElementsOf

procedure _tfwNamedDictionaryList_.RemoveNotValid;
//#UC START# *55AFAA59009E_55A63C1701BE_var*
var
 l_NotValid : _tfwNamedDictionaryList_;
//#UC END# *55AFAA59009E_55A63C1701BE_var*
begin
//#UC START# *55AFAA59009E_55A63C1701BE_impl*
 l_NotValid := _Instance_R_.Create;
 try
  Self.CollectNotValidTo(l_NotValid);
  Self.RemoveElementsOf(l_NotValid);
 finally
  FreeAndNil(l_NotValid);
 end;//try..finally
//#UC END# *55AFAA59009E_55A63C1701BE_impl*
end;//_tfwNamedDictionaryList_.RemoveNotValid

{$IfEnd} //not NoScripts

{$EndIf tfwNamedDictionaryList_imp}
