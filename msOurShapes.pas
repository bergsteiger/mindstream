﻿unit msOurShapes;

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
 TmsRegisteredShapes.Instance.Register([
  // concrete shapes
  TmsLine,
  TmsRectangle,
  TmsCircle,
  TmsRoundedRectangle,
  TmsUseCaseLikeEllipse,
  TmsTriangle,
  TmsDashDotLine,
  TmsDashLine,
  TmsDotLine,
  TmsLineWithArrow,
  TmsTriangleDirectionRight
 ]);

 TmsRegisteredShapes.Instance.RegisterMC([
  TmsRectangle.Specify('RedRectangle').SetFillColor(TAlphaColorRec.Red),
  TmsRectangle.Specify('GreenRectangle').SetFillColor(TAlphaColorRec.Green)
 ]);

 TmsRegisteredShapes.Instance.Register([
  // special shapes
  TmsPointCircle,
  TmsSmallTriangle,

  // utility shapes
  TmsMover,
  TmsPicker,
  TmsUpToParent,
  TmsSwapParents,
  TmsShapeRemover,

  // SVG Shapes
  TmsFolder,

  TmsGreenCircle,
  TmsBlackTriangle,
  TmsBlackRectangle,
  TmsRemoveIcon,
  TmsMoveIcon,
  TmsTextShape,
  TmsScrollShapeUp,
  TmsScrollShapeDown,
  TmsScrollShapeRight,
  TmsScrollShapeLeft,
  TmsScrollShapeUpLeft,
  TmsScrollShapeUpRight,
  TmsScrollShapeDownLeft,
  TmsScrollShapeDownRight,
  TmsScrollShapeResetOrigin,

  TmsScrollingTool,

  TmsConnector,
  TmsGeneralization,
  TmsRealization,
  TmsAssociation,
  TmsDependency,

  TmsClass
 ]);

 TmsRegisteredShapes.Instance.RegisterMC([
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
