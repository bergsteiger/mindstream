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
    tmrDrawStars: TTimer;
    tmrDieStars: TTimer;
    procedure btnSnowManClick(Sender: TObject);
    procedure tmrDrawStarsTimer(Sender: TObject);
    procedure tmrDieStarsTimer(Sender: TObject);
  private
    { Private declarations }
    procedure Draw;
  public
    { Public declarations }
  end;

const
  c_ArrayLength = 50;
  c_TimerInterval = 50;

var
  frmMain: TfrmMain;
  StarsArray : array [1..c_ArrayLength] of TPoint;

implementation

{$R *.dfm}

procedure TfrmMain.btnSnowManClick(Sender: TObject);
begin
  Draw;
end;

procedure TfrmMain.Draw;
var
  Rect : TRect;
begin
  // Draw Sky
  pbxEx.Canvas.Brush.Color := clBlack;
  pbxEx.Canvas.FillRect(TRect.Create(0, 0, pbxEx.Width, pbxEx.Height));

  tmrDrawStars.Enabled := True;
  tmrDrawStars.Interval := c_TimerInterval;
  tmrDieStars.Interval := c_TimerInterval;
end;

procedure TfrmMain.tmrDieStarsTimer(Sender: TObject);
var
  i : integer;
begin
  i := random((c_ArrayLength - 1) + c_ArrayLength);
  pbxEx.Canvas.Pixels[StarsArray[i].X, StarsArray[i].Y] := clBlack;

  StarsArray[i].X := 0;
  StarsArray[i].Y := 0;
end;

procedure TfrmMain.tmrDrawStarsTimer(Sender: TObject);
var
  StarPoint : TPoint;
  i : integer;
begin
  StarPoint.X := Random((pbxEx.Width - 0) + pbxEx.Width);
  StarPoint.Y := Random((pbxEx.Height - 0) + pbxEx.Height);

  for i := 1 to c_ArrayLength do
    if (StarsArray[i].X = 0) and (StarsArray[i].Y = 0) then
    begin
      StarsArray[i] := StarPoint;
      pbxEx.Canvas.Pixels[StarPoint.X, StarPoint.Y] := clWhite;
      Exit;
    end;

  if (StarsArray[c_ArrayLength].X <> 0) and (StarsArray[c_ArrayLength].Y <> 0) then
    tmrDieStars.Enabled := True;
end;

end.
