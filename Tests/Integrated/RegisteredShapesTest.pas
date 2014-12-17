unit RegisteredShapesTest;

interface

uses
  TestFrameWork
  ;

type
  TRegisteredShapesTest = class(TTestCase)
   published
    procedure ShapesRegistredCountEqual_12;
    procedure TestFirstShape;
    procedure TestIndexOfTmsLine;
  end;//TRegisteredShapesTest

implementation

uses
  SysUtils,
  msShapesForToolbar,
  msRegisteredShapes,
  msShape,
  msLine,
  FMX.Objects,
  FMX.Graphics
  ;

procedure TRegisteredShapesTest.ShapesRegistredCountEqual_12;
var
 l_Result : integer;
begin
 l_Result := 0;
 TmsShapesForToolbar.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   Assert(aShapeClass.IsForToolbar);
   inc(l_Result);
  end
 );
 CheckTrue(l_Result = 14);
end;

procedure TRegisteredShapesTest.TestFirstShape;
begin
 CheckTrue(TmsRegisteredShapes.Instance.First = TmsLine);
 CheckTrue(TmsShapesForToolbar.Instance.First = TmsLine);
end;

procedure TRegisteredShapesTest.TestIndexOfTmsLine;
begin
 CheckTrue(TmsRegisteredShapes.Instance.IndexOf(TmsLine) = 0);
 CheckTrue(TmsShapesForToolbar.Instance.IndexOf(TmsLine) = 0);
end;

initialization
 TestFramework.RegisterTest(TRegisteredShapesTest.Suite);
end.



