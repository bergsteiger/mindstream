unit msOurShapes;

interface

implementation

uses
  System.UITypes,
  msLine,
  msRectangle,
  msCircle,
  msRoundedRectangle,
  msUseCaseLikeEllipse,
  msTriangle,
  msDashDotLine,
  msDashLine,
  msDotLine,
  msLineWithArrow,
  msTriangleDirectionRight,
  msRegisteredShapes,
  msPolygonShape,
  msBlackRectangle,
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
  msTrivial
  ;

// Важно !!!
// Все новые примитивы добавлять в конец списка
procedure RegisterOurShapes;
begin
 TmsRegisteredShapes.Instance.RegisterMC([
  // concrete shapes
  TmsLine.MC,
  TmsRectangle.TMC.SetFillColor(TAlphaColorRec.White),
  TmsCircle.TMC.SetFillColor(TAlphaColorRec.Red),
  TmsRoundedRectangle.TMC.SetFillColor(TAlphaColorRec.Blue),
  TmsUseCaseLikeEllipse.TMC.SetFillColor(TAlphaColorRec.Yellow),
  TmsTriangle.TMC.SetFillColor(TAlphaColorRec.Green),
  TmsDashDotLine.MC,
  TmsDashLine.MC,
  TmsDotLine.MC,
  TmsLineWithArrow.MC,
  TmsTriangleDirectionRight.TMC.SetFillColor(TAlphaColorRec.Coral),

  TmsRectangle.Specify('RedRectangle').SetFillColor(TAlphaColorRec.Red),
  TmsRectangle.Specify('GreenRectangle').SetFillColor(TAlphaColorRec.Green),

  // special shapes
  TmsPointCircle.TMC.SetFillColor(TAlphaColorRec.Null),
  TmsTriangleDirectionRight.Specify('SmallTriangle').SetFillColor(TAlphaColorRec.Aquamarine).SetInitialHeight(20),

  // utility shapes
  TmsMover.MC,
  TmsPicker.MC,
  TmsUpToParent.MC,
  TmsSwapParents.MC,
  TmsShapeRemover.MC,

  // SVG Shapes
  TmsFolder.MC,

  TmsCircle.Specify('GreenCircle').SetFillColor(TAlphaColorRec.Green),
  TmsTriangle.Specify('BlackTriangle').SetFillColor(TAlphaColorRec.Black),
  TmsBlackRectangle.MC,
  TmsRemoveIcon.TMC.SetFillColor(TAlphaColorRec.Mediumvioletred),
  TmsMoveIcon.TMC.SetFillColor(TAlphaColorRec.Black),
  TmsTextShape.TMC.SetFillColor(TAlphaColorRec.Black),
  TmsScrollShapeUp.MC,
  TmsScrollShapeDown.MC,
  TmsScrollShapeRight.MC,
  TmsScrollShapeLeft.MC,
  TmsScrollShapeUpLeft.MC,
  TmsScrollShapeUpRight.MC,
  TmsScrollShapeDownLeft.MC,
  TmsScrollShapeDownRight.MC,
  TmsScrollShapeResetOrigin.MC,

  TmsScrollingTool.MC,

  TmsConnector.MC,
  TmsGeneralization.MC,
  TmsRealization.MC,
  TmsAssociation.MC,
  TmsDependency.MC,

  TmsClass.MC,

  TmsClass.Specify('Interface').SetFillColor(TAlphaColorRec.Lightblue),
  TmsClass.Specify('MixIn').SetFillColor(TAlphaColorRec.Lightgreen),

  TmsLibrary.MC,

  TmsLibrary.Specify('Project').SetFillColor(TAlphaColorRec.Lightgreen),
  TmsLibrary.Specify('Subsystem').SetFillColor(TAlphaColorRec.Lightblue),

  TmsUsecase.TMC.SetFillColor(TAlphaColorRec.Lightyellow),

  TmsUsecase.Specify('UsecaseRealization').SetFillColor(TAlphaColorRec.Lightgreen),

  TmsTrivial.MC,

  TmsLibrary.Specify('Layer').SetFillColor(TAlphaColorRec.Lightgray),
  TmsTrivial.Specify('Typedef').SetFillColor(TAlphaColorRec.Gray),
  TmsTrivial.Specify('Exception').SetFillColor(TAlphaColorRec.Red),
  TmsClass.Specify('Method').SetFillColor(TAlphaColorRec.Purple),
  TmsClass.Specify('Program').SetFillColor(TAlphaColorRec.Lime),
  TmsDependency.Specify('uses'),
  TmsDependency.Specify('friend'),
  TmsDependency.Specify('injects'),
  TmsAssociation.Specify('property'),
  TmsAssociation.Specify('readonly'),
  TmsAssociation.Specify('writeonly')
 ]);
end;

initialization
 RegisterOurShapes;

end.
