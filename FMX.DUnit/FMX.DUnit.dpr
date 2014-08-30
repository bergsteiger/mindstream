program FMX.DUnit;

uses
  FMX.Forms,
  u_fmGUITestRunner in 'u_fmGUITestRunner.pas' {fmGUITestRunner};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmGUITestRunner, fmGUITestRunner);
  Application.Run;
end.
