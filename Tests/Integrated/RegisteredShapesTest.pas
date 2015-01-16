unit RegisteredShapesTest;

interface

uses
  TestFrameWork,
  msLoggedTest,
  msShapeClassList,
  msRegisteredShapesTestPrim
  ;

type
  TRegisteredShapesTest = class(TmsRegisteredShapesTestPrim)
   protected
    function ShapeClassList: TmsShapeClassList; override;
  end;//TRegisteredShapesTest

implementation

uses
  SysUtils,
  msRegisteredShapes,
  msShape,
  msLine,
  FMX.Objects,
  FMX.Graphics,
  msCoreObjects
  ;

// TRegisteredShapesTest

function TRegisteredShapesTest.ShapeClassList: TmsShapeClassList;
begin
 Result := TmsRegisteredShapes.Instance;
end;

initialization
 TestFramework.RegisterTest(TRegisteredShapesTest.Suite);

end.



