unit RegisteredShapesTest;

interface

uses
  TestFrameWork
  ;

type
  TRegisteredShapesTest = class(TTestCase)
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

procedure TRegisteredShapesTest.ShapesRegistredCount;
var
 l_Result : integer;
begin
 l_Result := 0;
 TmsRegisteredShapes.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   Inc(l_Result);
  end
 );
 CheckTrue(l_Result = 22);
end;

procedure TRegisteredShapesTest.TestFirstShape;
begin
 CheckTrue(TmsRegisteredShapes.Instance.First = TmsLine);
end;

procedure TRegisteredShapesTest.TestIndexOfTmsLine;
begin
 CheckTrue(TmsRegisteredShapes.Instance.IndexOf(TmsLine) = 0);
end;

initialization
 TestFramework.RegisterTest(TRegisteredShapesTest.Suite);
end.



