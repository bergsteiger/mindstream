unit TestmsSerializeController;

interface

uses
  TestFramework,
  msSerializeController,
  Data.DBXJSONReflect,
  JSON,
  FMX.Objects,
  msDiagramm,
  msShape,
  msRegisteredShapes,
  System.Types
  ;

type
  TmsDiagrammCheck = reference to procedure (aDiagramm : TmsDiagramm);
  TmsShapeClassCheck = TmsShapeClassLambda;

  TmsShapeTestPrim = class abstract(TTestCase)
  public
    class procedure CheckShapes(aCheck: TmsShapeClassCheck);
  end;//TmsShapeTestPrim

  TestTmsSerializeControllerPrim = class abstract(TmsShapeTestPrim)
  protected
   f_Coords : array of TPoint;
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
  end;//TestTmsSerializeControllerPrim

  TestTmsSerializeController = class abstract(TestTmsSerializeControllerPrim)
  protected
    function ShapeClass: RmsShape; virtual; abstract;
  published
    procedure TestSerialize;
    procedure TestDeSerialize;
    procedure TestDeSerializeViaShapeCheck;
    procedure TestShapeName;
  end;//TestTmsSerializeController

  TmsParametrizedShapeTest = class(TestTmsSerializeController)
  private
   f_ShapeClass : RmsShape;
   f_TestSerializeMethodName : String;
  protected
    function ShapeClass: RmsShape; override;
    function TestSerializeMethodName: String; override;
  public
   constructor Create(MethodName: string; aShapeClass: RmsShape); virtual;
  end;//TmsParametrizedShapeTest

  RmsParametrizedShapeTest = class of TmsParametrizedShapeTest;

 TmsParametrizedShapeTestSuite = class(TTestSuite)
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   constructor Create;
   class function Make: ITest;
 end;//TmsParametrizedShapeTestSuite

  TestTmsSerializeControllerForAll = class(TestTmsSerializeControllerPrim)
  published
    procedure TestSerialize;
    procedure TestDeSerialize;
    procedure TestDeSerializeViaShapeCheck;
  end;//TestTmsSerializeControllerForAll

  TestSerializeTriangle = class(TestTmsSerializeController)
  protected
    function ShapeClass: RmsShape; override;
  end;//TestSerializeTriangle

  TestSerializeRectangle = class(TestTmsSerializeController)
  protected
    function ShapeClass: RmsShape; override;
  end;//TestSerializeRectangle

  TestSerializeCircle = class(TestTmsSerializeController)
  protected
    function ShapeClass: RmsShape; override;
  end;//TestSerializeCircle

  TestSerializeRoundedRectangle = class(TestTmsSerializeController)
  protected
    function ShapeClass: RmsShape; override;
  end;//TestSerializeRoundedRectangle

implementation

 uses
  System.SysUtils,
  msTriangle,
  msRectangle,
  msCircle,
  msRoundedRectangle,
  msMover,
  System.Classes,
  Winapi.Windows,
  System.Rtti,
  System.TypInfo
  ;

function TestSerializeTriangle.ShapeClass: RmsShape;
begin
 Result := TmsTriangle;
end;

function TestSerializeRectangle.ShapeClass: RmsShape;
begin
 Result := TmsRectangle;
end;

function TestSerializeCircle.ShapeClass: RmsShape;
begin
 Result := TmsCircle;
end;

function TestSerializeRoundedRectangle.ShapeClass: RmsShape;
begin
 Result := TmsRoundedRectangle;
end;

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
 l_FileSerialized, l_FileEtalon: TStringList;
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName(aShapeClass);
 TmsSerializeController.Serialize(l_FileNameTest, aDiagramm);
 CheckFileWithEtalon(l_FileNameTest);
end;

function TestTmsSerializeControllerPrim.ShapesCount: Integer;
begin
 Result := 10;
end;

procedure TestTmsSerializeControllerPrim.SetUp;
var
 l_Index : Integer;
 l_X : Integer;
 l_Y : Integer;
begin
 inherited;
 RandSeed := 10;
 SetLength(f_Coords, ShapesCount);
 for l_Index := 0 to Pred(ShapesCount) do
 begin
  l_X := Random(100);
  l_Y := Random(200);
  f_Coords[l_Index] := TPoint.Create(l_X, l_Y);
 end;//for l_Index
end;

procedure TestTmsSerializeControllerPrim.CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass: RmsShape);
const
 c_DiagramName = 'First Diagram';
