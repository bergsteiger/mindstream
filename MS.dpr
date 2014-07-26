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
  msDotLine in 'msDotLine.pas'
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmsMainForm, msMainForm);
  Application.Run;
end.
