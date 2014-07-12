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
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRectClick(Sender: TObject);
    procedure btnArcClick(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMainPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
   FObjects : array of TRectangle;
   FPoints : array of TPointF;
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
var
  l_Rect: TRectF;
begin
  // sets the rectangle to be drawed
 l_Rect := TRectF.Create(10, 10, 200, 270);
 imgMain.Bitmap.Canvas.BeginScene;
 imgMain.Bitmap.Canvas.DrawRect(l_Rect, 30, 60, AllCorners, 100, TCornerType.ctInnerLine);
 imgMain.Bitmap.Canvas.EndScene;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
// imgMain := TImage.Create(self);
 imgMain.Bitmap := TBitmap.Create(400, 400);
 imgMain.Bitmap.Clear(TAlphaColorRec.White);
end;

procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
 i : integer;
 l_Rect: TRectF;
begin
 i := High(FPoints)+1;
 SetLength(FPoints,i+1);
 FPoints[i].X := x;
 FPoints[i].y := y;
  // sets the rectangle to be drawed
 l_Rect := TRectF.Create(10, 10, 200, 270);
 imgMainPaint(self, imgMain.Canvas, l_Rect);
end;

procedure TfmMain.imgMainPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
 K : Integer;
 l_point1, l_point2 : TPointf;
begin
 K := High(FPoints);
 if K < 0 then Exit;

 with ImgMain.Bitmap.Canvas do
 begin
  BeginScene;
  DrawEllipse(TRectF.Create(FPoints[0]), 20);

  if K > 0 then
  begin
   DrawEllipse(TRectF.Create(FPoints[k]), 20);

{   with FPoints[0] do
    MoveTo(X, Y);  }

   for K := 1 to K do
    DrawLine(FPoints[0], FPoints[k], 20);
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
