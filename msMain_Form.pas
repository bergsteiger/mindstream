unit msMain_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  msDiagramm, FMX.Objects, FMX.ListBox,
  msDiagramms,
  msDiagrammsController
  ;

type
  TmsMainForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    imgMain: TImage;
    cbShapes: TComboBox;
    btClear: TButton;
    cbDiagramm: TComboBox;
    btAdd: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btClearClick(Sender: TObject);
  private
    { Private declarations }
    FDiagramm : TmsDiagrammsController;
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

procedure TmsMainForm.FormCreate(Sender: TObject);
begin
 FDiagramm := TmsDiagrammsController.Create(imgMain, cbShapes, cbDiagramm, btAdd);
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

end.
