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
begin
 aList.Clear;
 TmsShapesForToolbar.Instance.IterateShapes(
  procedure (const aShapeClass : MCmsShape)
  begin
   aList.Add(String(aShapeClass.Name));
  end
 );
end;

{$EndIf TmsShapesProvider_uses_impl}

{$EndIf TmsShapesProvider_intf}
{$EndIf TmsShapesProvider_uses_intf}
