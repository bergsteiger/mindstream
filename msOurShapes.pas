unit msOurShapes;

interface

implementation

uses
  msInterfaces,
  msShape,
  msLine,
  msRectangleView,
  msTriangle,
  msLineWithArrow,
  msTriangleDirectionRight,
  msRegisteredShapes,
  msPolygonShape,
  msMover,
  msPicker,
  msUpToParent,
  msSwapParents,
  msShapeRemover,
  msMoverIcon,
  msRemoverIcon,
  msMoveIcon,
  msTextShapeView,
  msScrollShapeUp,
  msScrollShapeDown,
  msScrollShapeRight,
  msScrollShapeLeft,
  msScrollShapeUpLeft,
  msScrollShapeUpRight,
  msScrollShapeDownLeft,
  msScrollShapeDownRight,
  msScrollShapeResetOrigin,
  msScrollingTool,
  msConnector,
  msArrowHead,
  msSVGShape,
  msScrollShape,
  msScrollShapePrim,
  msRectangle,
  msCircleView,
  msLineView,
  msPredefinedShapes,
  msActorView,
  msPointedShape,
  msScrollingToolView,
  msMoverView,
  msPolylineShape,
  msPolygonShapeView,
  msPolylineShapeView
  ;

// Важно !!!
// Все новые примитивы добавлять в конец списка
procedure RegisterOurShapes;
begin
  // concrete shapes
  TmsLine.TMC
   .SetIsForToolbar(false)
   .SetShapeView(TmsLineView.Create)
   ;
  MCmsRectangle :=
   TmsPointedShape.Specify('Rectangle')
    .SetFillColor(TAlphaColorRec.White)
    .SetInitialHeight(90)
    .SetInitialWidth(100)
    .SetCornerRadius(0.0)
    .SetShapeView(TmsRectangleView.Create)
    .AsMC
    ;

  MCmsCircle :=
   TmsPointedShape.Specify('Circle')
    .SetFillColor(TAlphaColorRec.Red)
    .SetInitialHeight(100)
    .SetInitialWidth(100)
    .SetShapeView(TmsCircleView.Create)
    .AsMC
    ;

  TmsRectangle.MC.Specify('RoundedRectangle')
   .SetFillColor(TAlphaColorRec.Blue)
   .SetInitialHeight(90)
   .SetInitialWidth(90)
   .SetCornerRadius(10)
   .SetIsForToolbar(false)
   ;

  MCmsUseCaseLikeEllipse :=
   MCmsCircle.AsRef.Specify('UseCaseLikeEllipse')
    .SetFillColor(TAlphaColorRec.Yellow)
    .SetInitialHeight(70)
    .AsMC
    ;

  TmsPolygonShape.NRTMC
   .SetShapeView(TmsPolygonShapeView.Create)
   ;

  TmsPolylineShape.NRTMC
   .SetShapeView(TmsPolylineShapeView.Create)
   ;

  TmsTriangle.TMC
   .SetFillColor(TAlphaColorRec.Green)
   .SetInitialHeight(100)
   .SetIsForToolbar(false)
   ;
  TmsLine.Specify('DashDotLine')
   .SetStrokeDash(TStrokeDash.DashDot)
   ;
  TmsLine.Specify('DashLine')
   .SetStrokeDash(TStrokeDash.Dash)
   ;
  TmsLine.Specify('DotLine')
   .SetStrokeDash(TStrokeDash.Dot)
   ;
  TmsTriangleDirectionRight.TMC
   .SetFillColor(TAlphaColorRec.Coral)
   ;

  MCmsSmallTriangle :=
   TmsTriangleDirectionRight.Specify('SmallTriangle')
    .SetFillColor(TAlphaColorRec.Aquamarine)
    .SetInitialHeight(20)
    .SetIsForToolbar(false)
    .AsMC
    ;

  TmsLineWithArrow.TMC
   .SetArrowHeadShapeMC(MCmsSmallTriangle)
   ;

  TmsRectangle.MC.Specify('RedRectangle')
   .SetFillColor(TAlphaColorRec.Red)
   .SetIsForToolbar(false)
   ;
  TmsRectangle.MC.Specify('GreenRectangle')
   .SetFillColor(TAlphaColorRec.Green)
   .SetIsForToolbar(false)
   ;

  // special shapes
  MCmsPointCircle :=
   MCmsCircle.AsRef.Specify('PointCircle')
    .SetFillColor(TAlphaColorRec.Null)
    .SetIsForToolbar(false)
    .SetInitialWidth(20)
    .SetInitialHeight(20)
    .AsMC
    ;
  // utility shapes

  TmsMover.TMC
   .SetShapeView(TmsMoverView.Create)
   ;

  TmsPicker.TMC;
  TmsUpToParent.TMC;
  TmsSwapParents.TMC
   .SetIsForToolbar(false)
   ;
  TmsShapeRemover.TMC;

  // SVG Shapes
  TmsSVGShape.NRTMC
   .SetFillColor(TAlphaColorRec.Azure);

  MCmsFolder :=
   TmsSVGShape.Specify('Folder')
    .SetSVGCode(
     'M 0, 20, L 100, 20, L 100, 90, L 0, 90, L 0, 20' +
     // begin UHO
     'L 0, 0' +
     'L 40, 0' +
     'L 40, 19.9' +
     'L 1.9, 19.9'
    )
    .AsMC
    ;
 
  MCmsGreenCircle :=
   MCmsCircle.AsRef.Specify('GreenCircle')
    .SetFillColor(TAlphaColorRec.Green)
    .SetIsForToolbar(false)
    .AsMC
    ;

  TmsTriangle.Specify('BlackTriangle')
   .SetFillColor(TAlphaColorRec.Black)
   ;
  TmsRectangle.MC.Specify('BlackRectangle')
   .SetFillColor(TAlphaColorRec.Black)
   .SetInitialHeight(100)
   .SetInitialWidth(15)
   .SetIsForToolbar(false)
   ;
  MCmsRemoveIcon :=
   TmsSVGShape.Specify('RemoveIcon')
    .SetFillColor(TAlphaColorRec.Mediumvioletred)
    .SetIsForToolbar(false)
    .SetSVGCode(
     'M 10,30 L 30,10 L 50,30 L 70,10 L 90,30 L 70,50 L 90,70' +
     'L 70,90 L 50,70 L 30,90 L 10,70 L 30,50 L 30,50 L 10,30'
    )
    .AsMC
    ;
  TmsMoveIcon.TMC
   .SetFillColor(TAlphaColorRec.Black)
   .SetIsForToolbar(false)
   ;
  TmsPointedShape.Specify('TextShape')
   .SetFillColor(TAlphaColorRec.Black)
   .SetInitialHeight(14)
   .SetInitialWidth(21)
   .SetText('ABC')
   .SetShapeView(TmsTextShapeView.Create)
   ;
  // - вообще говоря это НАДО вычислять из параметров шрифта. НО! ПОТОМ!

  TmsScrollShapePrim.NRTMC
   .SetIsForToolbar(false)
   ;
  TmsScrollShape.NRTMC
   .SetIsForToolbar(false)
   ;
  TmsScrollShapeUp.TMC;
  TmsScrollShapeDown.TMC;
  TmsScrollShapeRight.TMC;
  TmsScrollShapeLeft.TMC;
  TmsScrollShapeUpLeft.TMC;
  TmsScrollShapeUpRight.TMC;
  TmsScrollShapeDownLeft.TMC;
  TmsScrollShapeDownRight.TMC;
  TmsScrollShapeResetOrigin.TMC;

  TmsScrollingTool.TMC
