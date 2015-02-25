unit msOurShapes;

interface

implementation

uses
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
  msRedRectangle,
  msGreenRectangle,
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
  msClass
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
  TmsTriangleDirectionRight,
  TmsRedRectangle,
  TmsGreenRectangle,

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
end;

initialization
 RegisterOurShapes;

end.
