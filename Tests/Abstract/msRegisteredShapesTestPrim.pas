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
    procedure CheckShapeClass(const aShapeClass: MCmsShape); virtual;
   published
    procedure ShapesRegistredCount;
    procedure TestShapes;
    procedure TestIndexOfTmsLine;
  end;//TmsRegisteredShapesTestPrim

implementation

uses
 SysUtils,
 FMX.DUnit.msLog,
 msLine,
 System.TypInfo,
 msInterfaces
 ;

// TmsRegisteredShapesTestPrim

function TmsRegisteredShapesTestPrim.FileExtension: String;
begin
 Result := '.registered';
end;

procedure TmsRegisteredShapesTestPrim.CheckShapeClass(const aShapeClass: MCmsShape);
begin
end;

procedure TmsRegisteredShapesTestPrim.ShapesRegistredCount;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  var
   l_Result : integer;
  begin
   l_Result := 0;
   ShapeClassList.IterateShapes(
    procedure (const aShapeClass: MCmsShape)
    begin
     CheckShapeClass(aShapeClass);
     Inc(l_Result);
    end
   );
   aLog.ToLog(IntToStr(l_Result));
  end
 );
end;

procedure TmsRegisteredShapesTestPrim.TestShapes;
begin
 OutToFileAndCheck(procedure (aLog: TmsLog)
  begin
   ShapeClassList.IterateShapes(
    procedure (const aShapeClass: MCmsShape)
    begin
     CheckShapeClass(aShapeClass);
     aLog.ToLog(aShapeClass.Name);
     aLog.ToLog(' InitialWidth = ' + aShapeClass.InitialWidth.ToString);
     aLog.ToLog(' InitialHeight = ' + aShapeClass.InitialHeight.ToString);
     aLog.ToLog(' CornerRadius = ' + aShapeClass.CornerRadius.ToString);
     aLog.ToLog(' IsForToolbar = ' + aShapeClass.IsForToolbar.ToString);
     aLog.ToLog(' StereotypePlace = ' + GetEnumName(TypeInfo(TmsStereotypePlace), Ord(aShapeClass.StereotypePlace)));
     aLog.ToLog(' SVGCode = ' + aShapeClass.SVGCode);
    end
   );
  end
 );
end;

procedure TmsRegisteredShapesTestPrim.TestIndexOfTmsLine;
begin
 OutToFileAndCheck(procedure (aLog: TmsLog)
  begin
   aLog.ToLog(BoolToStr(ShapeClassList.ByName(TmsLine.ClassName) <> nil));
  end
 );
end;

end.
