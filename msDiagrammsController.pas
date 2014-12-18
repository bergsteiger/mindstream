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
 TmsDiagrammsController = class(TmsIvalidator)
 private
  imgMain: TPaintBox;
  cbShapes: TComboBox;
  cbDiagramm: TComboBox;
  btAddDiagramm: TButton;
  btSaveDiagramm: TButton;
  btLoadDiagramm: TButton;
  FDiagramms: ImsDiagramms;
  f_CurrentDiagramm : ImsDiagramm;
  procedure cbDiagrammChange(Sender: TObject);
  procedure btAddDiagrammClick(Sender: TObject);
  procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  procedure btSaveDiagrammClick(Sender: TObject);
  procedure btLoadDiagrammClick(Sender: TObject);
  function pm_GetCurrentDiagramm: ImsDiagramm;
  procedure pm_SetCurrentDiagramm(const aValue: ImsDiagramm);
 protected
  procedure DoInvalidateDiagramm(const aDiagramm: ImsDiagramm); override;
  procedure DoDiagrammAdded(const aDiagramm: ImsDiagramm); override;
 public
  constructor Create(aImage: TPaintBox; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton; aSaveDiagramm: TButton; aLoadDiagramm: TButton);
  destructor Destroy; override;
  procedure Clear;
  procedure ProcessClick(const aStart: TPointF);
  property CurrentDiagramm: ImsDiagramm
   read pm_GetCurrentDiagramm
   write pm_SetCurrentDiagramm;
  procedure DrawTo(const aCanvas: TCanvas);
 end;//TmsDiagrammsController

implementation

uses
 {$Include msIvalidator.mixin.pas}
 ,
 System.SysUtils,
 FMX.Types,
 msShapesForToolbar
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
 cbDiagramm.OnChange := cbDiagrammChange;
 btAddDiagramm.OnClick := btAddDiagrammClick;
 btSaveDiagramm.OnClick := btSaveDiagrammClick;
 btLoadDiagramm.OnClick := btLoadDiagrammClick;
 imgMain.OnMouseDown := imgMainMouseDown;
 imgMain.Align := TAlignLayout.alClient;
 FDiagramms := TmsDiagramms.Create;
 FDiagramms.AddNewDiagramm;
end;

procedure TmsDiagrammsController.DoInvalidateDiagramm(const aDiagramm: ImsDiagramm);
begin
 if (imgMain <> nil) then
  if (aDiagramm.EQ(CurrentDiagramm)) then
   imgMain.Repaint;
end;

function TmsDiagrammsController.pm_GetCurrentDiagramm: ImsDiagramm;
begin
 Result := f_CurrentDiagramm;
end;

procedure TmsDiagrammsController.pm_SetCurrentDiagramm(const aValue: ImsDiagramm);
begin
 if not aValue.EQ(f_CurrentDiagramm) then
 begin
  f_CurrentDiagramm := aValue;
  cbDiagramm.ItemIndex := cbDiagramm.Items.IndexOf(aValue.Name);
  f_CurrentDiagramm.Invalidate;
 end;//not aValue.EQ(f_CurrentDiagramm)
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
 CurrentDiagramm := FDiagramms.SelectDiagramm(cbDiagramm.Items[cbDiagramm.ItemIndex]);
 CurrentDiagramm.Invalidate;
end;

procedure TmsDiagrammsController.btAddDiagrammClick(Sender: TObject);
begin
 FDiagramms.AddNewDiagramm;
end;

destructor TmsDiagrammsController.Destroy;
begin
 f_CurrentDiagramm := nil;
 FDiagramms := nil;
 inherited;
end;

procedure TmsDiagrammsController.Clear;
begin
 CurrentDiagramm.Clear;
end;

procedure TmsDiagrammsController.ProcessClick(const aStart: TPointF);
begin
 CurrentDiagramm.ProcessClick(TmsShapesForToolbar.Instance.Items[cbShapes.ItemIndex], aStart);
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

procedure TmsDiagrammsController.DoDiagrammAdded(const aDiagramm: ImsDiagramm);
begin
 if (FDiagramms <> nil) then
 begin
  if (cbShapes.Items.Count = 0) then
  begin
   FDiagramms.ShapesForToolbarToList(cbShapes.Items);
   cbShapes.ItemIndex := 0;
  end;//cbShapes.Items.Count = 0
  if (FDiagramms.IndexOf(aDiagramm) >= 0) then
  begin
   cbDiagramm.Items.Add(aDiagramm.Name);
   CurrentDiagramm := aDiagramm;
  end;//FDiagramms.IndexOf(aDiagramm) >= 0
 end;//
end;

end.

