unit msOurShapes;

interface
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
  msMover,
  msRegisteredShapes
  ;

implementation

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
  TmsMover
 ]);
end;

initialization
 RegisterOurShapes;

end.
