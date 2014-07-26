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
  msTriangle
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmsMainForm, msMainForm);
  Application.Run;
end.
