unit UtilityShapesTest;
{/ - тут "банальные" интеграционные тесты (https: /ru.wikipedia.org/wiki/%D0%98%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B5_%D1%82%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)}

interface

uses
  TestFrameWork,
  msRegisteredShapesTestPrim,
  msShapeClassList,
  msShape
  ;

type
  TUtilityShapesTest = class(TmsRegisteredShapesTestPrim)
   protected
    function ShapeClassList: TmsShapeClassList; override;
    procedure CheckShapeClass(aShapeClass: RmsShape); override;
  end;//TUtilityShapesTest

implementation

uses
  SysUtils,
  msUtilityShapes,
  msMover,
  FMX.Objects,
  FMX.Graphics
  ;

// TUtilityShapesTest

function TUtilityShapesTest.ShapeClassList: TmsShapeClassList;
begin
 Result := TmsUtilityShapes.Instance;
end;

procedure TUtilityShapesTest.CheckShapeClass(aShapeClass: RmsShape);
begin
 inherited;
 Assert(aShapeClass.IsTool);
end;

initialization
 TestFramework.RegisterTest(TUtilityShapesTest.Suite);

end.



