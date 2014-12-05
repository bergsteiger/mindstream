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

{$EndIf TmsItemsHolder_uses_impl}

{$EndIf TmsItemsHolder_intf}
{$EndIf TmsItemsHolder_uses_intf}
