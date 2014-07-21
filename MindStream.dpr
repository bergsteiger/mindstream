program MindStream;

uses
  FMX.Forms,
  uMain in 'uMain.pas' {fmMain},
  Drawness in 'Drawness.pas',
  msShape in 'msShape.pas',
  msRegisteredPrimitives in 'msRegisteredPrimitives.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
