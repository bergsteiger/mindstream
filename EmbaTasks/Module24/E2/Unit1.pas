unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    btnStart: TButton;
    lbl1: TLabel;
    edtFileName: TEdit;
    lblResult: TLabel;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  IsCountDown : boolean;

implementation

{$R *.dfm}

procedure TfmMain.btnStartClick(Sender: TObject);
var
  FileText : TextFile;
  Line, MinLine : string;
  MinLength : Integer;
begin
  AssignFile(FileText, edtFileName.Text);
  Reset(FileText);

  Readln(FileText, Line);
  MinLength := Length(Line);
  MinLine := Line;

  while not EOF(FileText) do
  begin
    Readln(FileText, Line);
    if Length(Line) <= MinLength then
    begin
      MinLength := Length(Line);
      MinLine := Line;
    end;
  end;

  lblResult.Caption := MinLine;

  CloseFile(FileText);
end;

end.
