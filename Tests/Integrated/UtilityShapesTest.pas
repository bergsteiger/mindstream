unit UtilityShapesTest;

interface

uses
  TestFrameWork
  ;

type
  TUtilityShapesTest = class(TTestCase)
   published
    procedure ShapesRegistredCount;
    procedure TestFirstShape;
    procedure TestIndexOfTmsLine;
  end;//TUtilityShapesTest

implementation

uses
  SysUtils,
  msUtilityShapes,
  msShape,
  msMover,
  FMX.Objects,
  FMX.Graphics
  ;

procedure TUtilityShapesTest.ShapesRegistredCount;
var
 l_Result : integer;
begin
 l_Result := 0;
 TmsUtilityShapes.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   Assert(aShapeClass.IsForToolbar);
   Inc(l_Result);
  end
 );
 CheckTrue(l_Result = 3);
end;

procedure TUtilityShapesTest.TestFirstShape;
begin
 CheckTrue(TmsUtilityShapes.Instance.First = TmsMover);
end;

procedure TUtilityShapesTest.TestIndexOfTmsLine;
begin
 CheckTrue(TmsUtilityShapes.Instance.IndexOf(TmsMover) = 0);
end;

initialization
 TestFramework.RegisterTest(TUtilityShapesTest.Suite);
end.



