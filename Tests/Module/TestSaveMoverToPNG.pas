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
  end;//TTestSaveMoverToPNG

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
 inherited;
end;

end.