//   .SetIsForToolbar(false)
   .SetShapeView(TmsScrollingToolView.Create)
   ;

  TmsConnector.TMC
   .SetIsForToolbar(true)
   ;

  TmsConnector.Specify('Generalization')
   ;

  TmsConnector.Specify('Realization')
   .SetStrokeThickness(2)
   .SetStrokeDash(TStrokeDash.Dash)
   ;

  TmsArrowHead.TMC
   .SetStrokeThickness(1.5)
   .SetInitialHeight(20)
   .SetIsForToolbar(false)
   ;

  MCmsAssociation :=
   TmsConnector.Specify('Association')
    .SetStrokeThickness(1.5)
    .SetStrokeDash(TStrokeDash.Solid)
    .SetStereotypePlace(TmsStereotypePlace.Center)
    .SetArrowHeadShapeMC(TmsArrowHead.MC)
    .AsMC
    ;

  MCmsDependency :=
   MCmsAssociation.AsRef.Specify('Dependency')
    .SetStrokeThickness(1.5)
    .SetStrokeDash(TStrokeDash.Dash)
    .AsMC
    ;

  MCmsClass :=
   TmsRectangle.MC.Specify('Class')
    .SetStereotypePlace(TmsStereotypePlace.OneThirty)
    .SetAdditionalLinesH([1 /3, 2 / 3])
    .AsMC
    ;

  MCmsClass.AsRef.Specify('Interface')
   .SetFillColor(TAlphaColorRec.Lightblue)
   ;

  MCmsClass.AsRef.Specify('MixIn')
   .SetFillColor(TAlphaColorRec.Lightgreen)
   ;

  MCmsLibrary :=
   MCmsFolder.AsRef.Specify('Library')
    .SetStereotypePlace(TmsStereotypePlace.Center)
    .AsMC
    ;

  MCmsLibrary.AsRef.Specify('Project')
   .SetFillColor(TAlphaColorRec.Lightgreen)
   ;

  MCmsLibrary.AsRef.Specify('Subsystem')
   .SetFillColor(TAlphaColorRec.Lightblue)
   ;

  MCmsUsecase :=
   MCmsUseCaseLikeEllipse.AsRef.Specify('Usecase')
    .SetFillColor(TAlphaColorRec.Lightyellow)
    .SetStereotypePlace(TmsStereotypePlace.Bottom)
    .AsMC
    ;

  MCmsUsecaseRealization :=
   MCmsUsecase.AsRef.Specify('UsecaseRealization')
    .SetFillColor(TAlphaColorRec.Lightgreen)
    .AsMC
    ;

  MCmsTrivial :=
   TmsRectangle.MC.Specify('Trivial')
    .SetInitialHeightScale( 1 / 3 * 2 )
    .SetStereotypePlace(TmsStereotypePlace.Center)
    .AsMC
    ;

  MCmsLibrary.AsRef.Specify('Layer')
   .SetFillColor(TAlphaColorRec.Lightgray)
   ;
  MCmsTrivial.AsRef.Specify('Typedef')
   .SetFillColor(TAlphaColorRec.Gray)
   ;
  MCmsTrivial.AsRef.Specify('Exception')
   .SetFillColor(TAlphaColorRec.Red)
   ;

  MCmsClass.AsRef.Specify('Method')
   .SetFillColor(TAlphaColorRec.Purple)
   ;

  MCmsClass.AsRef.Specify('Program')
   .SetFillColor(TAlphaColorRec.Lime)
   ;

  MCmsDependency.AsRef.Specify('uses');
  MCmsDependency.AsRef.Specify('friend');
  MCmsDependency.AsRef.Specify('injects');

  MCmsAssociation.AsRef.Specify('property');
  MCmsAssociation.AsRef.Specify('readonly');
  MCmsAssociation.AsRef.Specify('writeonly');

  TmsConnector.TMC
   .SetIsForToolbar(false)
   ;

  MCmsUseCaseLikeEllipse.AsRef.AsTuner
   .SetIsForToolbar(false)
   ;

  MCmsTrivial.AsRef.AsTuner
   .SetIsForToolbar(false)
   ;

  MCmsFolder.AsRef.AsTuner
   .SetIsForToolbar(false)
   ;

  MCmsDependency.AsRef.AsTuner
   .SetIsForToolbar(false)
   ;

  MCmsCircle.AsRef.AsTuner
   .SetIsForToolbar(false)
   ;

  TmsRectangle.MC.AsTuner
   .SetIsForToolbar(false)
   ;

  MCmsUsecaseRealization.AsRef.Specify('UsecaseRealizationFake')
   .SetAdditionalLinesH([1 /3, 2 / 3])
   .SetIsForToolbar(false)
   ;

  MCmsActor :=
   TmsPointedShape.Specify('msActor')
    .SetInitialHeight(60)
    .SetInitialWidth(60 / 2)
    .SetShapeView(TmsActorView.Create)
    .AsMC
    ;

  MCmsActor.AsRef.Specify('User')
   ;

  MCmsActor.AsRef.Specify('RedActor')
   .SetStrokeColor(TAlphaColorRec.Red)
   ;
end;

initialization
 RegisterOurShapes;

end.
