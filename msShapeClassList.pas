unit msShapeClassList;

interface

uses
 msInterfaces,
 msShape,
 Generics.Collections
 ;

type
 RmsShapeList = TList<RmsShape>;

 TmsShapeClassLambda = reference to procedure (aShapeClass : RmsShape);

 TmsShapeClassList = class
 strict protected
  f_Registered : RmsShapeList;
  constructor Create;
 strict private
  function pm_GetItems: RmsShapeList;
 public
  function First: RmsShape;
  procedure Register(const aValue: RmsShape); overload; virtual;
  procedure Register(const aShapes: array of RmsShape); overload;
  destructor Destroy; override;
  function GetEnumerator: RmsShapeList.TEnumerator;
  function IndexOf(const aValue: RmsShape): Integer;
  procedure IterateShapes(aLambda: TmsShapeClassLambda);
  property Items: RmsShapeList
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
 f_Registered := RmsShapeList.Create;
end;

function TmsShapeClassList.pm_GetItems: RmsShapeList;
begin
 Result := f_Registered;
end;

function TmsShapeClassList.First: RmsShape;
begin
 Result := f_Registered.First;
end;

function TmsShapeClassList.GetEnumerator: RmsShapeList.TEnumerator;
begin
 Result := f_Registered.GetEnumerator;
end;

destructor TmsShapeClassList.Destroy;
begin
 FreeAndNil(f_Registered);
 inherited;
end;

procedure TmsShapeClassList.Register(const aValue: RmsShape);
begin
 Assert(f_Registered.IndexOf(aValue) < 0);
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
 l_ShapeClass : RmsShape;
begin
 for l_ShapeClass in Self do
 begin
   aLambda(l_ShapeClass);
 end;//for l_ShapeClass
end;

end.
