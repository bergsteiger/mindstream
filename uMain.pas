unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDiagramm;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
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
    procedure imgMainResize(Sender: TObject);
  private
   FDiagramm: TmsDiagramm;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

implementation

uses
 msShape
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagramm.Clear;
end;

procedure TfmMain.btnDrawAllClick(Sender: TObject);
begin
 FDiagramm.Invalidate;
end;

procedure TfmMain.cbbPrimitivesChange(Sender: TObject);
begin
 FDiagramm.CurrentClass := RmsShape(cbbPrimitives.Items.Objects[cbbPrimitives.ItemIndex]);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 imgMain.Bitmap := TBitmap.Create(Round(imgMain.Width), Round(imgMain.Height));
 imgMain.Bitmap.Clear(TAlphaColorRec.Null);

 FDiagramm := TmsDiagramm.Create(imgMain.Bitmap.Canvas);

 FDiagramm.AllowedShapesToList(cbbPrimitives.Items);

 cbbPrimitivesChange(nil);
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDiagramm);
end;

procedure TfmMain.imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 Caption := 'x = ' + FloatToStr(X) + '; y = ' + FloatToStr(Y);
end;

procedure TfmMain.imgMainResize(Sender: TObject);
begin
 FDiagramm.ResizeTo(imgMain);
end;

procedure TfmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 FDiagramm.ProcessClick(TPointF.Create(X, Y));
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
