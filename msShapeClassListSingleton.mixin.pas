{$IfNDef TmsShapeClassListSingleton_uses_intf}

// interface

{$Define TmsShapeClassListSingleton_uses_intf}

// uses
 msShapeClassList,
 msShape,
 Generics.Collections

{$Else TmsShapeClassListSingleton_uses_intf}

{$IfNDef TmsShapeClassListSingleton_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

 TmsShapeClassListSingleton = class(TmsShapeClassList)
 strict private
  class var f_Instance: TmsShapeClassListSingleton;
  class destructor Fini;
 public
  class function Instance: TmsShapeClassListSingleton;
  class procedure IterateShapes(aLambda: TmsShapeClassLambda);
 end;//TmsShapeClassListSingleton

{$Define TmsShapeClassListSingleton_intf}

{$Else TmsShapeClassListSingleton_intf}

// implementation

{$IfNDef TmsShapeClassListSingleton_uses_impl}

// uses
 System.SysUtils

{$Define TmsShapeClassListSingleton_uses_impl}

{$Else TmsShapeClassListSingleton_uses_impl}

// TmsShapeClassListSingleton

class destructor TmsShapeClassListSingleton.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsShapeClassListSingleton.Instance: TmsShapeClassListSingleton;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create;
 Result := f_Instance;
end;

class procedure TmsShapeClassListSingleton.IterateShapes(aLambda: TmsShapeClassLambda);
var
 l_ShapeClass : RmsShape;
begin
 for l_ShapeClass in Self.Instance do
 begin
   aLambda(l_ShapeClass);
 end;//for l_ShapeClass
end;

{$EndIf TmsShapeClassListSingleton_uses_impl}

{$EndIf TmsShapeClassListSingleton_intf}
{$EndIf TmsShapeClassListSingleton_uses_intf}
