unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlMain: TPanel;
    pnlTop: TPanel;
    btnRect: TButton;
    btnArc: TButton;
    imgMain: TImage;
    btnDrawLine: TSpeedButton;
    lblMouseCoorinats: TLabel;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRectClick(Sender: TObject);
    procedure btnArcClick(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
   FPoints : array of TPointF;
   FStartPos: TPointF;
   FPressed: Boolean;
//   imgMain : TImage;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;
implementation

{$R *.fmx}

procedure TfmMain.btnArcClick(Sender: TObject);
var
  p1, p2: TPointF;
begin
 // Sets the center of the arc
 p1 := TPointF.Create(200, 200);
 // sets the radius of the arc
 p2 := TPointF.Create(150, 150);
 imgMain.Bitmap.Canvas.BeginScene;
 // draws the arc on the canvas
 imgMain.Bitmap.Canvas.DrawArc(p1, p2, 90, 230, 20);
 // updates the bitmap to show the arc
 imgMain.Bitmap.Canvas.EndScene;
end;

procedure TfmMain.btnRectClick(Sender: TObject);
begin
  // sets the rectangle to be drawed
 imgMain.Bitmap.Canvas.BeginScene;
 imgMain.Bitmap.Canvas.DrawRect(TRectF.Create(10, 10, 200, 270),
                                30, 60,
                                AllCorners, 100,
                                TCornerType.ctRound);
 imgMain.Bitmap.Canvas.EndScene;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
// imgMain := TImage.Create(self);
 imgMain.Bitmap := TBitmap.Create(Round(pnlMain.Width), Round(pnlMain.Height));
 imgMain.Bitmap.Clear(TAlphaColorRec.White);
 imgMain.AutoCapture := True;
end;

procedure TfmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 lblMouseCoorinats.Text := 'x = ' + FloatToStr(X) + ';' + ' y = ' + FloatToStr(Y);
end;

procedure TfmMain.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FPressed := False;
end;

procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
 i : integer;
 l_PointsCount : Integer;
begin
 FPressed := True;
 FStartPos := TPointF.Create(X, Y);

 i := High(FPoints)+1;
 SetLength(FPoints,i+1);
 FPoints[i].X := x;
 FPoints[i].y := y;

 lblMouseCoorinats.Text := 'x = ' + FloatToStr(X) + ';' + ' y = ' + FloatToStr(Y);

// FPoints[i].X := x + pnlTop.Width;
// FPoints[i].y := y + pnlTop.Height;
 // sets the rectangle to be drawed
 //l_Rect := TRectF.Create(0, 0, 200, 270);
 // imgMainPaint(self, imgMain.Canvas, l_Rect);
 l_PointsCount := High(FPoints);
 if l_PointsCount < 0 then Exit;
// if (l_PointsCount mod 2) = 0 then Exit;
 with ImgMain.Bitmap.Canvas do
 begin
  BeginScene;
  //DrawEllipse(TRectF.Create(FPoints[0]), 20);

  if l_PointsCount > 0 then
  begin
   for l_PointsCount := 1 to l_PointsCount do
    DrawLine(FPoints[l_PointsCount-1], FPoints[l_PointsCount], 20);
  end;
  EndScene;
 end;
end;

procedure TfmMain.miAboutClick(Sender: TObject);
begin
 ShowMessage(self.Caption);
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
 self.Close;
end;

end.
