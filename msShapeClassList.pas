unit msShapeClassList;

interface

uses
 msInterfaces,
 msShape,
 Generics.Collections,
 msObject
 ;

type
 MCmsShape = {ImsShapeClass}RmsShape;
 TmsShapeClassListItems = TList<MCmsShape>;

 TmsShapeClassLambda = reference to procedure (const aShapeClass : MCmsShape);

 TmsShapeClassList = class(TmsObject)
 strict protected
  f_Registered : TmsShapeClassListItems;
  constructor Create;
 strict private
  function pm_GetItems: TmsShapeClassListItems;
 public
  function First: MCmsShape;
  procedure Register(const aValue: RmsShape); overload; virtual;
  procedure Register(const aShapes: array of RmsShape); overload;
  procedure Cleanup; override;
  function GetEnumerator: TmsShapeClassListItems.TEnumerator;
  function IndexOf(const aValue: RmsShape): Integer;
  procedure IterateShapes(aLambda: TmsShapeClassLambda);
  property Items: TmsShapeClassListItems
   read pm_GetItems;
 end;//TmsShapeClassList

implementation

uses
 SysUtils
 ;

// TmsShapeClassList

constructor TmsShapeClassList.Create;
begin
 inherited;
 f_Registered := TmsShapeClassListItems.Create;
end;

function TmsShapeClassList.pm_GetItems: TmsShapeClassListItems;
begin
 Result := f_Registered;
end;

function TmsShapeClassList.First: MCmsShape;
begin
 Result := f_Registered.First;
end;

function TmsShapeClassList.GetEnumerator: TmsShapeClassListItems.TEnumerator;
begin
 Result := f_Registered.GetEnumerator;
end;

procedure TmsShapeClassList.Cleanup;
begin
 FreeAndNil(f_Registered);
 inherited;
end;

procedure TmsShapeClassList.Register(const aValue: RmsShape);
begin
 Assert(IndexOf(aValue) < 0);
 f_Registered.Add(aValue);
end;

procedure TmsShapeClassList.Register(const aShapes: array of RmsShape);
var
 l_Index : Integer;
begin
 for l_Index := Low(aShapes) to High(aShapes) do
  Self.Register(aShapes[l_Index]);
end;

function TmsShapeClassList.IndexOf(const aValue : RmsShape): Integer;
begin
 Result := f_Registered.IndexOf(aValue);
end;

procedure TmsShapeClassList.IterateShapes(aLambda: TmsShapeClassLambda);
var
 l_ShapeClass : MCmsShape;
begin
 for l_ShapeClass in Self do
 begin
  aLambda(l_ShapeClass);
 end;//for l_ShapeClass
end;

end.
