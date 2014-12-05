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
 strict private
  [JSONMarshalled(True)]
  f_Items : TmsItemsList;
 end;//TmsItemsHolder

{$Else TmsItemsHolder_intf}

// implementation

{$IfNDef TmsItemsHolder_uses_impl}

// uses

{$Define TmsItemsHolder_uses_impl}

{$Else TmsItemsHolder_uses_impl}

// TmsTemplate

{$EndIf TmsItemsHolder_uses_impl}

{$EndIf TmsItemsHolder_intf}
{$EndIf TmsItemsHolder_uses_intf}
