unit msMain_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  msDiagramm, FMX.Objects, FMX.ListBox
  ;

type
  TmsMainForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    imgMain: TImage;
    cbShapes: TComboBox;
    btClear: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure cbShapesChange(Sender: TObject);
    procedure imgMainResize(Sender: TObject);
    procedure btClearClick(Sender: TObject);
  private
    { Private declarations }
    FDiagramm : TmsDiagramm;
  public
    { Public declarations }
  end;

var
  msMainForm: TmsMainForm;

implementation

{$R *.fmx}

procedure TmsMainForm.btClearClick(Sender: TObject);
begin
 FDiagramm.Clear;
end;

procedure TmsMainForm.cbShapesChange(Sender: TObject);
begin
 FDiagramm.SelectShape(cbShapes.Items, cbShapes.ItemIndex);
end;

procedure TmsMainForm.FormCreate(Sender: TObject);
begin
 FDiagramm := TmsDiagramm.Create(imgMain);
 FDiagramm.AllowedShapesToList(cbShapes.Items);
 cbShapes.ItemIndex := 0;
end;

procedure TmsMainForm.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDiagramm);
end;

procedure TmsMainForm.imgMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 FDiagramm.ProcessClick(TPointF.Create(X, Y));
end;

procedure TmsMainForm.imgMainResize(Sender: TObject);
begin
 FDiagramm.ResizeTo(imgMain);
end;

end.
