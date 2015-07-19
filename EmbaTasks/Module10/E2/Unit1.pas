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
    procedure btnDrawClick(Sender: TObject);
  private
    { Private declarations }
    procedure DrawHouse;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDrawClick(Sender: TObject);
begin
  DrawHouse;
end;

procedure TfrmMain.DrawHouse;
var
  Center : TPoint;
begin
  Center.X := pbxEx.Width div 2;
  Center.Y := pbxEx.Height div 2;

  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  // Draw wall
  pbxEx.Canvas.Brush.Color := clMoneyGreen;
  pbxEx.Canvas.Rectangle(100, 200, 300, 400);

  // Draw roof
  pbxEx.Canvas.MoveTo(100, 200);
  pbxEx.Canvas.LineTo(200, 50);
  pbxEx.Canvas.LineTo(300, 200);

  pbxEx.Canvas.Brush.Color := clGray;
  pbxEx.Canvas.Rectangle(170, 220, 240, 300);

  pbxEx.Canvas.MoveTo(170, 250);
  pbxEx.Canvas.LineTo(240, 250);
  pbxEx.Canvas.MoveTo(200, 220);
  pbxEx.Canvas.LineTo(200, 300);

  //Draw stairs
  pbxEx.Canvas.Brush.Color := clTeal;
  pbxEx.Canvas.Rectangle(300, 360, 320, 400);
  pbxEx.Canvas.Rectangle(320, 380, 340, 400);
  pbxEx.Canvas.Rectangle(340, 400, 360, 400);
end;

end.
