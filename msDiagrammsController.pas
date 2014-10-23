unit msDiagrammsController;

interface

uses
 FMX.Objects,
 FMX.ListBox,
 FMX.StdCtrls,
 msDiagramms,
 System.Types,
 FMX.Forms,
 System.Classes,
 System.UITypes
 ;

type
 TmsDiagrammsController = class(TObject)
 private
  imgMain: TImage;
  cbShapes: TComboBox;
  cbDiagramm: TComboBox;
  btAddDiagramm: TButton;
  FDiagramms: TmsDiagramms;
  procedure cbDiagrammChange(Sender: TObject);
  procedure imgMainResize(Sender: TObject);
  procedure cbShapesChange(Sender: TObject);
  procedure btAddDiagrammClick(Sender: TObject);
  procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
 public
  constructor Create(aImage: TImage; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton);
  destructor Destroy; override;
  procedure Clear;
  procedure ProcessClick(const aStart: TPointF);
 end;//TmsDiagrammsController

implementation

uses
 System.SysUtils,
 FMX.Types
 ;

constructor TmsDiagrammsController.Create(aImage: TImage; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton);
begin
 inherited Create;
 imgMain := aImage;
 cbShapes := aShapes;
 cbDiagramm := aDiagramm;
 btAddDiagramm := aAddDiagramm;
 FDiagramms := TmsDiagramms.Create(imgMain, cbDiagramm.Items);
 FDiagramms.AllowedShapesToList(cbShapes.Items);
 cbShapes.ItemIndex := FDiagramms.CurrentShapeClassIndex;
 cbDiagramm.ItemIndex := FDiagramms.CurrentDiagrammIndex;
 cbDiagramm.OnChange := cbDiagrammChange;
 imgMain.OnResize := imgMainResize;
 cbShapes.OnChange := cbShapesChange;
 btAddDiagramm.OnClick := btAddDiagrammClick;
 imgMain.OnMouseDown := imgMainMouseDown;
 imgMain.Align := TAlignLayout.alClient;
end;

procedure TmsDiagrammsController.cbDiagrammChange(Sender: TObject);
begin
 FDiagramms.SelectDiagramm(cbDiagramm.ItemIndex);
 cbShapes.ItemIndex := FDiagramms.CurrentShapeClassIndex;
end;

procedure TmsDiagrammsController.imgMainResize(Sender: TObject);
begin
 FDiagramms.ResizeTo(imgMain);
end;

procedure TmsDiagrammsController.cbShapesChange(Sender: TObject);
begin
 FDiagramms.SelectShape(cbShapes.Items, cbShapes.ItemIndex);
end;

procedure TmsDiagrammsController.btAddDiagrammClick(Sender: TObject);
begin
 FDiagramms.AddDiagramm(imgMain, cbDiagramm.Items);
 cbDiagramm.ItemIndex := FDiagramms.CurrentDiagrammIndex;
 cbShapes.ItemIndex := FDiagramms.CurrentShapeClassIndex;
end;

destructor TmsDiagrammsController.Destroy;
begin
 FreeAndNil(FDiagramms);
end;

procedure TmsDiagrammsController.Clear;
begin
 FDiagramms.Clear;
end;

procedure TmsDiagrammsController.ProcessClick(const aStart: TPointF);
begin
 FDiagramms.ProcessClick(aStart);
end;

procedure TmsDiagrammsController.imgMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 Self.ProcessClick(TPointF.Create(X, Y));
end;

end.

