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

  // SVG Shapes
  msFolder,

  // utility shapes
  msMover,
  msPicker,
  msUpToParent,
  msSwapParents,
  msShapeRemover,

  // shapes for toolbar buttons
  msMoverIcon
  ;

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

  // shapes for buttons
  TmsMoverIcon,

  // SVG Shapes
  TmsFolder,

  // concrete shapes
  TmsGreenCircle,
  TmsBlackTriangle,
  TmsBlackRectangle
 ]);
end;

initialization
 RegisterOurShapes;

end.
