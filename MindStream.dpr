program MindStream;

uses
  FMX.Forms,
  uMain in 'uMain.pas' {fmMain},
  msDrawness in 'msDrawness.pas',
  msShape in 'msShape.pas',
  msRegisteredPrimitives in 'msRegisteredPrimitives.pas',
  msLine in 'msLine.pas',
  msRectangle in 'msRectangle.pas',
  msPointCircle in 'msPointCircle.pas',
  msCircle in 'msCircle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
