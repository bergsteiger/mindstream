unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDrawness;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlMain: TPanel;
    pnlTop: TPanel;
    btnRect: TButton;
    imgMain: TImage;
    lblStartPoint: TLabel;
    edtStartPointX: TEdit;
    edtFinalPointX: TEdit;
    lblFinalPoint: TLabel;
    edtStartPointY: TEdit;
    edtFinalPointY: TEdit;
    btnAddLine: TButton;
    btnClearImage: TButton;
    btnDrawAll: TButton;
    cbbPrimitives: TComboBox;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRectClick(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure imgMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnAddLineClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure btnDrawAllClick(Sender: TObject);
  private
   FStartPos,
   FLastPoint : TPointF;
   FPressed: Boolean;
//   FShapeToDraw: TShapes;
   FDrawness: TmsDrawness;
   FIsFirstClick: Boolean;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;
implementation
uses
 msShape, msLine, msRectangle, msPointCircle, msRegisteredPrimitives;

{$R *.fmx}
procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 imgMain.Bitmap.Clear(TAlphaColorRec.White);
end;

procedure TfmMain.btnDrawAllClick(Sender: TObject);
begin
 FDrawness.DrawTo(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.btnAddLineClick(Sender: TObject);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint := TPointF.Create(StrToFloat(edtStartPointX.Text),
                                StrToFloat(edtStartPointY.Text));
 l_FinalPoint := TPointF.Create(StrToFloat(edtFinalPointX.Text),
                                StrToFloat(edtFinalPointY.Text));

// TmsRegisteredPrimitives.GetInstance.AddPrimitive();
 FDrawness.AddPrimitive(TmsLine.Create(l_StartPoint, l_FinalPoint));
 FDrawness.DrawTo(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.btnRectClick(Sender: TObject);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint := TPointF.Create(StrToFloat(edtStartPointX.Text),
                                StrToFloat(edtStartPointY.Text));
 l_FinalPoint := TPointF.Create(StrToFloat(edtFinalPointX.Text),
                                StrToFloat(edtFinalPointY.Text));
 FDrawness.AddPrimitive(TmsRectangle.Create(l_StartPoint, l_FinalPoint));
 FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 imgMain.Bitmap := TBitmap.Create(Round(pnlMain.Width), Round(pnlMain.Height));
 imgMain.Bitmap.Clear(TAlphaColorRec.White);

 //FShapeToDraw := sPen;

 FDrawness := TmsDrawness.Create;

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
{ if FPressed then
 begin
  ImgMain.Bitmap.Canvas.BeginScene;
  case FShapeToDraw of
   sPen:
   begin
    FDrawness.AddPrimitive(TmsLine.Create(FStartPos, TPointF.Create(X, Y)));
    FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);
    FStartPos := TPointF.Create(X, Y);
   end;
  end;
  ImgMain.Bitmap.Canvas.EndScene;
 end;                 }
end;


procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FPressed := True;
 FStartPos := TPointF.Create(X, Y);

 case cbbPrimitives.ItemIndex of
  0 : begin // Line
   if FIsFirstClick then FIsFirstClick := False
   else begin
    FIsFirstClick := True;
    FDrawness.AddPrimitive(TmsLine.Create(FStartPos, FLastPoint));
    FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);
   end;

   FDrawness.AddPrimitive(TmsPointCircle.Create(FStartPos, FLastPoint));
   FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);

   FLastPoint := TPointF.Create(X, Y);
  end;
  1 : begin
   FDrawness.AddPrimitive(TmsRectangle.Create(FStartPos, TPointF.Create(X+100, Y+100)));
   FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);
  end;
 end;
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
