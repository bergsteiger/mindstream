unit TestmsSerializeController;

interface

uses
  TestFramework,
  msDiagramm,
  msShape,
  msRegisteredShapes,
  System.Types,
  System.Classes,
  msCoreObjects
  ;

type
  TmsShapeClassCheck = TmsShapeClassLambda;

  TmsDiagrammCheck = reference to procedure (aDiagramm : TmsDiagramm);

  TmsShapeTestContext = record
   rMethodName: string;
   rSeed: Integer;
   rDiagrammName : String;
   rShapesCount : Integer;
   rShapeClass: RmsShape;
   constructor Create(aMethodName: string; aSeed: Integer; aDiagrammName : String; aShapesCount : Integer; aShapeClass: RmsShape);
  end;//TmsShapeTestContext

  TmsShapeTestPrim = class abstract(TTestCase)
  protected
   f_Context : TmsShapeTestContext;
   f_TestSerializeMethodName : String;
   f_Coords : array of TPoint;
  protected
    function TestResultsFileName(aShapeClass: RmsShape): String;
    function MakeFileName(const aTestName: String; aShapeClass: RmsShape): String;
    procedure CreateDiagrammAndCheck(aCheck : TmsDiagrammCheck; const aName: String);
    procedure CheckFileWithEtalon(const aFileName: String);
    procedure SaveDiagramm(const aFileName: String; aDiagramm: TmsDiagramm); virtual;
    procedure SaveDiagrammAndCheck(aShapeClass: RmsShape; aDiagramm: TmsDiagramm);
    procedure OutToFileAndCheck(aLambda: TmsLogLambda);
    function ShapeClass: RmsShape;
    procedure SetUp; override;
    function ShapesCount: Integer;
    procedure CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass: RmsShape);
    function TestSerializeMethodName: String;
    procedure DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck; aShapeClass: RmsShape);
    procedure TestDeSerializeForShapeClass(aShapeClass: RmsShape);
    procedure TestDeSerializeViaShapeCheckForShapeClass(aShapeClass: RmsShape);
  public
    class procedure CheckShapes(aCheck: TmsShapeClassCheck);
    constructor Create(const aContext: TmsShapeTestContext);
  end;//TmsShapeTestPrim

  RmsShapeTest = class of TmsShapeTestPrim;

  TmsCustomShapeTest = class(TmsShapeTestPrim)
  published
    procedure TestSerialize;
  end;//TmsCustomShapeTest

  TmsDiagrammTest = class(TmsCustomShapeTest)
  protected
    procedure SaveDiagramm(const aFileName: String; aDiagramm: TmsDiagramm); override;
  end;//TmsDiagrammTest

  TmsShapeTest = class(TmsCustomShapeTest)
  published
    procedure TestDeSerialize;
    procedure TestDeSerializeViaShapeCheck;
    procedure TestShapeName;
    procedure TestDiagrammName;
  end;//TmsShapeTest

implementation

 uses
  System.SysUtils,
  Winapi.Windows,
  System.Rtti,
  System.TypInfo,
  FMX.Objects,
  msSerializeInterfaces,
  msDiagrammMarshal,
  msStringList
  ;

function TmsShapeTestPrim.MakeFileName(const aTestName: String; aShapeClass: RmsShape): String;
var
 l_Folder : String;
begin
 l_Folder := ExtractFilePath(ParamStr(0)) + 'TestResults\';
 ForceDirectories(l_Folder);
 Result := l_Folder + ClassName + '_' + aTestName + '_' + aShapeClass.ClassName + '.json';
end;

procedure TmsShapeTestPrim.CheckFileWithEtalon(const aFileName: String);
var
 l_FileSerialized, l_FileEtalon: TmsStringList;
 l_FileNameEtalon : String;
begin
 l_FileNameEtalon := aFileName + '.etalon' + ExtractFileExt(aFileName);
 if FileExists(l_FileNameEtalon) then
 begin
  l_FileSerialized := TmsStringList.Create;
  try
   l_FileEtalon := TmsStringList.Create;
   try
    l_FileSerialized.LoadFromFile(aFileName);

    l_FileEtalon.LoadFromFile(l_FileNameEtalon);

    CheckTrue(l_FileEtalon.Equals(l_FileSerialized));
   finally
    FreeAndNil(l_FileSerialized);
   end;//try..finally
  finally
   FreeAndNil(l_FileEtalon);
  end;//try..finally
 end//FileExists(l_FileNameEtalon)
 else
 begin
  CopyFile(PWideChar(aFileName),PWideChar(l_FileNameEtalon),True);
 end;//FileExists(l_FileNameEtalon)
end;

function TmsShapeTestPrim.TestResultsFileName(aShapeClass: RmsShape): String;
begin
 Result := MakeFileName(Name, aShapeClass);
end;

procedure TmsShapeTestPrim.SaveDiagramm(const aFileName: String; aDiagramm: TmsDiagramm);
begin
 TmsDiagrammMarshal.Serialize(aFileName, aDiagramm);
end;

procedure TmsShapeTestPrim.SaveDiagrammAndCheck(aShapeClass: RmsShape; aDiagramm: TmsDiagramm);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName(aShapeClass);
 SaveDiagramm(l_FileNameTest, aDiagramm);
 CheckFileWithEtalon(l_FileNameTest);
end;

function TmsShapeTestPrim.ShapesCount: Integer;
begin
 Result := f_Context.rShapesCount;
end;

