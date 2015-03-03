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
  msBlackTriangle,
  msBlackRectangle,
  msGreenCircle,
  msPointCircle,
  msSmallTriangle,
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
  TmsRectangle.MC,
  TmsCircle.MC,
  TmsRoundedRectangle.MC,
  TmsUseCaseLikeEllipse.MC,
  TmsTriangle.MC,
  TmsDashDotLine.MC,
  TmsDashLine.MC,
  TmsDotLine.MC,
  TmsLineWithArrow.MC,
  TmsTriangleDirectionRight.MC,

  TmsRectangle.Specify('RedRectangle').SetFillColor(TAlphaColorRec.Red),
  TmsRectangle.Specify('GreenRectangle').SetFillColor(TAlphaColorRec.Green)
 ]);

 TmsRegisteredShapes.Instance.RegisterMC([
  // special shapes
  TmsPointCircle.MC,
  TmsSmallTriangle.MC,

  // utility shapes
  TmsMover.MC,
  TmsPicker.MC,
  TmsUpToParent.MC,
  TmsSwapParents.MC,
  TmsShapeRemover.MC,

  // SVG Shapes
  TmsFolder.MC,

  TmsGreenCircle.MC,
  TmsBlackTriangle.MC,
  TmsBlackRectangle.MC,
  TmsRemoveIcon.MC,
  TmsMoveIcon.MC,
  TmsTextShape.MC,
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

  TmsUsecase.MC,

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
