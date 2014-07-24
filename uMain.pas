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
   FIsFirstClick: Boolean;
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
 FDrawness.DrawTo(imgMain.Bitmap.Canvas, TPointF.Create(25, 25));
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

 FDrawness := TmsDrawness.Create;

 //Первое нажатие всегда первое :)
 FIsFirstClick := True;

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
 l_StartPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(X, Y);

 if FIsFirstClick then
 begin
  FIsFirstClick := False;
  FDrawness.AddPrimitive(l_StartPoint, l_StartPoint);
 end
 else
 begin
  FIsFirstClick := True;

  FDrawness.CurrentAddedShape.FinalPoint := TPointF.Create(X, Y);
 end;
 FDrawness.DrawTo(imgMain.Bitmap.Canvas, FOrigin);
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
