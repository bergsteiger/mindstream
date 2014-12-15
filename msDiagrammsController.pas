unit msDiagrammsController;

interface

uses
 {$Include msIvalidator.mixin.pas}
 ,
 FMX.Objects,
 FMX.ListBox,
 FMX.StdCtrls,
 FMX.Graphics,
 msDiagramms,
 System.Types,
 FMX.Forms,
 System.Classes,
 System.UITypes,
 msCoreObjects,
 msInterfacedRefcounted,
 msShape,
 msInterfaces
 ;

type
 TmsIvalidatorParent = TmsInterfacedRefcounted;
 {$Include msIvalidator.mixin.pas}
 TmsDiagrammsController = class(TmsIvalidator, ImsDiagrammsListener)
 private
  imgMain: TPaintBox;
  cbShapes: TComboBox;
  cbDiagramm: TComboBox;
  btAddDiagramm: TButton;
  btSaveDiagramm: TButton;
  btLoadDiagramm: TButton;
  FDiagramms: ImsDiagramms;
  procedure cbDiagrammChange(Sender: TObject);
  procedure imgMainResize(Sender: TObject);
  procedure cbShapesChange(Sender: TObject);
  procedure btAddDiagrammClick(Sender: TObject);
  procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  procedure btSaveDiagrammClick(Sender: TObject);
  procedure btLoadDiagrammClick(Sender: TObject);
  function pm_GetCurrentDiagramm: ImsDiagramm;
  procedure DiargammAdded(const aDiagramm: ImsDiagramm);
 protected
  procedure DoInvalidateDiagramm(const aDiagramm: ImsDiagramm); override;
 public
  constructor Create(aImage: TPaintBox; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton; aSaveDiagramm: TButton; aLoadDiagramm: TButton);
  destructor Destroy; override;
  procedure Clear;
  procedure ProcessClick(const aStart: TPointF);
  property CurrentDiagramm: ImsDiagramm
   read pm_GetCurrentDiagramm;
  procedure DrawTo(const aCanvas: TCanvas);
 end;//TmsDiagrammsController

implementation

uses
 {$Include msIvalidator.mixin.pas}
 ,
 System.SysUtils,
 FMX.Types
 ;

{$Include msIvalidator.mixin.pas}

// TmsDiagrammsController

constructor TmsDiagrammsController.Create(aImage: TPaintBox;
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
 FDiagramms := TmsDiagramms.Create(cbDiagramm.Items);
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

procedure TmsDiagrammsController.DoInvalidateDiagramm(const aDiagramm: ImsDiagramm);
begin
 if (imgMain <> nil) then
  if (aDiagramm.EQ(CurrentDiagramm)) then
   imgMain.Repaint;
end;

function TmsDiagrammsController.pm_GetCurrentDiagramm: ImsDiagramm;
begin
 Result := FDiagramms.CurrentDiagramm;
end;

procedure TmsDiagrammsController.btLoadDiagrammClick(Sender: TObject);
var
 l_D : ImsDiagramm;
 l_I : Integer;
begin
 l_I := FDiagramms.CurrentDiagrammIndex;
 FDiagramms.DeSerialize;
 cbDiagramm.Clear;
 for l_D in FDiagramms do
  cbDiagramm.Items.Add(l_D.Name);
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
end;

procedure TmsDiagrammsController.cbShapesChange(Sender: TObject);
begin
 FDiagramms.SelectShape(cbShapes.Items, cbShapes.ItemIndex);
end;

procedure TmsDiagrammsController.btAddDiagrammClick(Sender: TObject);
begin
 FDiagramms.AddNewDiagramm(cbDiagramm.Items);
 cbDiagramm.ItemIndex := FDiagramms.CurrentDiagrammIndex;
 cbShapes.ItemIndex := FDiagramms.CurrentShapeClassIndex;
end;

destructor TmsDiagrammsController.Destroy;
begin
 FDiagramms := nil;
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

procedure TmsDiagrammsController.DrawTo(const aCanvas: TCanvas);
begin
 CurrentDiagramm.DrawTo(aCanvas);
end;

procedure TmsDiagrammsController.imgMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 Self.ProcessClick(TPointF.Create(X, Y));
end;

procedure TmsDiagrammsController.DiargammAdded(const aDiagramm: ImsDiagramm);
begin
 if (FDiagramms.IndexOf(aDiagramm) >= 0) then
  cbDiagramm.Items.Add(aDiagramm.Name);
end;

end.

