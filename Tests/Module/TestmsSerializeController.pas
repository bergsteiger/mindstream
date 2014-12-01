unit TestmsSerializeController;

interface

uses
  TestFramework,
  msSerializeController,
  msDiagramm,
  msShape,
  msRegisteredShapes,
  System.Types,
  System.Classes
  ;

type
  TmsDiagrammCheck = reference to procedure (aDiagramm : TmsDiagramm);
  TmsShapeClassCheck = TmsShapeClassLambda;
  TmsShapeTestPrim = class abstract(TTestCase)
  public
    class procedure CheckShapes(aCheck: TmsShapeClassCheck);
  end;//TmsShapeTestPrim

  TmsShapeTestContext = record
   rMethodName: string;
   rSeed: Integer;
   rDiagrammName : String;
   rShapesCount : Integer;
   rShapeClass: RmsShape;
   constructor Create(aMethodName: string; aSeed: Integer; aDiagrammName : String; aShapesCount : Integer; aShapeClass: RmsShape);
  end;//TmsShapeTestContext

  TmsFileLambda = reference to procedure (aFile: TFileStream);

  TestTmsSerializeControllerPrim = class abstract(TmsShapeTestPrim)
  protected
   f_Coords : array of TPoint;
   f_Context : TmsShapeTestContext;
  protected
    procedure SetUp; override;
    procedure CheckFileWithEtalon(const aFileName: String);
    function MakeFileName(const aTestName: String; aShapeClass: RmsShape): String;
    function TestResultsFileName(aShapeClass: RmsShape): String;
    procedure SaveDiagrammAndCheck(aShapeClass: RmsShape; aDiagramm: TmsDiagramm);
    function ShapesCount: Integer;
    procedure CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass: RmsShape);
    function TestSerializeMethodName: String; virtual;
    procedure DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck; aShapeClass: RmsShape);
    procedure TestDeSerializeForShapeClass(aShapeClass: RmsShape);
    procedure TestDeSerializeViaShapeCheckForShapeClass(aShapeClass: RmsShape);
    function ShapeClass: RmsShape;
    procedure OutToFileAndCheck(aLambda: TmsFileLambda);
  public
   constructor Create(const aContext: TmsShapeTestContext); virtual;
  end;//TestTmsSerializeControllerPrim

  TestTmsSerializeController = class abstract(TestTmsSerializeControllerPrim)
  published
    procedure TestSerialize;
    procedure TestDeSerialize;
    procedure TestDeSerializeViaShapeCheck;
    procedure TestShapeName;
    procedure TestDiagrammName;
  end;//TestTmsSerializeController

  TmsParametrizedShapeTest = class(TestTmsSerializeController)
  private
   f_TestSerializeMethodName : String;
  protected
    function TestSerializeMethodName: String; override;
  public
   constructor Create(const aContext: TmsShapeTestContext); override;
  end;//TmsParametrizedShapeTest

  RmsParametrizedShapeTest = class of TmsParametrizedShapeTest;

  TmsParametrizedShapeTestSuite = class(TTestSuite)
  private
   constructor CreatePrim;
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   class function Create: ITest;
  end;//TmsParametrizedShapeTestSuite

implementation

 uses
  System.SysUtils,
  msTriangle,
  msRectangle,
  msCircle,
  msRoundedRectangle,
  msMover,
  Winapi.Windows,
  System.Rtti,
  System.TypInfo,
  FMX.Objects
  ;

function TestTmsSerializeControllerPrim.MakeFileName(const aTestName: String; aShapeClass: RmsShape): String;
var
 l_Folder : String;
begin
 l_Folder := ExtractFilePath(ParamStr(0)) + 'TestResults\';
 ForceDirectories(l_Folder);
 Result := l_Folder + ClassName + '_' + aTestName + '_' + aShapeClass.ClassName + '.json';
end;

procedure TestTmsSerializeControllerPrim.CheckFileWithEtalon(const aFileName: String);
var
 l_FileSerialized, l_FileEtalon: TStringList;
 l_FileNameEtalon : String;
