unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDrawness, msRegisteredPrimitives;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlMain: TPanel;
    pnlTop: TPanel;
    imgMain: TImage;
    btnClearImage: TButton;
    btnDrawAll: TButton;
    cbbPrimitives: TComboBox;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure imgMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure btnDrawAllClick(Sender: TObject);
  private
   FStartPos,
   FLastPoint : TPointF;
   FPressed: Boolean;
   FDrawness: TmsDrawness;
   FIsFirstClick: Boolean;
   function GetCurrentClass : RmsShape;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

 implementation

uses
 msShape, msLine, msRectangle, msPointCircle;

{$R *.fmx}

function TfmMain.GetCurrentClass: RmsShape;
begin
 Result := RmsShape(cbbPrimitives.items.Objects[cbbPrimitives.ItemIndex])
end;

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 imgMain.Bitmap.Clear(TAlphaColorRec.White);
end;

procedure TfmMain.btnDrawAllClick(Sender: TObject);
begin
 FDrawness.DrawTo(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
 i : Integer;
begin
 imgMain.Bitmap := TBitmap.Create(Round(pnlMain.Width), Round(pnlMain.Height));
 imgMain.Bitmap.Clear(TAlphaColorRec.White);

 FDrawness := TmsDrawness.Create;

 //Первое нажатие всегда первое :)
 FIsFirstClick := True;

 for i := 0 to TmsRegisteredPrimitives.GetInstance.PrimitivesCount-1 do
  cbbPrimitives.Items.AddObject(TmsRegisteredPrimitives.GetInstance.Primitives[i].ClassName,
                                TObject(TmsRegisteredPrimitives.GetInstance.Primitives[i]));

end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDrawness);
end;

procedure TfmMain.imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 Caption := 'x = ' + FloatToStr(X) + '; y = ' + FloatToStr(Y);
end;


procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
 ShapeObject : TmsShape;
begin
 FPressed := True;
 FStartPos := TPointF.Create(X, Y);

 if GetCurrentClass.IsNeedsSecondClick then
 begin
  if FIsFirstClick then FIsFirstClick := False
  else
  begin
   FIsFirstClick := True;
   ShapeObject := GetCurrentClass.Create(FStartPos, FLastPoint);
   FDrawness.AddPrimitive(ShapeObject);
   FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);
  end;
  FLastPoint := TPointF.Create(X, Y);
 end else
 begin
  ShapeObject := GetCurrentClass.Create(FStartPos, FLastPoint);
  FDrawness.AddPrimitive(ShapeObject);
  FDrawness.DrawLastPrimitive(imgMain.Bitmap.Canvas);
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
