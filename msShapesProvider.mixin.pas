{$IfNDef TmsShapesProvider_uses_intf}

// interface

{$Define TmsShapesProvider_uses_intf}

// uses

{$Else TmsShapesProvider_uses_intf}

{$IfNDef TmsShapesProvider_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsShapesProvider_intf}

 TmsShapesProvider = class abstract(TmsShapesProviderParent{, ImsShapesProvider})
 protected
  procedure ShapesForToolbarToList(aList: TStrings);
 end;//TmsShapesProvider

{$Else TmsShapesProvider_intf}

// implementation

{$IfNDef TmsShapesProvider_uses_impl}

// uses

{$Define TmsShapesProvider_uses_impl}

{$Else TmsShapesProvider_uses_impl}

// TmsShapesProvider

procedure TmsShapesProvider.ShapesForToolbarToList(aList: TStrings);
var
 l_Class: MCmsShape;
begin
 aList.Clear;
 for l_Class in TmsShapesForToolbar.Instance do
  aList.AddObject(l_Class.Name, nil{TObject(l_Class)});
end;

{$EndIf TmsShapesProvider_uses_impl}

{$EndIf TmsShapesProvider_intf}
{$EndIf TmsShapesProvider_uses_intf}
