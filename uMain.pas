unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit,
  Drawness;

type
 TShapes = (sPen, sLine);
 TPointsList = TList<TPointF>;
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlMain: TPanel;
    pnlTop: TPanel;
    btnRect: TButton;
    imgMain: TImage;
    btnDrawLine: TSpeedButton;
    btnPen: TButton;
    lblStartPoint: TLabel;
    edtStartPointX: TEdit;
    edtFinalPointX: TEdit;
    lblFinalPoint: TLabel;
    edtStartPointY: TEdit;
    edtFinalPointY: TEdit;
    btnAddLine: TButton;
    btnClearImage: TButton;
    btnDrawAll: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRectClick(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnPenClick(Sender: TObject);
    procedure imgMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnDrawLineClick(Sender: TObject);
    procedure btnAddLineClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure btnDrawAllClick(Sender: TObject);
  private
   FPoints : array of TPointF;
   FStartPos: TPointF;
   FPressed: Boolean;
   FShapeToDraw: TShapes;
   FDrawness: TDrawness;
   FLastPointList: TPointsList;
   FIsFirstClick: Boolean;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;
implementation

{$R *.fmx}
procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 imgMain.Bitmap.Clear(TAlphaColorRec.White);
end;

procedure TfmMain.btnDrawAllClick(Sender: TObject);
begin
 FDrawness.DrawTo(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.btnDrawLineClick(Sender: TObject);
begin
 FShapeToDraw := sLine;
end;

procedure TfmMain.btnPenClick(Sender: TObject);
begin
 FShapeToDraw := sPen;
end;

procedure TfmMain.btnAddLineClick(Sender: TObject);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint := TPointF.Create(StrToFloat(edtStartPointX.Text),
                                StrToFloat(edtStartPointY.Text));
 l_FinalPoint := TPointF.Create(StrToFloat(edtFinalPointX.Text),
                                StrToFloat(edtFinalPointY.Text));

 FDrawness.ShapeList.Add(TLine.Create(l_StartPoint, l_FinalPoint));
 FDrawness.ShapeList.Last.DrawTo(imgMain.Bitmap.Canvas);

 FDrawness.ShapeList.Add(TPointRound.Create(l_StartPoint, l_FinalPoint));
 FDrawness.ShapeList.Last.DrawTo(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.btnRectClick(Sender: TObject);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint := TPointF.Create(StrToFloat(edtStartPointX.Text),
                                StrToFloat(edtStartPointY.Text));
 l_FinalPoint := TPointF.Create(StrToFloat(edtFinalPointX.Text),
                                StrToFloat(edtFinalPointY.Text));
 FDrawness.ShapeList.Add(TRectangle.Create(l_StartPoint, l_FinalPoint));
 FDrawness.ShapeList.Last.DrawTo(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 imgMain.Bitmap := TBitmap.Create(Round(pnlMain.Width), Round(pnlMain.Height));
 imgMain.Bitmap.Clear(TAlphaColorRec.White);

 FShapeToDraw := sPen;

 FDrawness := TDrawness.Create;

 FLastPointList := TPointsList.Create();

 //Первое нажатие всегда первое :)
 FIsFirstClick := True;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDrawness);
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
    ImgMain.Bitmap.Canvas.DrawLine(FStartPos, TPointF.Create(X, Y), 1);
    FStartPos := TPointF.Create(X, Y);
   end;
  end;
  ImgMain.Bitmap.Canvas.EndScene;
 end;
end;


procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FPressed := True;
 FStartPos := TPointF.Create(X, Y);

 if FIsFirstClick then
 begin
  FIsFirstClick := False;

  case FShapeToDraw of
  sLine :
  begin
   FLastPointList.Add(TPointF.Create(X, Y));
  end;
 end;
 end
 else
 begin
  FIsFirstClick := True;

  FDrawness.ShapeList.Add(TLine.Create(FLastPointList.Last, FStartPos));
  FDrawness.ShapeList.Last.DrawTo(imgMain.Bitmap.Canvas);
  FLastPointList.Add(TPointF.Create(X, Y));
 end;

 FDrawness.ShapeList.Add(TPointRound.Create(FLastPointList.Last, FStartPos));
 FDrawness.ShapeList.Last.DrawTo(imgMain.Bitmap.Canvas);

end;

procedure TfmMain.imgMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FPressed := False;
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
