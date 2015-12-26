program Parser;

uses
  Vcl.Forms,
  GUITestRunner,
  uMain in 'uMain.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  GUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
