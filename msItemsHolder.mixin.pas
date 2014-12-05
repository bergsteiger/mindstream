{$IfNDef TmsItemsHolder_uses_intf}
// Объект содержащий список других объектов

// interface

{$Define TmsItemsHolder_uses_intf}

// uses
 Data.DBXJSONReflect

{$Else TmsItemsHolder_uses_intf}

{$IfNDef TmsItemsHolder_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsItemsHolder_intf}

 TmsItemsHolder = class(TmsItemsHolderParent)
 private
  [JSONMarshalled(True)]
  f_Items : TmsItemsList;
  function pm_GetItems: TmsItemsList;
  procedure pm_SetItems(aValue: TmsItemsList);
 public
  constructor Create;
  destructor Destroy; override;
  property Items: TmsItemsList read pm_GetItems write pm_SetItems;
  procedure Assign(anOther : TmsItemsHolder);
  class procedure RegisterInMarshal(aMarshal: TJSONMarshal);
 end;//TmsItemsHolder

{$Else TmsItemsHolder_intf}

// implementation

{$IfNDef TmsItemsHolder_uses_impl}

// uses

{$Define TmsItemsHolder_uses_impl}

{$Else TmsItemsHolder_uses_impl}

// TmsItemsHolder

constructor TmsItemsHolder.Create;
begin
 inherited;
 Assert(f_Items = nil);
 f_Items := TmsItemsList.Create;
end;

destructor TmsItemsHolder.Destroy;
begin
 FreeAndNil(f_Items);
 inherited;
end;

function TmsItemsHolder.pm_GetItems: TmsItemsList;
begin
 if (f_Items = nil) then
  f_Items := TmsItemsList.Create;
 Result := f_Items;
end;

procedure TmsItemsHolder.pm_SetItems(aValue: TmsItemsList);
var
 l_Item : TmsItem;
begin
 if (f_Items <> nil) then
  f_Items.Clear;
 if (aValue <> nil) then
  for l_Item in aValue do
  begin
   if (f_Items = nil) then
    f_Items := TmsItemsList.Create;
   f_Items.Add(l_Item);
  end;//for l_Shape in aValue
end;

procedure TmsItemsHolder.Assign(anOther : TmsItemsHolder);
begin
 Self.Items := anOther.Items;
end;

class procedure TmsItemsHolder.RegisterInMarshal(aMarshal: TJSONMarshal);
begin
 aMarshal.RegisterConverter(Self, 'f_Items',
  function (Data: TObject; Field: string): TListOfObjects
  var
   l_Item: TmsItem;
   l_Index: Integer;
  begin
   Assert(Field = 'f_Items');
   SetLength(Result, (Data As TmsItemsHolder).Items.Count);
   l_Index := 0;
   for l_Item in (Data As TmsItemsHolder).Items do
   begin
    Result[l_Index] := l_Item.toObject;
    Inc(l_Index);
   end;//for l_Item
  end
 );//aMarshal.RegisterConverter
end;

{$EndIf TmsItemsHolder_uses_impl}

{$EndIf TmsItemsHolder_intf}
{$EndIf TmsItemsHolder_uses_intf}
