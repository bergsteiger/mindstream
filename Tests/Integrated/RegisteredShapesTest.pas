unit RegisteredShapesTest;

interface

uses
  TestFrameWork,
  msLoggedTest,
  msShapeClassList
  ;

type
  TmsRegisteredShapesTestPrim = class abstract(TmsLoggedTest)
   protected
    function ShapeClassList: TmsShapeClassList; virtual; abstract;
    function FileExtension: String; override;
  end;//TmsRegisteredShapesTestPrim

  TRegisteredShapesTest = class(TmsRegisteredShapesTestPrim)
   protected
    function ShapeClassList: TmsShapeClassList; override;
   published
    procedure ShapesRegistredCount;
    procedure TestFirstShape;
    procedure TestIndexOfTmsLine;
  end;//TRegisteredShapesTest

implementation

uses
  SysUtils,
  msRegisteredShapes,
  msShape,
  msLine,
  FMX.Objects,
  FMX.Graphics
  ;

// TmsRegisteredShapesTestPrim

function TmsRegisteredShapesTestPrim.FileExtension: String;
begin
 Result := '.registered';
end;

// TRegisteredShapesTest

function TRegisteredShapesTest.ShapeClassList: TmsShapeClassList;
begin
 Result := TmsRegisteredShapes.Instance;
end;

procedure TRegisteredShapesTest.ShapesRegistredCount;
var
 l_Result : integer;
begin
 l_Result := 0;
 ShapeClassList.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   Inc(l_Result);
  end
 );
 CheckTrue(l_Result = 23,  ' Expected 23 - Get ' + IntToStr(l_Result));
end;

procedure TRegisteredShapesTest.TestFirstShape;
begin
 CheckTrue(ShapeClassList.First = TmsLine);
end;

procedure TRegisteredShapesTest.TestIndexOfTmsLine;
begin
 CheckTrue(ShapeClassList.IndexOf(TmsLine) = 0);
end;

initialization
 TestFramework.RegisterTest(TRegisteredShapesTest.Suite);
end.



