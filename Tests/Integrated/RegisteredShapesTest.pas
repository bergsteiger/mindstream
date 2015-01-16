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
   published
    procedure ShapesRegistredCount;
    procedure TestFirstShape;
    procedure TestIndexOfTmsLine;
  end;//TmsRegisteredShapesTestPrim

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

// TmsRegisteredShapesTestPrim

function TmsRegisteredShapesTestPrim.FileExtension: String;
begin
 Result := '.registered';
end;

procedure TmsRegisteredShapesTestPrim.ShapesRegistredCount;
begin
 OutToFileAndCheck(procedure (aLog: TmsLog)
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
   aLog.ToLog(IntToStr(l_Result));
  end
 );
end;

procedure TmsRegisteredShapesTestPrim.TestFirstShape;
begin
 OutToFileAndCheck(procedure (aLog: TmsLog)
  begin
   aLog.ToLog(ShapeClassList.First.ClassName);
  end
 );
end;

procedure TmsRegisteredShapesTestPrim.TestIndexOfTmsLine;
begin
 OutToFileAndCheck(procedure (aLog: TmsLog)
  begin
   aLog.ToLog(IntToStr(ShapeClassList.IndexOf(TmsLine)));
  end
 );
end;

// TRegisteredShapesTest

function TRegisteredShapesTest.ShapeClassList: TmsShapeClassList;
begin
 Result := TmsRegisteredShapes.Instance;
end;

initialization
 TestFramework.RegisterTest(TRegisteredShapesTest.Suite);
end.



