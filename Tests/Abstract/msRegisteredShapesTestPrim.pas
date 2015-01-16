unit msRegisteredShapesTestPrim;

interface

uses
 msLoggedTest,
 msShape,
 msShapeClassList
 ;

type
  TmsRegisteredShapesTestPrim = class abstract(TmsLoggedTest)
   protected
    function ShapeClassList: TmsShapeClassList; virtual; abstract;
    function FileExtension: String; override;
    procedure CheckShapeClass(aShapeClass: RmsShape); virtual;
   published
    procedure ShapesRegistredCount;
    procedure TestFirstShape;
    procedure TestIndexOfTmsLine;
  end;//TmsRegisteredShapesTestPrim

implementation

uses
 SysUtils,
 msCoreObjects,
 msLine
 ;

// TmsRegisteredShapesTestPrim

function TmsRegisteredShapesTestPrim.FileExtension: String;
begin
 Result := '.registered';
end;

procedure TmsRegisteredShapesTestPrim.CheckShapeClass(aShapeClass: RmsShape);
begin
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
     CheckShapeClass(aShapeClass);
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

end.
