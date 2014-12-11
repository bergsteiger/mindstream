unit msShapeTest;

interface

uses
  TestFramework,
  msDiagramm,
  msShape,
  msRegisteredShapes,
  System.Types,
  System.Classes,
  msCoreObjects,
  msInterfaces
  ;

type
  TmsShapeClassCheck = TmsShapeClassLambda;

  TmsDiagrammCheck = reference to procedure (const aDiagramm : ImsDiagramm);

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
    function TestResultsFileName: String;
    function MakeFileName(const aTestName: String): String;
    procedure CreateDiagrammAndCheck(aCheck : TmsDiagrammCheck; const aName: String);
    procedure CheckFileWithEtalon(const aFileName: String);
    procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); virtual;
    procedure SaveDiagrammAndCheck(const aDiagramm: ImsDiagramm);
    procedure OutToFileAndCheck(aLambda: TmsLogLambda);
    procedure SetUp; override;
    function ShapesCount: Integer;
    procedure CreateDiagrammWithShapeAndSaveAndCheck;
    function TestSerializeMethodName: String;
    procedure DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck);
    procedure TestDeSerializeForShapeClass;
    procedure TestDeSerializeViaShapeCheckForShapeClass;
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
    procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
  published
    procedure TestDeSerialize;
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
  msDiagrammsMarshal,
  msStringList,
  msDiagramms
  ;

function TmsShapeTestPrim.MakeFileName(const aTestName: String): String;
var
 l_Folder : String;
begin
 l_Folder := ExtractFilePath(ParamStr(0)) + 'TestResults\';
 ForceDirectories(l_Folder);
 Result := l_Folder + ClassName + '_' + aTestName + '_' + f_Context.rShapeClass.ClassName + '.json';
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

function TmsShapeTestPrim.TestResultsFileName: String;
begin
 Result := MakeFileName(Name);
end;

procedure TmsShapeTestPrim.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
begin
 TmsDiagrammMarshal.Serialize(aFileName, aDiagramm.toObject);
end;

procedure TmsShapeTestPrim.SaveDiagrammAndCheck(const aDiagramm: ImsDiagramm);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName;
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
 l_Diagramm: ImsDiagramm;
begin
 l_Diagramm := TmsDiagramm.Create(aName);
 try
  aCheck(l_Diagramm);
 finally
  l_Diagramm := nil;
 end;//try..finally
end;

procedure TmsShapeTestPrim.CreateDiagrammWithShapeAndSaveAndCheck;
begin
 CreateDiagrammAndCheck(
  procedure (const aDiagramm : ImsDiagramm)
  var
   l_P : TPoint;
  begin
   for l_P in f_Coords do
    aDiagramm.AddShape(f_Context.rShapeClass.Create(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil)));
   SaveDiagrammAndCheck(aDiagramm);
  end
  , f_Context.rDiagrammName
 );
end;

procedure TmsCustomShapeTest.TestSerialize;
begin
 CreateDiagrammWithShapeAndSaveAndCheck;
end;

function TmsShapeTestPrim.TestSerializeMethodName: String;
begin
 Result := f_TestSerializeMethodName + 'TestSerialize';
end;

procedure TmsShapeTestPrim.DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck);
begin
 CreateDiagrammAndCheck(
  procedure (const aDiagramm : ImsDiagramm)
  begin
   aDiagramm.DeSerializeFrom(MakeFileName(TestSerializeMethodName));
   // - берём результаты от ПРЕДЫДУЩИХ тестов, НЕКОШЕРНО с точки зрения TDD
   //   НО! Чертовски эффективно.
   aCheck(aDiagramm);
  end
  , ''
 );
end;

procedure TmsShapeTestPrim.TestDeSerializeForShapeClass;
begin
 DeserializeDiargammAndCheck(
  procedure (const aDiagramm: ImsDiagramm)
  begin
   SaveDiagrammAndCheck(aDiagramm);
  end
 );
end;

procedure TmsShapeTest.TestDeSerialize;
begin
 TestDeSerializeForShapeClass;
end;

constructor TmsShapeTestPrim.Create(const aContext: TmsShapeTestContext);
begin
 inherited Create(aContext.rMethodName);
 f_Context := aContext;
 FTestName := f_Context.rShapeClass.ClassName + '.' + aContext.rMethodName;
 f_TestSerializeMethodName := f_Context.rShapeClass.ClassName + '.';
end;

procedure TmsShapeTestPrim.TestDeSerializeViaShapeCheckForShapeClass;
begin
 DeserializeDiargammAndCheck(
  procedure (const aDiagramm: ImsDiagramm)
  var
   l_Shape : TmsShape;
   l_Index : Integer;
   l_D : TmsDiagramm;
  begin
   l_D := aDiagramm.toObject As TmsDiagramm;
   Check(l_D.Name = f_Context.rDiagrammName);
   Check(l_D.Items <> nil);
   Check(l_D.Items.Count = ShapesCount);
   Check(Length(f_Coords) = l_D.Items.Count);
   for l_Index := 0 to Pred(l_D.Items.Count) do
   begin
    l_Shape := l_D.Items[l_Index].toObject As TmsShape;
    Check(l_Shape.ClassType = f_Context.rShapeClass);
    Check(l_Shape.StartPoint.X = f_Coords[l_Index].X);
    Check(l_Shape.StartPoint.Y = f_Coords[l_Index].Y);
   end;//for l_Shape
  end
 );
end;

procedure TmsShapeTest.TestDeSerializeViaShapeCheck;
begin
 TestDeSerializeViaShapeCheckForShapeClass;
end;

procedure TmsShapeTestPrim.OutToFileAndCheck(aLambda: TmsLogLambda);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName;
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
   aLog.ToLog(f_Context.rShapeClass.ClassName);
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

// TmsDiagrammTest

procedure TmsDiagrammTest.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
var
 l_Diagramms : ImsDiagramms;
begin
 l_Diagramms := TmsDiagramms.Create(nil);
 try
  l_Diagramms.AddDiagramm(aDiagramm);
  TmsDiagrammsMarshal.Serialize(aFileName, l_Diagramms.toObject);
 finally
  l_Diagramms := nil;
 end;//try..finally
end;

procedure TmsDiagrammTest.TestDeSerialize;
var
 l_Diagramms : ImsDiagramms;
 l_FileName : String;
begin
 l_Diagramms := TmsDiagramms.Create(nil);
 try
  l_Diagramms.DeSerializeFrom(MakeFileName(TestSerializeMethodName));
  // - берём результаты от ПРЕДЫДУЩИХ тестов, НЕКОШЕРНО с точки зрения TDD
  //   НО! Чертовски эффективно.
  l_FileName := TestResultsFileName;
  TmsDiagrammsMarshal.Serialize(l_FileName, l_Diagramms.toObject);
  CheckFileWithEtalon(l_FileName);
 finally
  l_Diagramms := nil;
 end;//try..finally
end;

end.

