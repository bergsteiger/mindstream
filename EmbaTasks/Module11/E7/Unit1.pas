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
    lblA: TLabel;
    edtA: TEdit;
    lblB: TLabel;
    edtB: TEdit;
    lblC: TLabel;
    edtC: TEdit;
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

uses
  Math;

procedure TfrmMain.btnDrawClick(Sender: TObject);
begin
  Draw;
end;

procedure TfrmMain.Draw;
var
  A, B, C : Integer;

  Angle : Double;

  pntA,
  pntB,
  pntC,
  pntCenter : TPoint;
begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  pntCenter.X := pbxEx.Width div 2;
  pntCenter.Y := pbxEx.Height div 2;

  A := StrToInt(edtA.Text);
  B := StrToInt(edtB.Text);
  C := StrToInt(edtC.Text);

  if (A + B <= C) or
     (A + C <= B) or
     (B + C <= A) then
    ShowMessage('Из этих отрезков нельзя построить треугольник')
  else
  begin
    pntA.X := pntCenter.X;
    pntA.Y := pntCenter.Y;
    pntC.X := pntCenter.X + C;
    pntC.Y := pntCenter.Y;

    Angle := ArcCos((B * B + C * C - A * A) / (2 * B * C));

    pntB.X := pntA.X + Round(B * cos(RadToDeg(Angle)));
    pntB.Y := pntB.Y - Round(B * sin(RadToDeg(Angle)));

    pbxEx.Canvas.MoveTo(pntA.X, pntA.Y);
    pbxEx.Canvas.LineTo(pntC.X, pntC.Y);
    pbxEx.Canvas.LineTo(pntB.X, pntB.Y);
    pbxEx.Canvas.LineTo(pntA.X, pntA.Y);
  end;
end;


end.