begin
 l_FileNameEtalon := aFileName + '.etalon' + ExtractFileExt(aFileName);
 if FileExists(l_FileNameEtalon) then
 begin
  l_FileSerialized := TStringList.Create;
  l_FileSerialized.LoadFromFile(aFileName);

  l_FileEtalon := TStringList.Create;
  l_FileEtalon.LoadFromFile(l_FileNameEtalon);

  CheckTrue(l_FileEtalon.Equals(l_FileSerialized));

  FreeAndNil(l_FileSerialized);
  FreeAndNil(l_FileEtalon);
 end//FileExists(l_FileNameEtalon)
 else
 begin
  CopyFile(PWideChar(aFileName),PWideChar(l_FileNameEtalon),True);
 end;//FileExists(l_FileNameEtalon)
end;

function TestTmsSerializeControllerPrim.TestResultsFileName(aShapeClass: RmsShape): String;
begin
 Result := MakeFileName(Name, aShapeClass);
end;

procedure TestTmsSerializeControllerPrim.SaveDiagrammAndCheck(aShapeClass: RmsShape; aDiagramm: TmsDiagramm);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName(aShapeClass);
 TmsSerializeController.Serialize(l_FileNameTest, aDiagramm);
 CheckFileWithEtalon(l_FileNameTest);
end;

function TestTmsSerializeControllerPrim.ShapesCount: Integer;
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

procedure TestTmsSerializeControllerPrim.SetUp;
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

procedure TestTmsSerializeControllerPrim.CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass: RmsShape);
var
 l_Diagramm: TmsDiagramm;
 l_Image: TImage;
 l_P : TPoint;
begin
 l_Image:= TImage.Create(nil);
 try
  l_Diagramm := TmsDiagramm.Create(l_Image, f_Context.rDiagrammName);
  try
   for l_P in f_Coords do
    l_Diagramm.ShapeList.Add(aShapeClass.Create(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil)));
   SaveDiagrammAndCheck(aShapeClass, l_Diagramm);
  finally
   FreeAndNil(l_Image);
  end;//try..finally
 finally
  FreeAndNil(l_Diagramm);
 end;//try..finally
end;

procedure TestTmsSerializeController.TestSerialize;
begin
 CreateDiagrammWithShapeAndSaveAndCheck(ShapeClass);
end;

function TestTmsSerializeControllerPrim.TestSerializeMethodName: String;
begin
 Result := 'TestSerialize';
end;

procedure TestTmsSerializeControllerPrim.DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck; aShapeClass: RmsShape);
var
 l_Diagramm : TmsDiagramm;
 l_FileNameTest: string;
begin
 l_FileNameTest := MakeFileName(TestSerializeMethodName, aShapeClass);
 l_Diagramm := TmsSerializeController.DeSerialize(l_FileNameTest);
 try
  aCheck(l_Diagramm);
 finally
  FreeAndNil(l_Diagramm);
 end;//try..finally
end;

procedure TestTmsSerializeControllerPrim.TestDeSerializeForShapeClass(aShapeClass: RmsShape);
begin
 DeserializeDiargammAndCheck(
  procedure (aDiagramm: TmsDiagramm)
  begin
   SaveDiagrammAndCheck(aShapeClass, aDiagramm);
  end
 , aShapeClass
 );
end;

procedure TestTmsSerializeController.TestDeSerialize;
begin
 TestDeSerializeForShapeClass(ShapeClass);
end;

constructor TestTmsSerializeControllerPrim.Create(const aContext: TmsShapeTestContext);
begin
 inherited Create(aContext.rMethodName);
 f_Context := aContext;
end;

procedure TestTmsSerializeControllerPrim.TestDeSerializeViaShapeCheckForShapeClass(aShapeClass: RmsShape);
begin
 DeserializeDiargammAndCheck(
  procedure (aDiagramm: TmsDiagramm)
  var
   l_Shape : TmsShape;
   l_Index : Integer;
  begin
   Check(aDiagramm.Name = f_Context.rDiagrammName);
   Check(aDiagramm.ShapeList <> nil);
   Check(aDiagramm.ShapeList.Count = ShapesCount);
   Check(Length(f_Coords) = aDiagramm.ShapeList.Count);
   for l_Index := 0 to Pred(aDiagramm.ShapeList.Count) do
   begin
    l_Shape := aDiagramm.ShapeList[l_Index].HackInstance As TmsShape;
    Check(l_Shape.ClassType = aShapeClass);
    Check(l_Shape.StartPoint.X = f_Coords[l_Index].X);
    Check(l_Shape.StartPoint.Y = f_Coords[l_Index].Y);
   end;//for l_Shape
  end
 , aShapeClass
 );
