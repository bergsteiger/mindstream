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
  Radius : integer;
  LeftTop, RightBottom : TPoint;
begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  Radius := StrToInt(edtRadius.Text);
  LeftTop.X := StrToInt(edtCenterX.Text) - Radius;
  LeftTop.Y := StrToInt(edtCenterY.Text) - Radius;

  RightBottom.X := StrToInt(edtCenterX.Text) + Radius;
  RightBottom.Y := StrToInt(edtCenterY.Text) + Radius;

  pbxEx.Canvas.Ellipse(LeftTop.X, LeftTop.Y,
                       RightBottom.X, RightBottom.Y);
end;


end.
