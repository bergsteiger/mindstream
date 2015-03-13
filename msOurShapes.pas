unit msOurShapes;

interface

implementation

uses
  msInterfaces,
  msLine,
  msRectangle,
  msCircle,
  msRoundedRectangle,
  msUseCaseLikeEllipse,
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
  msGeneralization,
  msRealization,
  msAssociation,
  msDependency,
  msClass,
  msLibrary,
  msUsecase,
  msTrivial,
  msArrowHead,
  msSVGShape
  ;

// Важно !!!
// Все новые примитивы добавлять в конец списка
procedure RegisterOurShapes;
begin
  // concrete shapes
  TmsLine.TMC;
  TmsRectangle.TMC.SetFillColor(TAlphaColorRec.White).SetInitialHeight(90);
  TmsCircle.TMC.SetFillColor(TAlphaColorRec.Red);
  TmsRoundedRectangle.TMC.SetFillColor(TAlphaColorRec.Blue).SetInitialHeight(90).SetInitialWidth(90);
  TmsUseCaseLikeEllipse.TMC.SetFillColor(TAlphaColorRec.Yellow);
  TmsTriangle.TMC.SetFillColor(TAlphaColorRec.Green).SetInitialHeight(100);
  TmsLine.Specify('DashDotLine').SetStrokeDash(TStrokeDash.DashDot);
  TmsLine.Specify('DashLine').SetStrokeDash(TStrokeDash.Dash);
  TmsLine.Specify('DotLine').SetStrokeDash(TStrokeDash.Dot);
  TmsLineWithArrow.TMC;
  TmsTriangleDirectionRight.TMC.SetFillColor(TAlphaColorRec.Coral);

  TmsRectangle.Specify('RedRectangle').SetFillColor(TAlphaColorRec.Red);
  TmsRectangle.Specify('GreenRectangle').SetFillColor(TAlphaColorRec.Green);

  // special shapes
  TmsPointCircle.TMC.SetFillColor(TAlphaColorRec.Null);
  TmsTriangleDirectionRight.Specify('SmallTriangle').SetFillColor(TAlphaColorRec.Aquamarine).SetInitialHeight(20);

  // utility shapes
  TmsMover.TMC;
  TmsPicker.TMC;
  TmsUpToParent.TMC;
  TmsSwapParents.TMC;
  TmsShapeRemover.TMC;

  // SVG Shapes
  TmsSVGShape.NRTMC.SetFillColor(TAlphaColorRec.Azure);
  TmsFolder.TMC;

  TmsCircle.Specify('GreenCircle').SetFillColor(TAlphaColorRec.Green);
  TmsTriangle.Specify('BlackTriangle').SetFillColor(TAlphaColorRec.Black);
  TmsRectangle.Specify('BlackRectangle').SetFillColor(TAlphaColorRec.Black).SetInitialHeight(100).SetInitialWidth(15);
  TmsRemoveIcon.TMC.SetFillColor(TAlphaColorRec.Mediumvioletred);
  TmsMoveIcon.TMC.SetFillColor(TAlphaColorRec.Black);
  TmsTextShape.TMC.SetFillColor(TAlphaColorRec.Black).SetInitialHeight(14).SetInitialWidth(21);
  // - вообще говоря это НАДО вычислять из параметров шрифта. НО! ПОТОМ!
  TmsScrollShapeUp.TMC;
  TmsScrollShapeDown.TMC;
  TmsScrollShapeRight.TMC;
  TmsScrollShapeLeft.TMC;
  TmsScrollShapeUpLeft.TMC;
  TmsScrollShapeUpRight.TMC;
  TmsScrollShapeDownLeft.TMC;
  TmsScrollShapeDownRight.TMC;
  TmsScrollShapeResetOrigin.TMC;

  TmsScrollingTool.TMC;

  TmsConnector.TMC;
  TmsGeneralization.TMC;
  TmsRealization.TMC.SetStrokeThickness(2).SetStrokeDash(TStrokeDash.Dash);
  TmsAssociation.TMC.SetStrokeThickness(1.5).SetStrokeDash(TStrokeDash.Solid);
  TmsDependency.TMC.SetStrokeThickness(1.5).SetStrokeDash(TStrokeDash.Dash);

  TmsClass.TMC;

  TmsClass.Specify('Interface').SetFillColor(TAlphaColorRec.Lightblue);
  TmsClass.Specify('MixIn').SetFillColor(TAlphaColorRec.Lightgreen);

  TmsLibrary.TMC;

  TmsLibrary.Specify('Project').SetFillColor(TAlphaColorRec.Lightgreen);
  TmsLibrary.Specify('Subsystem').SetFillColor(TAlphaColorRec.Lightblue);

  TmsUsecase.TMC.SetFillColor(TAlphaColorRec.Lightyellow);

  TmsUsecase.Specify('UsecaseRealization').SetFillColor(TAlphaColorRec.Lightgreen);

  TmsTrivial.TMC.SetInitialHeightScale( 1 / 3 * 2);

  TmsLibrary.Specify('Layer').SetFillColor(TAlphaColorRec.Lightgray);
  TmsTrivial.Specify('Typedef').SetFillColor(TAlphaColorRec.Gray);
  TmsTrivial.Specify('Exception').SetFillColor(TAlphaColorRec.Red);
  TmsClass.Specify('Method').SetFillColor(TAlphaColorRec.Purple);
  TmsClass.Specify('Program').SetFillColor(TAlphaColorRec.Lime);
  TmsDependency.Specify('uses');
  TmsDependency.Specify('friend');
  TmsDependency.Specify('injects');
  TmsAssociation.Specify('property');
  TmsAssociation.Specify('readonly');
  TmsAssociation.Specify('writeonly');

  TmsArrowHead.TMC.SetStrokeThickness(1.5).SetInitialHeight(20);
end;

initialization
 RegisterOurShapes;

end.
