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
    edtNCircles: TEdit;
    edtMinRadius: TEdit;
    lblMinRadius: TLabel;
    lblNCircles: TLabel;
    lblMaxRadius: TLabel;
    edtMaxRadius: TEdit;
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
  PaintCenter : TPoint;

  CircleCount,
  MaxRadius,
  MinRadius,
  RadiusStep,
  Index : integer;
begin
  PaintCenter.X := pbxEx.Width div 2;
  PaintCenter.Y := pbxEx.Height div 2;

  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  CircleCount := StrToInt(edtNCircles.Text);
  MaxRadius := StrToInt(edtMaxRadius.Text);
  MinRadius := StrToInt(edtMinRadius.Text);

  RadiusStep := (MaxRadius - MinRadius) div CircleCount;

  for Index := CircleCount downto 1 do
  begin
    pbxEx.Canvas.Ellipse(PaintCenter.X - RadiusStep * Index,
                         PaintCenter.Y - RadiusStep * Index,
                         PaintCenter.X + RadiusStep * Index,
                         PaintCenter.Y + RadiusStep * Index);
  end;

end;


end.
