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
    cbbPrimitives: TComboBox;
    cbDiargamm: TComboBox;
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
    procedure cbbPrimitivesChange(Sender: TObject);
    procedure imgMainResize(Sender: TObject);
    procedure btAddDiagrammClick(Sender: TObject);
    procedure cbDiargammChange(Sender: TObject);
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
 cbDiargamm.BeginUpdate;
 FDiagramm.AddDiagramm(imgMain);
 cbDiargamm.ItemIndex := -1;
 FDiagramm.DiagramsToList(cbDiargamm.Items);
 cbDiargamm.ItemIndex := FDiagramm.CurrentDiagrammIndex;
 cbDiargamm.EndUpdate;
end;

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagramm.Clear;
end;

procedure TfmMain.cbbPrimitivesChange(Sender: TObject);
begin
 FDiagramm.SelectShape(cbbPrimitives.Items, cbbPrimitives.ItemIndex);
end;

procedure TfmMain.cbDiargammChange(Sender: TObject);
begin
 FDiagramm.SelectDiagramm(cbDiargamm.ItemIndex);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 FDiagramm := TmsDiagramms.Create(imgMain);
 FDiagramm.AllowedShapesToList(cbbPrimitives.Items);
 cbbPrimitives.ItemIndex := 0;
 FDiagramm.DiagramsToList(cbDiargamm.Items);
 cbDiargamm.ItemIndex := FDiagramm.CurrentDiagrammIndex;
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
