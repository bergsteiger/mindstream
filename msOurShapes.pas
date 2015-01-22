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

  // utility shapes
  msMover,
  msPicker,
  msUpToParent,
  msSwapParents,
  msShapeRemover,

  // special shapes
  msPointCircle,
  msSmallTriangle,
  msGreenCircle,

  // shapes for toolbar buttons
  msMoverIcon,

  // SVG Shapes
  msFolder
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

  // concrete shapes
  TmsGreenCircle,

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
  TmsBlackTriangle,
  TmsBlackRectangle
 ]);
end;

initialization
 RegisterOurShapes;

end.
