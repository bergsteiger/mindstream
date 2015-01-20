{$IfNDef TmsShapeClassListSingleton_uses_intf}

// interface

{$Define TmsShapeClassListSingleton_uses_intf}

// uses
 msShape,
 Generics.Collections

{$Else TmsShapeClassListSingleton_uses_intf}

{$IfNDef TmsShapeClassListSingleton_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

 RmsShapeList = TList<RmsShape>;

 TmsShapeClassLambda = reference to procedure (aShapeClass : RmsShape);

 TmsShapeClassListSingleton = class
 strict private
  f_Registered : RmsShapeList;
  class var f_Instance: TmsShapeClassListSingleton;
  constructor Create;
  class destructor Fini;
  function pm_GetItems: RmsShapeList;
 public
  class function Instance: TmsShapeClassListSingleton;
  function First: RmsShape;
  procedure Register(const aValue: RmsShape); overload; virtual;
  procedure Register(const aShapes: array of RmsShape); overload;
  destructor Destroy; override;
  function GetEnumerator: RmsShapeList.TEnumerator;
  function IndexOf(const aValue: RmsShape): Integer;
  class procedure IterateShapes(aLambda: TmsShapeClassLambda);
  property Items: RmsShapeList
   read pm_GetItems;
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

function TmsShapeClassListSingleton.First: RmsShape;
begin
 Result := f_Registered.First;
end;

function TmsShapeClassListSingleton.GetEnumerator: RmsShapeList.TEnumerator;
begin
 Result := f_Registered.GetEnumerator;
end;

class destructor TmsShapeClassListSingleton.Fini;
begin
 FreeAndNil(f_Instance);
end;

function TmsShapeClassListSingleton.pm_GetItems: RmsShapeList;
begin
 Result := f_Registered;
end;

destructor TmsShapeClassListSingleton.Destroy;
begin
 FreeAndNil(f_Registered);
 inherited;
end;

procedure TmsShapeClassListSingleton.Register(const aValue: RmsShape);
begin
 Assert(f_Registered.IndexOf(aValue) < 0);
 f_Registered.Add(aValue);
end;

procedure TmsShapeClassListSingleton.Register(const aShapes: array of RmsShape);
var
 l_Index : Integer;
begin
 for l_Index := Low(aShapes) to High(aShapes) do
  Self.Register(aShapes[l_Index]);
end;

constructor TmsShapeClassListSingleton.Create;
begin
 inherited;
 f_Registered := RmsShapeList.Create;
end;

class function TmsShapeClassListSingleton.Instance: TmsShapeClassListSingleton;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create;
 Result := f_Instance;
end;

function TmsShapeClassListSingleton.IndexOf(const aValue : RmsShape): Integer;
begin
 Result := f_Registered.IndexOf(aValue);
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
