unit msOurShapes;

interface

implementation

uses
  msInterfaces,
  msShape,
  msLine,
  msRectangleView,
  msCircle,
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
  msRectangularShape,
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
  msActor,
  msRectangle,
  msCircleView,
  msLineView,
  msPredefinedShapes
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
  TmsRectangularShape.Specify('Rectangle')
   .SetFillColor(TAlphaColorRec.White)
   .SetInitialHeight(90)
   .SetInitialWidth(100)
   .SetCornerRadius(0.0)
   .SetShapeView(TmsRectangleView.Create)
   ;
  TmsCircle.TMC
   .SetFillColor(TAlphaColorRec.Red)
   .SetInitialHeight(100)
   .SetInitialWidth(100)
   .SetShapeView(TmsCircleView.Create)
   ;
  TmsRectangle.MC.Specify('RoundedRectangle')
   .SetFillColor(TAlphaColorRec.Blue)
   .SetInitialHeight(90)
   .SetInitialWidth(90)
   .SetCornerRadius(10)
   .SetIsForToolbar(false)
   ;
  TmsCircle.Specify('UseCaseLikeEllipse')
   .SetFillColor(TAlphaColorRec.Yellow)
   .SetInitialHeight(70)
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

  TmsTriangleDirectionRight.Specify('SmallTriangle')
   .SetFillColor(TAlphaColorRec.Aquamarine)
   .SetInitialHeight(20)
   .SetIsForToolbar(false)
   ;

  TmsLineWithArrow.TMC
   .SetArrowHeadShapeMC(TmsShape.NamedMC('SmallTriangle'))
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
   TmsCircle.Specify('PointCircle')
    .SetFillColor(TAlphaColorRec.Null)
    .SetIsForToolbar(false)
    .SetInitialWidth(20)
    .SetInitialHeight(20)
    .AsMC
    ;
  // utility shapes
  TmsMover.TMC;
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

  TmsCircle.Specify('GreenCircle')
   .SetFillColor(TAlphaColorRec.Green)
   .SetIsForToolbar(false)
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
  TmsSVGShape.Specify('RemoveIcon')
   .SetFillColor(TAlphaColorRec.Mediumvioletred)
   .SetIsForToolbar(false)
   .SetSVGCode(
    'M 10,30 L 30,10 L 50,30 L 70,10 L 90,30 L 70,50 L 90,70' +
    'L 70,90 L 50,70 L 30,90 L 10,70 L 30,50 L 30,50 L 10,30'
   )
   ;
  TmsMoveIcon.TMC
   .SetFillColor(TAlphaColorRec.Black)
   .SetIsForToolbar(false)
   ;
  TmsRectangularShape.Specify('TextShape')
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

  TmsConnector.Specify('Association')
   .SetStrokeThickness(1.5)
   .SetStrokeDash(TStrokeDash.Solid)
   .SetStereotypePlace(TmsStereotypePlace.Center)
   .SetArrowHeadShapeMC(TmsArrowHead.MC)
   ;
  TmsShape.NamedMC('Association').Specify('Dependency')
   .SetStrokeThickness(1.5)
   .SetStrokeDash(TStrokeDash.Dash)
   ;

  TmsRectangle.MC.Specify('Class')
   .SetStereotypePlace(TmsStereotypePlace.OneThirty)
   .SetAdditionalLinesH([1 /3, 2 / 3])
   ;

  TmsShape.NamedMC('Class').Specify('Interface')
   .SetFillColor(TAlphaColorRec.Lightblue)
   ;
  TmsShape.NamedMC('Class').Specify('MixIn')
   .SetFillColor(TAlphaColorRec.Lightgreen)
   ;

  MCmsFolder.AsRef.Specify('Library')
   .SetStereotypePlace(TmsStereotypePlace.Center)
   ;

  TmsShape.NamedMC('Library').Specify('Project')
   .SetFillColor(TAlphaColorRec.Lightgreen)
   ;
  TmsShape.NamedMC('Library').Specify('Subsystem')
   .SetFillColor(TAlphaColorRec.Lightblue)
   ;

  TmsShape.NamedMC('UseCaseLikeEllipse').Specify('Usecase')
   .SetFillColor(TAlphaColorRec.Lightyellow)
   .SetStereotypePlace(TmsStereotypePlace.Bottom)
   ;

  TmsShape.NamedMC('Usecase').Specify('UsecaseRealization')
   .SetFillColor(TAlphaColorRec.Lightgreen)
   ;

  TmsRectangle.MC.Specify('Trivial')
   .SetInitialHeightScale( 1 / 3 * 2 )
   .SetStereotypePlace(TmsStereotypePlace.Center)
   ;

  TmsShape.NamedMC('Library').Specify('Layer')
   .SetFillColor(TAlphaColorRec.Lightgray)
   ;
  TmsShape.NamedMC('Trivial').Specify('Typedef')
   .SetFillColor(TAlphaColorRec.Gray)
   ;
  TmsShape.NamedMC('Trivial').Specify('Exception')
   .SetFillColor(TAlphaColorRec.Red)
   ;
  TmsShape.NamedMC('Class').Specify('Method')
   .SetFillColor(TAlphaColorRec.Purple)
   ;
  TmsShape.NamedMC('Class').Specify('Program')
   .SetFillColor(TAlphaColorRec.Lime)
   ;
  TmsShape.NamedMC('Dependency').Specify('uses');
  TmsShape.NamedMC('Dependency').Specify('friend');
  TmsShape.NamedMC('Dependency').Specify('injects');
  TmsShape.NamedMC('Association').Specify('property');
  TmsShape.NamedMC('Association').Specify('readonly');
  TmsShape.NamedMC('Association').Specify('writeonly');

  TmsConnector.TMC
   .SetIsForToolbar(false)
   ;

  TmsShape.N('UseCaseLikeEllipse')
   .SetIsForToolbar(false)
   ;

  TmsShape.N('Trivial')
   .SetIsForToolbar(false)
   ;

  MCmsFolder.AsRef.AsTuner
   .SetIsForToolbar(false)
   ;

  TmsShape.N('Dependency')
   .SetIsForToolbar(false)
   ;

  TmsCircle.TMC
   .SetIsForToolbar(false)
   ;

  TmsRectangle.MC.AsTuner
   .SetIsForToolbar(false)
   ;

  TmsShape.NamedMC('UsecaseRealization').Specify('UsecaseRealizationFake')
   .SetAdditionalLinesH([1 /3, 2 / 3])
   .SetIsForToolbar(false)
   ;

  TmsActor.TMC
   .SetInitialHeight(60)
   .SetInitialWidth(60 / 2)
   ;

  TmsActor.Specify('User')
   ;

  TmsActor.Specify('RedActor')
   .SetStrokeColor(TAlphaColorRec.Red)
   ;
end;

initialization
 RegisterOurShapes;

end.
