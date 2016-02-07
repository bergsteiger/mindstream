{$IfNDef l3DictionaryPrim_imp}
 
{$Define l3DictionaryPrim_imp}
 _l3DictionaryPrimPrim_Parent_ = _l3DictionaryPrim_Parent_;
 {$Include ..\L3\l3DictionaryPrimPrim.imp.pas}
 _l3DictionaryPrim_ = {abstract mixin} class(_l3DictionaryPrimPrim_)
 private
 // private fields
   f_IDIndex : _IDIndexType_;
 protected
 // property methods
   function pm_GetDRByID(anID: Integer): _StringType_; virtual;
 protected
 // overridden protected methods
   procedure Release; override;
   procedure InitFields; override;
   procedure DirectInsert(anIndex: Integer;
    const aData: _ItemType_); override;
     {* Непосредственное удаление элемента. Без проверки валидности индекса. }
   {$If not defined(l3Items_NoSort)}
   function DoFindInsertionPlace(const aFindData: _ItemType_;
    out theIndex: Integer): Boolean; override;
     {* Ищет ПОСЛЕДНЕЕ вхождение элемента в список. Если не находит - возвращает место предполагаемой вставки. }
   {$IfEnd} //not l3Items_NoSort
   {$If defined(l3Items_NeedsBeforeFreeItem)}
   procedure BeforeFreeItem(var aPlace: _ItemType_); override;
     {* Нотификация потомкам об освобождении элемента списка }
   {$IfEnd} //l3Items_NeedsBeforeFreeItem
 public
 // overridden public methods
   procedure Clear; override;
   procedure Sort; override;
     {* сортирует хранилище. }
 protected
 // protected methods
   function ControlFindByID: Boolean; virtual;
 public
 // public properties
   property DRByID[anID: Integer]: _StringType_
     read pm_GetDRByID;
     {* Элемент по идентификатору }
 end;//_l3DictionaryPrim_

{$Else l3DictionaryPrim_imp}


{$Include ..\L3\l3DictionaryPrimPrim.imp.pas}

type
  THackIndex = class(_IDIndexType_)
   {* Хак }
  end;//THackIndex

// start class _l3DictionaryPrim_

function _l3DictionaryPrim_.pm_GetDRByID(anID: Integer): _StringType_;
//#UC START# *4B8BBA220048_4B8BB87A0089get_var*
var
 i : Integer;
//#UC END# *4B8BBA220048_4B8BB87A0089get_var*
begin
//#UC START# *4B8BBA220048_4B8BB87A0089get_impl*
 with f_IDIndex do
  if FindData(anID, i, SortIndex) then
   Result := Items[i]
  else
   Result := Self.Default;
//#UC END# *4B8BBA220048_4B8BB87A0089get_impl*
end;//_l3DictionaryPrim_.pm_GetDRByID

function _l3DictionaryPrim_.ControlFindByID: Boolean;
//#UC START# *4B8BBAA800AB_4B8BB87A0089_var*
//#UC END# *4B8BBAA800AB_4B8BB87A0089_var*
begin
//#UC START# *4B8BBAA800AB_4B8BB87A0089_impl*
 Result := false;
//#UC END# *4B8BBAA800AB_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.ControlFindByID

procedure _l3DictionaryPrim_.Release;
//#UC START# *479F2AFB0397_4B8BB87A0089_var*
//#UC END# *479F2AFB0397_4B8BB87A0089_var*
begin
//#UC START# *479F2AFB0397_4B8BB87A0089_impl*
 FreeAndNil(f_IDIndex);
 inherited;
//#UC END# *479F2AFB0397_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.Release

procedure _l3DictionaryPrim_.InitFields;
//#UC START# *47A042E100E2_4B8BB87A0089_var*
//#UC END# *47A042E100E2_4B8BB87A0089_var*
begin
//#UC START# *47A042E100E2_4B8BB87A0089_impl*
 inherited;
 f_IDIndex := _IDIndexType_.MakeSorted;
//#UC END# *47A042E100E2_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.InitFields

procedure _l3DictionaryPrim_.Clear;
//#UC START# *47B1C16D0188_4B8BB87A0089_var*
//#UC END# *47B1C16D0188_4B8BB87A0089_var*
begin
//#UC START# *47B1C16D0188_4B8BB87A0089_impl*
 if (f_IDIndex <> nil) then
  f_IDIndex.Clear;
 inherited;
//#UC END# *47B1C16D0188_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.Clear

procedure _l3DictionaryPrim_.DirectInsert(anIndex: Integer;
  const aData: _ItemType_);
//#UC START# *47B49EC50034_4B8BB87A0089_var*
//#UC END# *47B49EC50034_4B8BB87A0089_var*
begin
//#UC START# *47B49EC50034_4B8BB87A0089_impl*
 inherited;
 f_IDIndex.Add(aData);
//#UC END# *47B49EC50034_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.DirectInsert

procedure _l3DictionaryPrim_.Sort;
//#UC START# *47B5AE6B0294_4B8BB87A0089_var*
//#UC END# *47B5AE6B0294_4B8BB87A0089_var*
begin
//#UC START# *47B5AE6B0294_4B8BB87A0089_impl*
 inherited;
 if (f_IDIndex <> nil) then
  f_IDIndex.Sort;
//#UC END# *47B5AE6B0294_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.Sort

{$If not defined(l3Items_NoSort)}
function _l3DictionaryPrim_.DoFindInsertionPlace(const aFindData: _ItemType_;
  out theIndex: Integer): Boolean;
//#UC START# *47B98F7E03A7_4B8BB87A0089_var*
var
 l_Index : Integer;
//#UC END# *47B98F7E03A7_4B8BB87A0089_var*
begin
//#UC START# *47B98F7E03A7_4B8BB87A0089_impl*
 Result := inherited DoFindInsertionPlace(aFindData, theIndex);
 if {not Result AND }ControlFindByID then
 begin
  if (f_IDIndex <> nil) then
   with f_IDIndex do
   begin
    if (Count > 0) then
    begin
     if THackIndex(f_IDIndex).DoFindInsertionPlace(aFindData, l_Index) then
     begin
      l_Index := Self.IndexOf(Items[l_Index]);
      if (l_Index >= 0) then
      begin
       theIndex := l_Index;
       Result := true;
      end;//l_Index >= 0
     end;//DoFindInsertionPlace..l_Index
    end;//Count > 0
   end;//f_IDIndex
 end;//not Result
//#UC END# *47B98F7E03A7_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.DoFindInsertionPlace
{$IfEnd} //not l3Items_NoSort

{$If defined(l3Items_NeedsBeforeFreeItem)}
procedure _l3DictionaryPrim_.BeforeFreeItem(var aPlace: _ItemType_);
//#UC START# *4B87FCF8038B_4B8BB87A0089_var*
//#UC END# *4B87FCF8038B_4B8BB87A0089_var*
begin
//#UC START# *4B87FCF8038B_4B8BB87A0089_impl*
 if (f_IDIndex <> nil) then
  f_IDIndex.Remove(aPlace);
 inherited;
//#UC END# *4B87FCF8038B_4B8BB87A0089_impl*
end;//_l3DictionaryPrim_.BeforeFreeItem
{$IfEnd} //l3Items_NeedsBeforeFreeItem

{$EndIf l3DictionaryPrim_imp}
