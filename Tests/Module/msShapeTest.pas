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
   rShapeClass: RmsShape;
   constructor Create(aMethodName: string; aSeed: Integer; aDiagrammName: string; aShapesCount: Integer; aShapeClass: RmsShape);
  end;//TmsShapeTestContext

  TmsShapeTestPrim = class abstract(TmsLoggedTest)
  protected
   f_Context : TmsShapeTestContext;
   f_TestSerializeMethodName : String;
   f_Coords : array of TPoint;
  protected
   class function ComputerName: AnsiString;
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
    function ContextName: String; override;
    function InnerFolders: String; override;
  public
    class procedure CheckShapes(aCheck: TmsShapeClassCheck);
    constructor Create(const aContext: TmsShapeTestContext);
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

function TmsShapeTestPrim.ContextName: String;
begin
 Result := '_' + f_Context.rShapeClass.ClassName;
end;

const
 c_JSON = 'JSON\';

function TmsShapeTestPrim.InnerFolders: String;
begin
 Result := c_JSON;
end;

class function TmsShapeTestPrim.ComputerName: AnsiString;
//#UC START# *4CA45DD902BD_4B2A11BC0255_var*
var
 l_CompSize : Integer;
//#UC END# *4CA45DD902BD_4B2A11BC0255_var*
begin
//#UC START# *4CA45DD902BD_4B2A11BC0255_impl*
 l_CompSize := MAX_COMPUTERNAME_LENGTH + 1;
 SetLength(Result, l_CompSize);

 Win32Check(GetComputerNameA(PAnsiChar(Result), LongWord(l_CompSize)));
 SetLength(Result, l_CompSize);
//#UC END# *4CA45DD902BD_4B2A11BC0255_impl*
end;//TBaseTest.ComputerName

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

constructor TmsShapeTestContext.Create(aMethodName: string; aSeed: Integer; aDiagrammName: string; aShapesCount: Integer; aShapeClass: RmsShape);
begin
 rMethodName := aMethodName;
 rSeed := aSeed;
 rDiagrammName := aDiagrammName;
 rShapesCount := aShapesCount;
 rShapeClass := aShapeClass;
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
    aDiagramm.AddShape(TmsCompletedShapeCreator.Create(f_Context.rShapeClass).CreateShape(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil, nil))).AddNewDiagramm;

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
 Result := f_TestSerializeMethodName + 'TestSerialize';
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
   l_Shape : ImsShape;
   l_Index : Integer;
  begin
   Check(aDiagramm.Name = f_Context.rDiagrammName);
   Check(Length(f_Coords) = aDiagramm.ItemsCount);
   l_Index := 0;
   for l_Shape in aDiagramm do
   begin
    Check(l_Shape.ClassType = f_Context.rShapeClass);
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

