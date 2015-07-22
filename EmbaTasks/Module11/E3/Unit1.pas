unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pbxEx: TPaintBox;
    pnlButtons: TPanel;
    btnDraw: TButton;
    edtSqureCount: TEdit;
    edtSquareSide: TEdit;
    lblScuareSide: TLabel;
    lblSquareCount: TLabel;
    procedure btnDrawClick(Sender: TObject);
  private
    { Private declarations }
    procedure Draw;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDrawClick(Sender: TObject);
begin
  Draw;
end;

procedure TfrmMain.Draw;
var
  PaintCenter,
  SquareTopLeft,
  SquareRightBottom : TPoint;

  SquareCount,
  SquareSide,
  Index : integer;
begin
  PaintCenter.X := pbxEx.Width div 2;
  PaintCenter.Y := pbxEx.Height div 2;

  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  pbxEx.Canvas.Brush.Color := clWhite;

  SquareCount := StrToInt(edtSqureCount.Text);
  SquareSide := StrToInt(edtSquareSide.Text);

  SquareTopLeft.X := 0;
  SquareTopLeft.Y := PaintCenter.Y;

  SquareRightBottom.X := 20;
  SquareRightBottom.Y := PaintCenter.Y + SquareSide;

  for Index := 0 to SquareCount  do
  begin
    SquareTopLeft.X := SquareSide * (Index - 1);
    SquareRightBottom.X := SquareTopLeft.X + SquareSide;

    pbxEx.Canvas.Rectangle(SquareTopLeft.X, SquareTopLeft.Y,
                           SquareRightBottom.X, SquareRightBottom.Y);
  end;


end;

end.
