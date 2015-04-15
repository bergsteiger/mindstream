program FMX.DUnit;
uses
  FMX.Forms,
  u_fmGUITestRunner in 'u_fmGUITestRunner.pas' {fmGUITestRunner},
  u_FirstTest in 'u_FirstTest.pas',
  u_TCounter in 'u_TCounter.pas',
  u_SecondTest in 'u_SecondTest.pas',
  FMX.DUnit.Interfaces in 'FMX.DUnit.Interfaces.pas',
  FMX.DUnit.msAppLog in 'FMX.DUnit.msAppLog.pas',
  FMX.DUnit.msLog in 'FMX.DUnit.msLog.pas',
  FMX.DUnit.Utils in 'FMX.DUnit.Utils.pas';

{$R *.res}

begin
 Application.Initialize;
 u_fmGUITestRunner.RunRegisteredTestsModeless;
 Application.Run;
end.
