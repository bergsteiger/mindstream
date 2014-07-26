unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  msDiagramm, FMX.Objects, FMX.ListBox
  ;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    imgMain: TImage;
    cbShapes: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure cbShapesChange(Sender: TObject);
    procedure imgMainResize(Sender: TObject);
  private
    { Private declarations }
    FDiagramm : TmsDiagramm;
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.cbShapesChange(Sender: TObject);
begin
 FDiagramm.SelectShape(cbShapes.Items, cbShapes.ItemIndex);
end;

procedure THeaderFooterForm.FormCreate(Sender: TObject);
begin
 FDiagramm := TmsDiagramm.Create(imgMain);
 FDiagramm.AllowedShapesToList(cbShapes.Items);
end;

procedure THeaderFooterForm.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDiagramm);
end;

procedure THeaderFooterForm.imgMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 FDiagramm.ProcessClick(TPointF.Create(X, Y));
end;

procedure THeaderFooterForm.imgMainResize(Sender: TObject);
begin
 FDiagramm.ResizeTo(imgMain);
end;

end.
