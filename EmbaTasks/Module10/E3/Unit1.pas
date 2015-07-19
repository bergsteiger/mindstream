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
    edtColumnCount: TEdit;
    edtRowCount: TEdit;
    lblRow: TLabel;
    lblColumn: TLabel;
    procedure btnDrawClick(Sender: TObject);
  private
    { Private declarations }
    procedure DrawSnowMan;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDrawClick(Sender: TObject);
begin
  DrawSnowMan;
end;

procedure TfrmMain.DrawSnowMan;
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

  SquareCount := StrToInt(edtColumnCount.Text);
  SquareSide := StrToInt(edtRowCount.Text);

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