constructor TmsShapeTestContext.Create(aMethodName: string; aSeed: Integer; aDiagrammName : String; aShapesCount : Integer; aShapeClass: RmsShape);
begin
 rMethodName := aMethodName;
 rSeed := aSeed;
 rDiagrammName := aDiagrammName;
 rShapesCount := aShapesCount;
 rShapeClass := aShapeClass
end;

procedure TmsShapeTestPrim.SetUp;
var
 l_Index : Integer;
 l_X : Integer;
 l_Y : Integer;
begin
 inherited;
 RandSeed := f_Context.rSeed;
 SetLength(f_Coords, ShapesCount);
 for l_Index := 0 to Pred(ShapesCount) do
 begin
  l_X := Random(100);
  l_Y := Random(200);
  f_Coords[l_Index] := TPoint.Create(l_X, l_Y);
 end;//for l_Index
end;

procedure TmsShapeTestPrim.CreateDiagrammAndCheck(aCheck : TmsDiagrammCheck; const aName: String);
var
 l_Diagramm: TmsDiagramm;
begin
 l_Diagramm := TmsDiagramm.Create(nil, aName);
 try
  aCheck(l_Diagramm);
 finally
  FreeAndNil(l_Diagramm);
 end;//try..finally
end;

procedure TmsShapeTestPrim.CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass: RmsShape);
begin
 CreateDiagrammAndCheck(
  procedure (aDiagramm : TmsDiagramm)
  var
   l_P : TPoint;
  begin
   for l_P in f_Coords do
    aDiagramm.Items.Add(aShapeClass.Create(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil)));
   SaveDiagrammAndCheck(aShapeClass, aDiagramm);
  end
  , f_Context.rDiagrammName
 );
end;

procedure TmsCustomShapeTest.TestSerialize;
begin
 CreateDiagrammWithShapeAndSaveAndCheck(ShapeClass);
end;

function TmsShapeTestPrim.TestSerializeMethodName: String;
begin
 Result := f_TestSerializeMethodName + 'TestSerialize';
end;

procedure TmsShapeTestPrim.DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck; aShapeClass: RmsShape);
begin
 CreateDiagrammAndCheck(
  procedure (aDiagramm : TmsDiagramm)
  begin
   TmsDiagrammMarshal.DeSerialize(MakeFileName(TestSerializeMethodName, aShapeClass), aDiagramm);
   aCheck(aDiagramm);
  end
  , ''
 );
end;

procedure TmsShapeTestPrim.TestDeSerializeForShapeClass(aShapeClass: RmsShape);
begin
 DeserializeDiargammAndCheck(
  procedure (aDiagramm: TmsDiagramm)
  begin
   SaveDiagrammAndCheck(aShapeClass, aDiagramm);
  end
 , aShapeClass
 );
end;

procedure TmsShapeTest.TestDeSerialize;
begin
 TestDeSerializeForShapeClass(ShapeClass);
end;

constructor TmsShapeTestPrim.Create(const aContext: TmsShapeTestContext);
begin
 inherited Create(aContext.rMethodName);
 f_Context := aContext;
 FTestName := f_Context.rShapeClass.ClassName + '.' + aContext.rMethodName;
 f_TestSerializeMethodName := f_Context.rShapeClass.ClassName + '.';
end;

procedure TmsShapeTestPrim.TestDeSerializeViaShapeCheckForShapeClass(aShapeClass: RmsShape);
begin
 DeserializeDiargammAndCheck(
  procedure (aDiagramm: TmsDiagramm)
  var
   l_Shape : TmsShape;
   l_Index : Integer;
  begin
   Check(aDiagramm.Name = f_Context.rDiagrammName);
   Check(aDiagramm.Items <> nil);
   Check(aDiagramm.Items.Count = ShapesCount);
   Check(Length(f_Coords) = aDiagramm.Items.Count);
   for l_Index := 0 to Pred(aDiagramm.Items.Count) do
   begin
    l_Shape := aDiagramm.Items[l_Index].toObject As TmsShape;
    Check(l_Shape.ClassType = aShapeClass);
    Check(l_Shape.StartPoint.X = f_Coords[l_Index].X);
    Check(l_Shape.StartPoint.Y = f_Coords[l_Index].Y);
   end;//for l_Shape
  end
 , aShapeClass
 );
end;

procedure TmsShapeTest.TestDeSerializeViaShapeCheck;
begin
 TestDeSerializeViaShapeCheckForShapeClass(ShapeClass);
end;

procedure TmsShapeTestPrim.OutToFileAndCheck(aLambda: TmsLogLambda);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName(ShapeClass);
 TmsLog.Log(l_FileNameTest,
  procedure (aLog: TmsLog)
  begin
   aLambda(aLog);
  end
 );
 CheckFileWithEtalon(l_FileNameTest);
end;

procedure TmsShapeTest.TestShapeName;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  begin
   aLog.ToLog(ShapeClass.ClassName);
  end
 );
end;

procedure TmsShapeTest.TestDiagrammName;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  begin
   aLog.ToLog(f_Context.rDiagrammName);
  end
 );
end;

class procedure TmsShapeTestPrim.CheckShapes(aCheck: TmsShapeClassCheck);
begin
 TmsRegisteredShapes.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   if not aShapeClass.IsTool then
    aCheck(aShapeClass);
  end
 );
end;

function TmsShapeTestPrim.ShapeClass: RmsShape;
begin
 Result := f_Context.rShapeClass;
end;

// TmsDiagrammTest

procedure TmsDiagrammTest.SaveDiagramm(const aFileName: String; aDiagramm: TmsDiagramm);
begin
 inherited;
end;

end.

