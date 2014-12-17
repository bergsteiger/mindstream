unit ForToolbarShapesTest;

interface

uses
  TestFrameWork
  ;

type
  TForToolbarShapesTest = class(TTestCase)
   published
    procedure ShapesRegistredCount;
    procedure TestFirstShape;
    procedure TestIndexOfTmsLine;
  end;//TForToolbarShapesTest

implementation

uses
  SysUtils,
  msShapesForToolbar,
  msShape,
  msLine,
  FMX.Objects,
  FMX.Graphics
  ;

procedure TForToolbarShapesTest.ShapesRegistredCount;
var
 l_Result : integer;
begin
 l_Result := 0;
 TmsShapesForToolbar.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   Assert(aShapeClass.IsForToolbar);
   Inc(l_Result);
  end
 );
 CheckTrue(l_Result = 15);
end;

procedure TForToolbarShapesTest.TestFirstShape;
begin
 CheckTrue(TmsShapesForToolbar.Instance.First = TmsLine);
end;

procedure TForToolbarShapesTest.TestIndexOfTmsLine;
begin
 CheckTrue(TmsShapesForToolbar.Instance.IndexOf(TmsLine) = 0);
end;

initialization
 TestFramework.RegisterTest(TForToolbarShapesTest.Suite);
end.



