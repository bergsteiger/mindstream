unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDiagramm,

  msDiagramms
  ;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlTop: TPanel;
    imgMain: TImage;
    btnClearImage: TButton;
    cbShapes: TComboBox;
    cbDiagramm: TComboBox;
    btAddDiagramm: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure cbShapesChange(Sender: TObject);
    procedure imgMainResize(Sender: TObject);
    procedure btAddDiagrammClick(Sender: TObject);
    procedure cbDiagrammChange(Sender: TObject);
  private
   FDiagramm: TmsDiagramms;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

implementation

{$R *.fmx}

procedure TfmMain.btAddDiagrammClick(Sender: TObject);
begin
 FDiagramm.AddDiagramm(imgMain, cbDiagramm.Items);
 cbDiagramm.ItemIndex := FDiagramm.CurrentDiagrammIndex;
 cbShapes.ItemIndex := FDiagramm.CurrentShapeClassIndex;
end;

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagramm.Clear;
end;

procedure TfmMain.cbShapesChange(Sender: TObject);
begin
 FDiagramm.SelectShape(cbShapes.Items, cbShapes.ItemIndex);
end;

procedure TfmMain.cbDiagrammChange(Sender: TObject);
begin
 FDiagramm.SelectDiagramm(cbDiagramm.ItemIndex);
 cbShapes.ItemIndex := FDiagramm.CurrentShapeClassIndex;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 FDiagramm := TmsDiagramms.Create(imgMain, cbDiagramm.Items);
 FDiagramm.AllowedShapesToList(cbShapes.Items);
 cbShapes.ItemIndex := FDiagramm.CurrentShapeClassIndex;
 cbDiagramm.ItemIndex := FDiagramm.CurrentDiagrammIndex;
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
