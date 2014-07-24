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
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure btnDrawAllClick(Sender: TObject);
    procedure cbbPrimitivesChange(Sender: TObject);
  private
   FOrigin : TPointF;
   FDrawness: TmsDrawness;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

 implementation

uses
 msShape, msLine, msRectangle, msPointCircle;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDrawness.Clear(imgMain.Bitmap.Canvas);
end;

procedure TfmMain.btnDrawAllClick(Sender: TObject);
begin
 FDrawness.Invalidate;
end;

procedure TfmMain.cbbPrimitivesChange(Sender: TObject);
begin
 FDrawness.CurrentClass := RmsShape(cbbPrimitives.items.Objects[cbbPrimitives.ItemIndex]);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
 i : Integer;
begin
 imgMain.Bitmap := TBitmap.Create(Round(pnlMain.Width), Round(pnlMain.Height));
 imgMain.Bitmap.Clear(TAlphaColorRec.White);
 FOrigin := TPointF.Create(0,0);

 FDrawness := TmsDrawness.Create(imgMain.Bitmap.Canvas);

 //Первое нажатие всегда первое :)

 for i := 0 to TmsRegisteredPrimitives.GetInstance.PrimitivesCount-1 do
  cbbPrimitives.Items.AddObject(TmsRegisteredPrimitives.GetInstance.Primitives[i].ClassName,
                                TObject(TmsRegisteredPrimitives.GetInstance.Primitives[i]));

 cbbPrimitivesChange(nil);
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
 l_ClickPoint : TPointF;
begin
 l_ClickPoint := TPointF.Create(X, Y);

 if FDrawness.ShapeFinalized then
 // - мы НЕ ДОБАВЛЯЛИ примитива - надо его ДОБАВИТЬ
  FDrawness.AddPrimitive(l_ClickPoint, l_ClickPoint)
 else
  FDrawness.FinalizeCurrentShape(l_ClickPoint);
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
