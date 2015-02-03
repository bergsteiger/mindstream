unit TestSaveMoverToPNG;

interface

uses
  TestFrameWork,
  msShapeTest,
  msInterfaces,
  TestSaveToPNG
  ;

type
  TTestSaveMoverToPNG = class(TTestSaveToPNG)
  protected
   procedure TransformContext(var theContext: TmsShapeTestContext); override;
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
   procedure MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape); virtual;
  end;//TTestSaveMoverToPNG

  TmsMoverFloatingButtonsTest = class(TTestSaveMoverToPNG)
  protected
   procedure MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape); override;
  end;//TmsMoverFloatingButtonsTest

implementation

uses
  msMover,
  msRegisteredShapes
  ;

// TTestSaveMoverToPNG

procedure TTestSaveMoverToPNG.TransformContext(var theContext: TmsShapeTestContext);
begin
 inherited;
 theContext.rShapesCount := 1;
end;

procedure TTestSaveMoverToPNG.MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape);
begin
end;

procedure TTestSaveMoverToPNG.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
var
 l_ShapeToDeal : ImsShape;
 l_Class : ImsShapeClass;
 l_Mover : ImsShape;
 l_Ctx : TmsMakeShapeContext;
begin
 Assert(aDiagramm.ItemsCount = f_Context.rShapesCount);
 l_ShapeToDeal := aDiagramm.FirstShape;
 l_Class := TmsRegisteredShapes.Instance.ByName(TmsMover.ClassName);
 Assert(l_Class <> nil);
 l_Ctx := TmsMakeShapeContext.Create(l_ShapeToDeal.StartPoint, aDiagramm.ShapesController, nil);
 l_Mover := l_Class.Creator.CreateShape(l_Ctx);
 MoverApplied(aDiagramm, l_ShapeToDeal, l_Mover);
 inherited;
end;

// TmsMoverFloatingButtonsTest

procedure TmsMoverFloatingButtonsTest.MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape);
begin
 inherited;
end;

end.

