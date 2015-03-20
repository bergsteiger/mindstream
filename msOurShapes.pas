unit msOurShapes;

interface

implementation

uses
  msInterfaces,
  msShape,
  msLine,
  msRectangle,
  msCircle,
  msTriangle,
  msLineWithArrow,
  msTriangleDirectionRight,
  msRegisteredShapes,
  msPolygonShape,
  msPointCircle,
  msFolder,
  msMover,
  msPicker,
  msUpToParent,
  msSwapParents,
  msShapeRemover,
  msMoverIcon,
  msRemoverIcon,
  msRemoveIcon,
  msMoveIcon,
  msTextShape,
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
  msAssociation,
  msDependency,
  msClass,
  msArrowHead,
  msSVGShape,
  msScrollShape,
  msScrollShapePrim
  ;

// Важно !!!
// Все новые примитивы добавлять в конец списка
procedure RegisterOurShapes;
begin
  // concrete shapes
  TmsLine.TMC;
  TmsRectangle.TMC.SetFillColor(TAlphaColorRec.White)
   .SetInitialHeight(90)
   .SetInitialWidth(100)
   .SetCornerRadius(0.0);
  TmsCircle.TMC
   .SetFillColor(TAlphaColorRec.Red)
   .SetInitialHeight(100)
   .SetInitialWidth(100)
   ;
  TmsRectangle.Specify('RoundedRectangle')
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
  TmsLineWithArrow.TMC;
  TmsTriangleDirectionRight.TMC
   .SetFillColor(TAlphaColorRec.Coral)
   ;

  TmsRectangle.Specify('RedRectangle')
   .SetFillColor(TAlphaColorRec.Red)
   .SetIsForToolbar(false)
   ;
  TmsRectangle.Specify('GreenRectangle')
   .SetFillColor(TAlphaColorRec.Green)
   .SetIsForToolbar(false)
   ;

  // special shapes
  TmsPointCircle.TMC
   .SetFillColor(TAlphaColorRec.Null)
   .SetIsForToolbar(false)
   .SetInitialWidth(20)
   .SetInitialHeight(20)
   ;
  TmsTriangleDirectionRight.Specify('SmallTriangle')
   .SetFillColor(TAlphaColorRec.Aquamarine)
   .SetInitialHeight(20)
   .SetIsForToolbar(false)
   ;

  // utility shapes
  TmsMover.TMC;
  TmsPicker.TMC;
  TmsUpToParent.TMC;
  TmsSwapParents.TMC;
  TmsShapeRemover.TMC;

  // SVG Shapes
  TmsSVGShape.NRTMC
   .SetFillColor(TAlphaColorRec.Azure);
  TmsFolder.TMC;

  TmsCircle.Specify('GreenCircle')
   .SetFillColor(TAlphaColorRec.Green)
   .SetIsForToolbar(false)
   ;
  TmsTriangle.Specify('BlackTriangle')
   .SetFillColor(TAlphaColorRec.Black)
   ;
  TmsRectangle.Specify('BlackRectangle')
   .SetFillColor(TAlphaColorRec.Black)
   .SetInitialHeight(100)
   .SetInitialWidth(15)
   .SetIsForToolbar(false)
   ;
  TmsRemoveIcon.TMC
   .SetFillColor(TAlphaColorRec.Mediumvioletred)
   .SetIsForToolbar(false)
   ;
  TmsMoveIcon.TMC
   .SetFillColor(TAlphaColorRec.Black)
   .SetIsForToolbar(false)
   ;
  TmsTextShape.TMC
   .SetFillColor(TAlphaColorRec.Black)
   .SetInitialHeight(14)
   .SetInitialWidth(21);
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

  TmsConnector.TMC;

  TmsConnector.Specify('Generalization')
   ;

  TmsConnector.Specify('Realization')
   .SetStrokeThickness(2)
   .SetStrokeDash(TStrokeDash.Dash)
   ;
  TmsAssociation.TMC
   .SetStrokeThickness(1.5)
   .SetStrokeDash(TStrokeDash.Solid)
   .SetStereotypePlace(TmsStereotypePlace.Center)
   ;
  TmsDependency.TMC
   .SetStrokeThickness(1.5)
   .SetStrokeDash(TStrokeDash.Dash)
   ;

  TmsClass.TMC
   .SetStereotypePlace(TmsStereotypePlace.OneThirty)
   ;

  TmsClass.Specify('Interface')
   .SetFillColor(TAlphaColorRec.Lightblue)
   ;
  TmsClass.Specify('MixIn')
   .SetFillColor(TAlphaColorRec.Lightgreen)
   ;

  TmsFolder.Specify('Library')
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

  TmsRectangle.Specify('Trivial')
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
  TmsClass.Specify('Method')
   .SetFillColor(TAlphaColorRec.Purple)
   ;
  TmsClass.Specify('Program')
   .SetFillColor(TAlphaColorRec.Lime)
   ;
  TmsDependency.Specify('uses');
  TmsDependency.Specify('friend');
  TmsDependency.Specify('injects');
  TmsAssociation.Specify('property');
  TmsAssociation.Specify('readonly');
  TmsAssociation.Specify('writeonly');

  TmsArrowHead.TMC
   .SetStrokeThickness(1.5)
   .SetInitialHeight(20)
   .SetIsForToolbar(false)
   ;

  TmsConnector.TMC
   .SetIsForToolbar(false)
   ;

  TmsShape.N('UseCaseLikeEllipse')
   .SetIsForToolbar(false)
   ;

  TmsShape.N('Trivial')
   .SetIsForToolbar(false)
   ;

  TmsFolder.TMC
   .SetIsForToolbar(false)
   ;

  TmsDependency.TMC
   .SetIsForToolbar(false)
   ;

  TmsCircle.TMC
   .SetIsForToolbar(false)
   ;

  TmsRectangle.TMC
   .SetIsForToolbar(false)
   ;

end;

initialization
 RegisterOurShapes;

end.
