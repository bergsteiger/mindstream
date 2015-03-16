unit ForToolbarShapesTest;
{/ - тут "банальные" интеграционные тесты (https: /ru.wikipedia.org/wiki/%D0%98%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B5_%D1%82%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)}

interface

uses
  TestFrameWork,
  msRegisteredShapesTestPrim,
  msShapeClassList,
  msShape
  ;

type
  TForToolbarShapesTest = class(TmsRegisteredShapesTestPrim)
   protected
    function ShapeClassList: TmsShapeClassList; override;
    procedure CheckShapeClass(const aShapeClass: MCmsShape); override;
  end;//TForToolbarShapesTest

implementation

uses
  msShapesForToolbar
  ;

// TForToolbarShapesTest

function TForToolbarShapesTest.ShapeClassList: TmsShapeClassList;
begin
 Result := TmsShapesForToolbar.Instance;
end;

procedure TForToolbarShapesTest.CheckShapeClass(const aShapeClass: MCmsShape);
begin
 inherited;
 //Assert(aShapeClass.IsForToolbar);
end;

initialization
 TestFramework.RegisterTest(TForToolbarShapesTest.Suite);

end.



