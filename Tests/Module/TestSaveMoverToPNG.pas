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
   function TestNamePrefix: String; override;
   constructor CreateInner(aButton : TmsFloatingButton; const aContext: TmsShapeTestContext);
  public
   class procedure AddTest(aContext: TmsShapeTestContext; aLambda: TmsAddTestLambda); override;
   class function Create(aButton : TmsFloatingButton; const aContext: TmsShapeTestContext): ITest;
  end;//TmsMoverFloatingButtonsTest

  TmsConnectorDrawTest = class(TTestSaveToPNG)
   // https://bitbucket.org/ingword/mindstream/issue/167/connector
  protected
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
  end;//TmsConnectorDrawTest

implementation

uses
  System.Types,

  msRegisteredShapes,
  TypInfo,

  msConnector
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
 if (l_Mover <> nil) then
 begin
  l_Mover.MouseUp(TmsEndShapeContext.Create(l_ShapeToDeal.StartPoint, aDiagramm.ShapesController, nil));
  MoverApplied(aDiagramm, l_ShapeToDeal, l_Mover);
 end;//l_Mover <> nil
 inherited;
end;

// TmsMoverFloatingButtonsTest

procedure TmsMoverFloatingButtonsTest.MoverApplied(const aDiagramm: ImsDiagramm; const aShape :ImsShape; const aMover: ImsShape);
var
 l_ClickPoint : TPointF;
 l_Ctx : TmsEndShapeContext;
begin
 if (aMover <> nil) then
 begin
  l_ClickPoint := TmsMover.ButtonPoint(f_Button, aShape);
  l_Ctx := TmsEndShapeContext.Create(l_ClickPoint, aDiagramm.ShapesController, nil);
  aMover.EndTo(l_Ctx);
 end;//aMover <> nil
 inherited;
end;

function TmsMoverFloatingButtonsTest.TestNamePrefix: String;
begin
 Result := GetEnumName(TypeInfo(TmsFloatingButton), Ord(f_Button)) + '_' +  inherited;
end;

class procedure TmsMoverFloatingButtonsTest.AddTest(aContext: TmsShapeTestContext; aLambda: TmsAddTestLambda);
var
 l_Button : TmsFloatingButton;
begin
 for l_Button := Low(TmsFloatingButton) to High(TmsFloatingButton) do
  aLambda(Self.Create(l_Button, aContext));
end;

constructor TmsMoverFloatingButtonsTest.CreateInner(aButton : TmsFloatingButton; const aContext: TmsShapeTestContext);
begin
 f_Button := aButton;
 inherited CreateInner(aContext);
end;

class function TmsMoverFloatingButtonsTest.Create(aButton : TmsFloatingButton; const aContext: TmsShapeTestContext): ITest;
begin
 Result := CreateInner(aButton, aContext);
end;

// TmsConnectorDrawTest

procedure TmsConnectorDrawTest.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
var
 l_PrevShape : ImsShape;
 l_Shape : ImsShape;
begin
 l_PrevShape := nil;
 for l_Shape in aDiagramm do
 begin
  if (l_PrevShape <> nil) then
  begin
   // тут надо будет коннектор создать
   l_PrevShape := nil;
  end//l_PrevShape <> nil
  else
   l_PrevShape := l_Shape;
 end;//for l_Shape
 inherited;
end;

end.

