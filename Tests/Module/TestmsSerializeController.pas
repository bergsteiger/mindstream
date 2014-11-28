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
  msRegisteredShapes
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
    procedure CheckFileWithEtalon(const aFileName: String);
    function MakeFileName(const aTestName: String; aShapeClass: RmsShape): String;
    procedure SaveDiagrammAndCheck(aShapeClass: RmsShape; aDiagramm: TmsDiagramm);
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
    procedure FakeTest;
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
  System.Types,
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
begin
 Result := ExtractFilePath(ParamStr(0)) + ClassName + '_' + aTestName + '_' + aShapeClass.ClassName + '.json';
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

procedure TestTmsSerializeControllerPrim.SaveDiagrammAndCheck(aShapeClass: RmsShape; aDiagramm: TmsDiagramm);
var
 l_FileSerialized, l_FileEtalon: TStringList;
 l_FileNameTest : String;
begin
 l_FileNameTest := MakeFileName(Name, aShapeClass);
 TmsSerializeController.Serialize(l_FileNameTest, aDiagramm);
 CheckFileWithEtalon(l_FileNameTest);
end;

procedure TestTmsSerializeControllerPrim.CreateDiagrammWithShapeAndSaveAndCheck(aShapeClass: RmsShape);
const
 c_DiagramName = 'First Diagram';
var
 l_Diagramm: TmsDiagramm;
 l_Image: TImage;
begin
 l_Image:= TImage.Create(nil);
 try
  l_Diagramm := TmsDiagramm.Create(l_Image, c_DiagramName);
  try
   l_Diagramm.ShapeList.Add(aShapeClass.Create(TmsMakeShapeContext.Create(TPointF.Create(10, 10),nil)));
   SaveDiagrammAndCheck(aShapeClass, l_Diagramm);
  finally
   FreeAndNil(l_Image);
  end;
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
  begin
   Check(aDiagramm.ShapeList <> nil);
   Check(aDiagramm.ShapeList.Count = 1);
   Check(aDiagramm.ShapeList[0].HackInstance.ClassType = aShapeClass);
  end
 , aShapeClass
 );
end;

procedure TestTmsSerializeController.TestDeSerializeViaShapeCheck;
begin
 TestDeSerializeViaShapeCheckForShapeClass(ShapeClass);
end;

procedure TestTmsSerializeController.FakeTest;
begin
 Check(ShapeClass.ClassName = ShapeClass.ClassName);
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

