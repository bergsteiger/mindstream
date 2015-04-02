unit msShapeTest;

interface

uses
  TestFramework,
  msDiagramm,
  msShape,
  msRegisteredShapes,
  System.Types,
  System.Classes,
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
   rShapeClass: TmsWeakShapeClassRef;
   constructor Create(const aMethodName: string; aSeed: Integer; aDiagrammName: string; aShapesCount: Integer; const aShapeClass: MCmsShape);
   function ShapeClass: ImsShapeClass;
  end;//TmsShapeTestContext

  TmsAddTestLambda = reference to procedure (ATest: ITest);

  TmsShapeTestPrim = class abstract(TmsLoggedTest, ImsDiagrammsHolder)
  protected
   f_Context : TmsShapeTestContext;
   f_Coords : array of TPoint;
   f_UID: TmsShapeUID;
  protected
   procedure CreateDiagrammAndCheck(aCheck : TmsDiagrammCheck; const aName: String);
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); virtual;
   procedure ModifyDiagramm(const aDiagramm: ImsDiagramm); virtual;
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
   function ContextName: String;
   function InnerFolders: String; override;
   procedure TransformContext(var theContext: TmsShapeTestContext); virtual;
   constructor CreateInner(const aContext: TmsShapeTestContext);
   // ImsDiagrammsHolder
   procedure UpToParent;
   // - сигнализируем о том, что нам надо перейти к РОДИТЕЛЬСКОЙ диаграмме
   procedure SwapParents;
   // - сигнализируем о том, что надо ПОМЕНЯТЬ местами РОДИТЕЛЬСКИЕ диаграммы
   procedure Scroll(const aDirection: TPointF);
                 // ^ - не стесняйтесь ставить const перед записями.
                 //  Точнее ставьте ОБЯЗАТЕЛЬНО !!!2
   // - скроллинг диаграммы на дельту
   procedure ResetOrigin;
   // - восстанавливаем начальную систему координат
   function GenerateUID(const aShape: ImsShape): TmsShapeUID;
   function pm_GetCurrentDiagramms: ImsDiagrammsList;
   procedure pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
   procedure AddConnectorsToDiagramm(const aDiagramm: ImsDiagramm);
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

  TmsShapeWithConnectorTest = class(TmsCustomShapeTest)
  protected
   procedure TransformContext(var theContext: TmsShapeTestContext); override;
   procedure ModifyDiagramm(const aDiagramm: ImsDiagramm); override;
  end;//TmsShapeWithConnectorTest

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
  msCompletedShapeCreator,
  FMX.DUnit.msLog,
  Generics.Collections,
  msConnector
  ;

// TmsShapeTestPrim

function TmsShapeTestPrim.ShapeClass: MCmsShape;
begin
 Result := f_Context.ShapeClass;
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

constructor TmsShapeTestContext.Create(const aMethodName: string; aSeed: Integer; aDiagrammName: string; aShapesCount: Integer; const aShapeClass: MCmsShape);
begin
 rMethodName := aMethodName;
 rSeed := aSeed;
 rDiagrammName := aDiagrammName;
 rShapesCount := aShapesCount;
 rShapeClass := aShapeClass;
end;

function TmsShapeTestContext.ShapeClass: ImsShapeClass;
begin
 Result := rShapeClass;
end;

procedure TmsShapeTestPrim.SetUp;
var
 l_Index : Integer;
 l_X : Integer;
 l_Y : Integer;
begin
 f_UID := 0;
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

procedure TmsShapeTestPrim.ModifyDiagramm(const aDiagramm: ImsDiagramm);
begin
 // - ничего не делаем
end;

