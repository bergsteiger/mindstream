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
    procedure btnSnowManClick(Sender: TObject);
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

procedure TfrmMain.btnSnowManClick(Sender: TObject);
begin
  DrawSnowMan;
end;

procedure TfrmMain.DrawSnowMan;
var
  PictureCenter : TPoint;
  CircleDiameter : integer;
begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;
  pbxEx.Canvas.Brush.Color := clWhite;

  PictureCenter.X := pbxEx.Width div 2;
  PictureCenter.Y := pbxEx.Height div 2;

  // First Circle
  CircleDiameter := 100;
  pbxEx.Canvas.Ellipse(PictureCenter.X - (CircleDiameter div 2), 300 - (CircleDiameter div 2),
                       PictureCenter.X + (CircleDiameter div 2), 300 + (CircleDiameter div 2));

  // Second Circle
  CircleDiameter := 80;
  pbxEx.Canvas.Ellipse(PictureCenter.X - (CircleDiameter div 2), 210 - (CircleDiameter div 2),
                       PictureCenter.X + (CircleDiameter div 2), 210 + (CircleDiameter div 2));

  // Third Circle
  CircleDiameter := 60;
  pbxEx.Canvas.Ellipse(PictureCenter.X - (CircleDiameter div 2), 140 - (CircleDiameter div 2),
                       PictureCenter.X + (CircleDiameter div 2), 140 + (CircleDiameter div 2));

  pbxEx.Canvas.MoveTo();
  //pbxEx.Canvas.LineTo(Center.X, Center.Y);
end;

end.