var
 l_Diagramm: TmsDiagramm;
 l_Image: TImage;
 l_P : TPoint;
begin
 l_Image:= TImage.Create(nil);
 try
  l_Diagramm := TmsDiagramm.Create(l_Image, c_DiagramName);
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

procedure TestTmsSerializeControllerPrim.TestDeSerializeViaShapeCheckForShapeClass(aShapeClass: RmsShape);
begin
 DeserializeDiargammAndCheck(
  procedure (aDiagramm: TmsDiagramm)
  var
   l_Shape : TmsShape;
   l_Index : Integer;
  begin
   Check(aDiagramm.ShapeList <> nil);
   Check(aDiagramm.ShapeList.Count = ShapesCount);
   Check(Length(f_Coords) = aDiagramm.ShapeList.Count);
   for l_Index := 0 to Pred(aDiagramm.ShapeList.Count) do
   begin
    l_Shape := aDiagramm.ShapeList[l_Index].HackInstance As TmsShape;
    Check(l_Shape.ClassType = aShapeClass);
   end;//for l_Shape
  end
 , aShapeClass
 );
end;

procedure TestTmsSerializeController.TestDeSerializeViaShapeCheck;
begin
 TestDeSerializeViaShapeCheckForShapeClass(ShapeClass);
end;

procedure TestTmsSerializeController.TestShapeName;
var
 l_FileNameTest : String;
 l_FS : TFileStream;
begin
 l_FileNameTest := TestResultsFileName(ShapeClass);
 l_FS := TFileStream.Create(l_FileNameTest, fmCreate);
 try
  l_FS.Write(AnsiString(ShapeClass.ClassName)[1], Length(ShapeClass.ClassName));
 finally
  FreeAndNil(l_FS);
 end;//try..finally
 CheckFileWithEtalon(l_FileNameTest);
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

procedure TestTmsSerializeControllerForAll.TestSerialize;
begin
 CheckShapes(
  procedure (aShapeClass: RmsShape)
  begin
   CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass);
  end
 );
end;

procedure TestTmsSerializeControllerForAll.TestDeSerialize;
begin
 CheckShapes(
  procedure (aShapeClass: RmsShape)
  begin
   TestDeSerializeForShapeClass(aShapeClass);
  end
 );
end;

procedure TestTmsSerializeControllerForAll.TestDeSerializeViaShapeCheck;
begin
 CheckShapes(
  procedure (aShapeClass: RmsShape)
  begin
   TestDeSerializeViaShapeCheckForShapeClass(aShapeClass);
  end
 );
end;

function TmsParametrizedShapeTest.ShapeClass: RmsShape;
begin
 Result := f_ShapeClass;
end;

function TmsParametrizedShapeTest.TestSerializeMethodName: String;
begin
 Result := inherited TestSerializeMethodName + f_TestSerializeMethodName;
end;

constructor TmsParametrizedShapeTest.Create(MethodName: string; aShapeClass: RmsShape);
begin
 inherited Create(MethodName);
 f_ShapeClass := aShapeClass;
 FTestName := MethodName + '.' + f_ShapeClass.ClassName;
 f_TestSerializeMethodName := '.' + f_ShapeClass.ClassName;
end;

// TmsParametrizedShapeTestSuite

constructor TmsParametrizedShapeTestSuite.Create;
begin
 inherited Create(TmsParametrizedShapeTest);
end;

class function TmsParametrizedShapeTestSuite.Make: ITest;
begin
 Result := Create;
end;

procedure TmsParametrizedShapeTestSuite.AddTests(testClass: TTestCaseClass);
var
 l_Method: TRttiMethod;
begin
 Assert(testClass.InheritsFrom(TmsParametrizedShapeTest));
 for l_Method in TRttiContext.Create.GetType(testClass).GetMethods do
   if (l_Method.Visibility = mvPublished) then
   begin
    TmsShapeTestPrim.CheckShapes(
     procedure (aShapeClass: RmsShape)
     begin
      AddTest(RmsParametrizedShapeTest(testClass).Create(l_Method.Name, aShapeClass));
     end
    );
   end;//LMethod.Visibility = mvPublished
end;

initialization
  RegisterTest(TestSerializeTriangle.Suite);
  RegisterTest(TestSerializeRectangle.Suite);
  RegisterTest(TestSerializeCircle.Suite);
  RegisterTest(TestSerializeRoundedRectangle.Suite);
  RegisterTest(TestTmsSerializeControllerForAll.Suite);
  RegisterTest(TmsParametrizedShapeTestSuite.Make);
end.