procedure TmsShapeTestPrim.CreateDiagrammWithShapeAndSaveAndCheck;
begin
 CreateDiagrammAndCheck(
  procedure (const aDiagramm : ImsDiagramm)
  var
   l_P : TPoint;
  begin
   for l_P in f_Coords do
    aDiagramm.AddShape(
     TmsCompletedShapeCreator.Create(Self.ShapeClass)
      .CreateShape(
       TmsMakeShapeContext.Create(
        TPointF.Create(l_P.X, l_P.Y),
        aDiagramm.ShapesController,
        Self
       )
      )
    )
    .AddNewDiagramm;

   ModifyDiagramm(aDiagramm);
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

procedure TmsShapeTestPrim.UpToParent;
begin
 Assert(false);
end;

procedure TmsShapeTestPrim.SwapParents;
begin
 Assert(false);
end;

procedure TmsShapeTestPrim.Scroll(const aDirection: TPointF);
begin
 Assert(false);
end;

procedure TmsShapeTestPrim.ResetOrigin;
begin
 Assert(false);
end;

function TmsShapeTestPrim.GenerateUID(const aShape: ImsShape): TmsShapeUID;
begin
 Inc(f_UID);
 Result := f_UID;
end;

function TmsShapeTestPrim.pm_GetCurrentDiagramms: ImsDiagrammsList;
begin
 Result := nil;
 Assert(false);
end;

procedure TmsShapeTestPrim.pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
begin
 Assert(false);
end;

procedure TmsShapeTestPrim.AddConnectorsToDiagramm(const aDiagramm: ImsDiagramm);
type
 TmsShapeList = TList<ImsShape>;
const
 cDelta = 10{20};
var
 l_PrevShape : ImsShape;
 l_Shape : ImsShape;
 l_A : TPointF;
 l_B : TPointF;
 l_Connector : ImsShape;
 l_Delta: Extended;
 l_List : TmsShapeList;
 l_R : TRectF;
begin
 l_PrevShape := nil;
 l_List := TmsShapeList.Create;
 try
  for l_Shape in aDiagramm do
  begin
   if (l_PrevShape <> nil) then
   begin
    // тут надо будет коннектор создать
    l_R := l_PrevShape.DrawBounds;
    l_Delta := Min((l_R.Width - 1) / 2, Min((l_R.Height - 1) / 2, cDelta));
    l_A := l_PrevShape.StartPoint + TPointF.Create(l_Delta, -l_Delta);
    l_R := l_Shape.DrawBounds;
    l_Delta := Min((l_R.Width - 1) / 2, Min((l_R.Height - 1) / 2, cDelta));
    l_B := l_Shape.StartPoint + TPointF.Create(-l_Delta, l_Delta);
    l_Connector := TmsConnector.CreateCompleted(l_A, l_B, aDiagramm.ShapesController, Self);
    l_List.Add(l_Connector);
    //aDiagramm.AddShape(l_Connector);
    l_Connector := nil;
    //l_PrevShape := l_Shape;
    l_PrevShape := nil;
   end//l_PrevShape <> nil
   else
    l_PrevShape := l_Shape;
  end;//for l_Shape

  for l_Shape in l_List do
   aDiagramm.AddShape(l_Shape);
 finally
  FreeAndNil(l_List);
 end;//try..finally
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
   Check(aDiagramm.Name = f_Context.rDiagrammName, 'Не совпадает имя диаграммы');
   Check(Length(f_Coords) = aDiagramm.ItemsCount, 'Не совпадает число примитивов');
   l_Index := 0;
   for l_Shape in aDiagramm do
   begin
    Check(Self.ShapeClass.IsOurInstance(l_Shape), 'Это не наш тип примитива');
    Check(l_Shape.StartPoint.X = f_Coords[l_Index].X, 'Координаты X не совпадают');
    Check(l_Shape.StartPoint.Y = f_Coords[l_Index].Y, 'Координаты Y не совпадают');
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
  l_Diagramms.Add(aDiagramm);
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

// TmsShapeWithConnectorTest

procedure TmsShapeWithConnectorTest.TransformContext(var theContext: TmsShapeTestContext);
begin
 inherited;
 theContext.rShapesCount := Min(theContext.rShapesCount, 6);
end;

procedure TmsShapeWithConnectorTest.ModifyDiagramm(const aDiagramm: ImsDiagramm);
begin
 inherited;
 if not f_Context.ShapeClass.IsLineLike then
  AddConnectorsToDiagramm(aDiagramm);
end;

end.

