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
   procedure TransformContext(var theContext: TmsShapeTestContext); override;
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
  end;//TmsConnectorDrawTest

implementation

uses
  System.Types,
  System.SysUtils,
  Math,
  Generics.Collections,

  msRegisteredShapes,
  TypInfo,

  msConnector,
  msPointCircle
  ;

// TTestSaveMoverToPNG

procedure TTestSaveMoverToPNG.TransformContext(var theContext: TmsShapeTestContext);
begin
 inherited;
 theContext.rShapesCount := Min(theContext.rShapesCount, 1);
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

procedure TmsMoverFloatingButtonsTest.MoverApplied(const aDiagramm: ImsDiagramm; const aShape: ImsShape; const aMover: ImsShape);
var
 l_ClickPoint : TPointF;
 l_Ctx : TmsEndShapeContext;
 l_S : ImsShape;
begin
 if (aMover <> nil) then
 begin
  l_ClickPoint := TmsMover.ButtonPoint(f_Button, aShape, true);
  l_Ctx := TmsEndShapeContext.Create(l_ClickPoint, aDiagramm.ShapesController, nil);

  CheckFalse(aShape.DrawBounds.Contains(l_ClickPoint), 'Фигура не должна содержать точку клика');
  aMover.EndTo(l_Ctx);
  CheckFalse(aShape.DrawBounds.Contains(l_ClickPoint), 'Видимо не попали в кнопку и фигура сместилась в точку клика');
  l_S := TmsPointCircle.Create(l_ClickPoint);
  Assert(l_S.StartPoint = l_ClickPoint);
  aDiagramm.AddShape(l_S);
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

procedure TmsConnectorDrawTest.TransformContext(var theContext: TmsShapeTestContext);
begin
 inherited;
 theContext.rShapesCount := Min(theContext.rShapesCount, 6);
end;

type
 TmsShapeList = TList<ImsShape>;

procedure TmsConnectorDrawTest.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
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
 if not f_Context.ShapeClass.IsLineLike then
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
     l_Connector := TmsConnector.CreateCompleted(l_A, l_B, aDiagramm.ShapesController);
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
 end;//not f_Context.ShapeClass.IsLineLike
 inherited;
end;

end.

