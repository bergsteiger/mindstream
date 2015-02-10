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
  msInterfaces,
  msShapeClassList,
  msLoggedTest
  ;

type
  TmsShapeClassCheck = TmsShapeClassLambda;

  TmsDiagrammCheck = reference to procedure (const aDiagramm : ImsDiagramm);
  TmsDiagrammSaveTo = reference to procedure (const aFileName: String; const aDiagramm: ImsDiagramm);

  TmsShapeTestContext = record
   rMethodName: string;
   rSeed: Integer;
   rDiagrammName : String;
   rShapesCount : Integer;
   rShapeClass: Pointer;
   constructor Create(aMethodName: string; aSeed: Integer; aDiagrammName: string; aShapesCount: Integer; const aShapeClass: MCmsShape);
  end;//TmsShapeTestContext

  TmsAddTestLambda = reference to procedure (ATest: ITest);

  TmsShapeTestPrim = class abstract(TmsLoggedTest)
  protected
   f_Context : TmsShapeTestContext;
   f_Coords : array of TPoint;
  protected
   procedure CreateDiagrammAndCheck(aCheck : TmsDiagrammCheck; const aName: String);
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); virtual;
   procedure SaveDiagrammAndCheck(const aDiagramm: ImsDiagramm; aSaveTo: TmsDiagrammSaveTo);
   procedure SetUp; override;
   function ShapesCount: Integer;
   procedure CreateDiagrammWithShapeAndSaveAndCheck;
   function TestSerializeMethodName: String;
   procedure DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck);
   procedure TestDeSerializeForShapeClass;
   procedure TestDeSerializeViaShapeCheckForShapeClass;
   function ShapeClass: MCmsShape;
   function TestNamePrefix: String; virtual;
   function ContextName: String; override;
   function InnerFolders: String; override;
   procedure TransformContext(var theContext: TmsShapeTestContext); virtual;
   constructor CreateInner(const aContext: TmsShapeTestContext);
  public
   class procedure CheckShapes(aCheck: TmsShapeClassCheck);
   class function Create(const aContext: TmsShapeTestContext): ITest;
   destructor Destroy; override;
   class procedure AddTest(aContext: TmsShapeTestContext; aLambda: TmsAddTestLambda); virtual;
  end;//TmsShapeTestPrim

  RmsShapeTest = class of TmsShapeTestPrim;

  TmsCustomShapeTest = class(TmsShapeTestPrim)
  protected
   function FileExtension: String; override;
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
  msDiagramms,
  Math,
  msStreamUtils,
  msTestConstants,
  msShapeCreator,
  msCompletedShapeCreator
  ;

// TmsShapeTestPrim

function TmsShapeTestPrim.ShapeClass: MCmsShape;
begin
 Result := MCmsShape(f_Context.rShapeClass);
end;

function TmsShapeTestPrim.TestNamePrefix: String;
begin
 Result := Self.ShapeClass.Name;
end;

function TmsShapeTestPrim.ContextName: String;
begin
 Result := '_' + TestNamePrefix;
end;

const
 c_JSON = 'JSON\';

function TmsShapeTestPrim.InnerFolders: String;
begin
 Result := c_JSON;
end;

procedure TmsShapeTestPrim.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
begin
 aDiagramm.SaveTo(aFileName);
end;

procedure TmsShapeTestPrim.SaveDiagrammAndCheck(const aDiagramm: ImsDiagramm; aSaveTo: TmsDiagrammSaveTo);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName;
 aSaveTo(l_FileNameTest, aDiagramm);
 CheckFileWithEtalon(l_FileNameTest);
end;

function TmsShapeTestPrim.ShapesCount: Integer;
begin
 Result := f_Context.rShapesCount;
end;

constructor TmsShapeTestContext.Create(aMethodName: string; aSeed: Integer; aDiagrammName: string; aShapesCount: Integer; const aShapeClass: MCmsShape);
begin
 rMethodName := aMethodName;
 rSeed := aSeed;
 rDiagrammName := aDiagrammName;
 rShapesCount := aShapesCount;
 rShapeClass := Pointer(aShapeClass);
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
  l_X := Random(c_MaxCanvasWidth);
  l_Y := Random(c_MaxCanvasHeight);
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
    aDiagramm.AddShape(TmsCompletedShapeCreator.Create(Self.ShapeClass).CreateShape(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil, nil))).AddNewDiagramm;

   SaveDiagrammAndCheck(aDiagramm, SaveDiagramm);
  end
  , f_Context.rDiagrammName
 );
