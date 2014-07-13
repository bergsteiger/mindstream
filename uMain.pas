unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus;

type
 TShapes = (sPen, sLine);
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
    btnPen: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRectClick(Sender: TObject);
    procedure btnArcClick(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnPenClick(Sender: TObject);
    procedure imgMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnDrawLineClick(Sender: TObject);
  private
   FPoints : array of TPointF;
   FStartPos: TPointF;
   FPressed: Boolean;
   FShapeToDraw: TShapes;
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

procedure TfmMain.btnDrawLineClick(Sender: TObject);
begin
 FShapeToDraw := sLine;
end;

procedure TfmMain.btnPenClick(Sender: TObject);
begin
 FShapeToDraw := sPen;
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
 //imgMain.AutoCapture := True;
 FShapeToDraw := sPen;
end;

procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
 i : integer;
 l_PointsCount : Integer;
begin
{Рисует ломаную линию

 i := High(FPoints)+1;
 SetLength(FPoints,i+1);
 FPoints[i].X := x;
 FPoints[i].y := y;

 lblMouseCoorinats.Text := 'x = ' + FloatToStr(X) + ';' + ' y = ' + FloatToStr(Y);

 l_PointsCount := High(FPoints);
 if l_PointsCount < 0 then Exit;
 with ImgMain.Bitmap.Canvas do
 begin
  BeginScene;

  if l_PointsCount > 0 then
  begin
   for l_PointsCount := 1 to l_PointsCount do
    DrawLine(FPoints[l_PointsCount-1], FPoints[l_PointsCount], 20);
  end;
  EndScene;
 end;            }
 FPressed := True;
 FStartPos := TPointF.Create(X, Y);
end;

procedure TfmMain.imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 Caption := 'x = ' + FloatToStr(X) + '; y = ' + FloatToStr(Y);
 if FPressed then
 begin
  ImgMain.Bitmap.Canvas.BeginScene;
  case FShapeToDraw of
   sPen:
   begin
    ImgMain.Bitmap.Canvas.DrawLine(FStartPos, TPointF.Create(X, Y), 20);
    FStartPos := TPointF.Create(X, Y);
   end;
   sLine : begin
    ImgMain.Bitmap.Canvas.DrawLine(FStartPos, TPointF.Create(X, Y), 20);
   end;
  end;
  ImgMain.Bitmap.Canvas.EndScene;
 end;
end;

procedure TfmMain.imgMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FPressed := False;

 case FShapeToDraw of
  sLine : ImgMain.Bitmap.Canvas.DrawLine(FStartPos, TPointF.Create(X, Y), 20);
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
