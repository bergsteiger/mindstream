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

  // utility shapes
  msMover,
  msPicker,

  // special shapes
  msPointCircle,
  msSmallTriangle
  ;

procedure RegisterOurShapes;
begin
 TmsRegisteredShapes.Instance.Register([
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
  TmsPicker
 ]);
end;

initialization
 RegisterOurShapes;

end.