end;

procedure TestTmsSerializeController.TestDeSerializeViaShapeCheck;
begin
 TestDeSerializeViaShapeCheckForShapeClass(ShapeClass);
end;

procedure TestTmsSerializeControllerPrim.OutToFileAndCheck(aLambda: TmsFileLambda);
var
 l_FileNameTest : String;
 l_FS : TFileStream;
begin
 l_FileNameTest := TestResultsFileName(ShapeClass);
 l_FS := TFileStream.Create(l_FileNameTest, fmCreate);
 try
  aLambda(l_FS);
 finally
  FreeAndNil(l_FS);
 end;//try..finally
 CheckFileWithEtalon(l_FileNameTest);
end;

procedure TestTmsSerializeController.TestShapeName;
begin
 OutToFileAndCheck(
  procedure (aFile: TFileStream)
  begin
   aFile.Write(AnsiString(ShapeClass.ClassName)[1], Length(ShapeClass.ClassName));
  end
 );
end;

procedure TestTmsSerializeController.TestDiagrammName;
begin
 OutToFileAndCheck(
  procedure (aFile: TFileStream)
  begin
   aFile.Write(AnsiString(f_Context.rDiagrammName)[1], Length(f_Context.rDiagrammName));
  end
 );
end;

class procedure TmsShapeTestPrim.CheckShapes(aCheck: TmsShapeClassCheck);
begin
 TmsRegisteredShapes.IterateShapes(
  procedure (aShapeClass: RmsShape)
  begin
   if not aShapeClass.InheritsFrom(TmsMover) then
    aCheck(aShapeClass);
  end
 );
end;

function TestTmsSerializeControllerPrim.ShapeClass: RmsShape;
begin
 Result := f_Context.rShapeClass;
end;

function TmsParametrizedShapeTest.TestSerializeMethodName: String;
begin
 Result := f_TestSerializeMethodName + inherited TestSerializeMethodName;
end;

constructor TmsParametrizedShapeTest.Create(const aContext: TmsShapeTestContext);
begin
 inherited Create(aContext);
 FTestName := f_Context.rShapeClass.ClassName + '.' + aContext.rMethodName;
 f_TestSerializeMethodName := f_Context.rShapeClass.ClassName + '.';
end;

// TmsParametrizedShapeTestSuite

constructor TmsParametrizedShapeTestSuite.CreatePrim;
begin
 inherited Create(TmsParametrizedShapeTest);
end;

class function TmsParametrizedShapeTestSuite.Create: ITest;
begin
 Result := CreatePrim;
end;

procedure TmsParametrizedShapeTestSuite.AddTests(testClass: TTestCaseClass);
begin
 Assert(testClass.InheritsFrom(TmsParametrizedShapeTest));

 RandSeed := 10;
 TmsShapeTestPrim.CheckShapes(
  procedure (aShapeClass: RmsShape)
  var
   l_Method: TRttiMethod;
   l_DiagrammName : String;
   l_Seed : Integer;
   l_ShapesCount : Integer;
  begin
   l_Seed := Random(High(l_Seed));
   l_DiagrammName := 'Диаграмма №' + IntToStr(Random(10));
   l_ShapesCount := Random(1000) + 1;
   for l_Method in TRttiContext.Create.GetType(testClass).GetMethods do
    if (l_Method.Visibility = mvPublished) then
      AddTest(RmsParametrizedShapeTest(testClass).Create(TmsShapeTestContext.Create(l_Method.Name, l_Seed, l_DiagrammName, l_ShapesCount, aShapeClass)));
  end
 );
end;

initialization
  RegisterTest(TmsParametrizedShapeTestSuite.Create);
end.

