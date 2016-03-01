program ScriptEngine;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form6},
  tfwScriptEngineEX in '..\l3Parser\ScriptEngine\tfwScriptEngineEX.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
