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
  msTriangle1,
  msMover
  ;

implementation

procedure RegisterOurShapes;
begin
 TmsLine.Register;
 TmsRectangle.Register;
 TmsCircle.Register;
 TmsRoundedRectangle.Register;
 TmsUseCaseLikeEllipse.Register;
 TmsTriangle.Register;
end;

initialization
 RegisterOurShapes;

end.
