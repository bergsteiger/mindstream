program Parser;

uses
  Vcl.Forms,
  GUITestRunner,
  uMain in 'uMain.pas' {Form6},
  TestParser in 'Tests\TestParser.pas',
  uNewParser in 'uNewParser.pas',
  l3Parser in '..\l3Parser\l3Parser.pas',
  uL3ParserVsNewParser in 'uL3ParserVsNewParser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  GUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
