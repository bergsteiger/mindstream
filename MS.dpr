program MS;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  msMain_Form in 'msMain_Form.pas' {msMainForm},
  msLine,
  msRectangle,
  msCircle,
  msUseCaseLikeEllipse,
  msRoundedRectangle,
  msTriangle,
  msDashDotLine in 'msDashDotLine.pas',
  msDashLine in 'msDashLine.pas',
  msDotLine in 'msDotLine.pas',
  msLineWithArrow in 'msLineWithArrow.pas',
  msOurShapes
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmsMainForm, msMainForm);
  Application.Run;
end.
