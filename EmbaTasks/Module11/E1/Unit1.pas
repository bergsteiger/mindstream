unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pbxEx: TPaintBox;
    pnlButtons: TPanel;
    btnSnowMan: TButton;
    edtLinesCount: TEdit;
    procedure btnSnowManClick(Sender: TObject);
  private
    { Private declarations }
    procedure DrawLines;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnSnowManClick(Sender: TObject);
begin
  DrawLines;
end;

procedure TfrmMain.DrawLines;
var
  Step, LineStartY : integer;
begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  Step := pbxEx.Height div StrToInt(edtLinesCount.Text);

  LineStartY := 0;
  while LineStartY < pbxEx.Height do
  begin
    LineStartY := LineStartY + Step;
    pbxEx.Canvas.MoveTo(0, LineStartY);
    pbxEx.Canvas.LineTo(pbxEx.Height, LineStartY);
  end;
end;

end.
