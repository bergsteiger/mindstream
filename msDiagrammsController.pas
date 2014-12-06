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
 System.UITypes,
 msCoreObjects,
 msWatchedObjectInstance
 ;

type
 TmsDiagrammsController = class(TmsWatchedObject)
 private
  imgMain: TImage;
  cbShapes: TComboBox;
  cbDiagramm: TComboBox;
  btAddDiagramm: TButton;
  btSaveDiagramm: TButton;
  btLoadDiagramm: TButton;
  FDiagramms: TmsDiagramms;
  procedure cbDiagrammChange(Sender: TObject);
  procedure imgMainResize(Sender: TObject);
  procedure cbShapesChange(Sender: TObject);
  procedure btAddDiagrammClick(Sender: TObject);
  procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  procedure btSaveDiagrammClick(Sender: TObject);
  procedure btLoadDiagrammClick(Sender: TObject);
 public
  constructor Create(aImage: TImage; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton; aSaveDiagramm: TButton; aLoadDiagramm: TButton);
  destructor Destroy; override;
  procedure Clear;
  procedure ProcessClick(const aStart: TPointF);
 end;//TmsDiagrammsController

implementation

uses
 System.SysUtils,
 FMX.Types,
 msDiagramm
 ;

constructor TmsDiagrammsController.Create(aImage: TImage;
                                          aShapes: TComboBox;
                                          aDiagramm: TComboBox;
                                          aAddDiagramm: TButton;
                                          aSaveDiagramm: TButton;
                                          aLoadDiagramm: TButton);
begin
 inherited Create;
 imgMain := aImage;
 cbShapes := aShapes;
 cbDiagramm := aDiagramm;
 btAddDiagramm := aAddDiagramm;
 btSaveDiagramm := aSaveDiagramm;
 btLoadDiagramm := aLoadDiagramm;
 FDiagramms := TmsDiagramms.Create(imgMain, cbDiagramm.Items);
 FDiagramms.AllowedShapesToList(cbShapes.Items);
 cbShapes.ItemIndex := FDiagramms.CurrentShapeClassIndex;
 cbDiagramm.ItemIndex := FDiagramms.CurrentDiagrammIndex;
 cbDiagramm.OnChange := cbDiagrammChange;
 imgMain.OnResize := imgMainResize;
 cbShapes.OnChange := cbShapesChange;
 btAddDiagramm.OnClick := btAddDiagrammClick;
 btSaveDiagramm.OnClick := btSaveDiagrammClick;
 btLoadDiagramm.OnClick := btLoadDiagrammClick;
 imgMain.OnMouseDown := imgMainMouseDown;
 imgMain.Align := TAlignLayout.alClient;
end;

procedure TmsDiagrammsController.btLoadDiagrammClick(Sender: TObject);
var
 l_D : ImsDiagramm;
 l_I : Integer;
begin
 l_I := FDiagramms.CurrentDiagrammIndex;
 FDiagramms.DeSerialize;
 cbDiagramm.Clear;
 for l_D in FDiagramms.Items do
  cbDiagramm.Items.Add((l_D.toObject As TmsDiagramm).Name);
 cbDiagramm.ItemIndex := l_I;
end;

procedure TmsDiagrammsController.btSaveDiagrammClick(Sender: TObject);
begin
 FDiagramms.Serialize;
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
 inherited;
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

