unit TestSaveMoverToPNG;

interface

uses
  TestFrameWork,
  msShapeTest,
  msInterfaces,
  TestSaveToPNG,
  msMover
  ;

type
  TTestSaveMoverToPNG = class(TTestSaveToPNG)
  protected
   procedure TransformContext(var theContext: TmsShapeTestContext); override;
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
   procedure MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape); virtual;
  end;//TTestSaveMoverToPNG

  TmsMoverFloatingButtonsTest = class(TTestSaveMoverToPNG)
  private
   f_Button : TmsFloatingButton;
  protected
   procedure MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape); override;
   function ContextName: String; override;
  public
   class procedure AddTest(aContext: TmsShapeTestContext; aLambda: TmsAddTestLambda); override;
  end;//TmsMoverFloatingButtonsTest

implementation

uses
  System.Types,

  msRegisteredShapes,
  TypInfo
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
var
 l_ClickPoint : TPointF;
 l_Ctx : TmsEndShapeContext;
begin
 f_Button := ms_fbLeft;
 if (aMover <> nil) then
 begin
  l_ClickPoint := TmsMover.ButtonPoint(f_Button, aShape);
  l_Ctx := TmsEndShapeContext.Create(l_ClickPoint, aDiagramm.ShapesController, nil);
  aMover.EndTo(l_Ctx);
 end;//aMover <> nil
 inherited;
end;

function TmsMoverFloatingButtonsTest.ContextName: String;
begin
 Result := GetEnumName(TypeInfo(TmsFloatingButton), Ord(f_Button)) + '_' +  inherited;
end;

class procedure TmsMoverFloatingButtonsTest.AddTest(aContext: TmsShapeTestContext; aLambda: TmsAddTestLambda);
begin
 inherited;
end;

end.

