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
    lblNPoints: TLabel;
    edtNPoints: TEdit;
    lblCenterX: TLabel;
    edtCenterX: TEdit;
    lblCenterY: TLabel;
    edtCenterY: TEdit;
    lblRadius: TLabel;
    edtRadius: TEdit;
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
  Radius,
  NPoints : integer;

  LeftTop,
  RightBottom,
  CenterPoint,
  CirclePoint,
  StartPoint,
  EndPoint : TPoint;

  Angle : Double;
begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  Radius := StrToInt(edtRadius.Text);
  NPoints := StrToInt(edtNPoints.Text);
  CenterPoint.X := StrToInt(edtCenterX.Text);
  CenterPoint.Y := StrToInt(edtCenterY.Text);

  LeftTop.X := CenterPoint.X - Radius;
  LeftTop.Y := CenterPoint.Y - Radius;
  RightBottom.X := StrToInt(edtCenterX.Text) + Radius;
  RightBottom.Y := StrToInt(edtCenterY.Text) + Radius;

  StartPoint.X := CenterPoint.X - Radius;
  StartPoint.Y := CenterPoint.Y;

  Angle := 0;
  while Angle < (2 * PI) do
  begin
    EndPoint.X := CenterPoint.X + Round(Radius * cos(Angle));
    EndPoint.Y := CenterPoint.Y - Round(Radius * sin(Angle));

    pbxEx.Canvas.Pen.Color:= clBlack;
    pbxEx.Canvas.ArcTo(LeftTop.X, LeftTop.Y,
                       RightBottom.X, RightBottom.Y,
                       StartPoint.X, StartPoint.Y,
                       EndPoint.X, EndPoint.Y);


    pbxEx.Canvas.Pen.Color:= clRed;
    pbxEx.Canvas.MoveTo(EndPoint.X, EndPoint.Y);
    pbxEx.Canvas.LineTo(EndPoint.X + 1, EndPoint.Y + 1);

    StartPoint.X := EndPoint.X;
    StartPoint.Y := EndPoint.Y;
    Angle := Angle + ((2 * PI) / NPoints);
  end;

  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.MoveTo(StrToInt(edtCenterX.Text), StrToInt(edtCenterY.Text));
  pbxEx.Canvas.LineTo(StrToInt(edtCenterX.Text)+1, StrToInt(edtCenterY.Text)+1);
end;


end.