end;

function TmsCustomShapeTest.FileExtension: String;
begin
 Result := '.json';
end;

procedure TmsCustomShapeTest.TestSerialize;
begin
 CreateDiagrammWithShapeAndSaveAndCheck;
end;

function TmsShapeTestPrim.TestSerializeMethodName: String;
begin
 Result := TestNamePrefix + '.' + 'TestSerialize';
end;

procedure TmsShapeTestPrim.DeserializeDiargammAndCheck(aCheck: TmsDiagrammCheck);
begin
 CreateDiagrammAndCheck(
  procedure (const aDiagramm : ImsDiagramm)
  begin
   aDiagramm.LoadFrom(MakeFileName(TestSerializeMethodName, c_JSON));
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
   SaveDiagrammAndCheck(aDiagramm, SaveDiagramm);
  end
 );
end;

procedure TmsShapeTest.TestDeSerialize;
begin
 TestDeSerializeForShapeClass;
end;

procedure TmsShapeTestPrim.TransformContext(var theContext: TmsShapeTestContext);
begin
end;

constructor TmsShapeTestPrim.CreateInner(const aContext: TmsShapeTestContext);
begin
 inherited Create(aContext.rMethodName);
 f_Context := aContext;
 TransformContext(f_Context);
 FTestName := TestNamePrefix + '.' + aContext.rMethodName;
end;

class function TmsShapeTestPrim.Create(const aContext: TmsShapeTestContext): ITest;
begin
 Result := CreateInner(aContext);
end;

destructor TmsShapeTestPrim.Destroy;
begin
 Finalize(f_Context);
 inherited;
end;

class procedure TmsShapeTestPrim.AddTest(aContext: TmsShapeTestContext; aLambda: TmsAddTestLambda);
begin
 aLambda(Self.Create(aContext));
end;

procedure TmsShapeTestPrim.TestDeSerializeViaShapeCheckForShapeClass;
begin
 DeserializeDiargammAndCheck(
  procedure (const aDiagramm: ImsDiagramm)
  var
   l_Shape : ImsShape;
   l_Index : Integer;
  begin
   Check(aDiagramm.Name = f_Context.rDiagrammName);
   Check(Length(f_Coords) = aDiagramm.ItemsCount);
   l_Index := 0;
   for l_Shape in aDiagramm do
   begin
    Check(Self.ShapeClass.IsOurInstance(l_Shape));
    Check(l_Shape.StartPoint.X = f_Coords[l_Index].X);
    Check(l_Shape.StartPoint.Y = f_Coords[l_Index].Y);
    Inc(l_Index);
   end;//for l_Shape
  end
 );
end;

procedure TmsShapeTest.TestDeSerializeViaShapeCheck;
begin
 TestDeSerializeViaShapeCheckForShapeClass;
end;

procedure TmsShapeTest.TestShapeName;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  begin
   aLog.ToLog(TestNamePrefix);
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
 TmsRegisteredShapes.Instance.IterateShapes(
  procedure (const aShapeClass: MCmsShape)
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
 l_Diagramms := TmsDiagramms.Create;
 try
  l_Diagramms.AddDiagramm(aDiagramm);
  l_Diagramms.SaveTo(aFileName);
 finally
  l_Diagramms := nil;
 end;//try..finally
end;

procedure TmsDiagrammTest.TestDeSerialize;
var
 l_Diagramms : ImsDiagramms;
 l_FileName : String;
begin
 l_Diagramms := TmsDiagramms.Create;
 try
  l_Diagramms.LoadFrom(MakeFileName(TestSerializeMethodName, c_JSON));
  // - берём результаты от ПРЕДЫДУЩИХ тестов, НЕКОШЕРНО с точки зрения TDD
  //   НО! Чертовски эффективно.
  l_FileName := TestResultsFileName;
  l_Diagramms.SaveTo(l_FileName);
  CheckFileWithEtalon(l_FileName);
 finally
  l_Diagramms := nil;
 end;//try..finally
end;

end.

