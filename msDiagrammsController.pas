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
 TmsDiagrammsController = class(TmsIvalidator, ImsDiagrammsController)
 private
  imgMain: TPaintBox;
  cbShapes: TComboBox;
  cbDiagramm: TComboBox;
  btAddDiagramm: TButton;
  btSaveDiagramm: TButton;
  btLoadDiagramm: TButton;
  f_DiagrammsRoot: ImsDiagramms;
  f_CurrentDiagramms : ImsDiagrammsList;
  f_CurrentDiagramm : ImsDiagramm;
  procedure cbDiagrammChange(Sender: TObject);
  procedure btAddDiagrammClick(Sender: TObject);
  procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  procedure btSaveDiagrammClick(Sender: TObject);
  procedure btLoadDiagrammClick(Sender: TObject);
  function pm_GetCurrentDiagramm: ImsDiagramm;
  procedure pm_SetCurrentDiagramm(const aValue: ImsDiagramm);
  function pm_GetCurrentDiagramms: ImsDiagrammsList;
  procedure pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
 protected
  procedure DoInvalidateDiagramm(const aDiagramm: ImsDiagramm); override;
  procedure DoDiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm); override;
  property CurrentDiagramms : ImsDiagrammsList
   read pm_GetCurrentDiagramms
   write pm_SetCurrentDiagramms;
  constructor CreatePrim(aImage: TPaintBox; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton; aSaveDiagramm: TButton; aLoadDiagramm: TButton);
 public
  class function Create(aImage: TPaintBox; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton; aSaveDiagramm: TButton; aLoadDiagramm: TButton): ImsDiagrammsController;
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
 msShapesForToolbar,
 Math,
 msShapeCreator
 ;

type
 TmsDiagrammsHolder = class(TmsInterfacedRefcounted, ImsDiagrammsHolder)
 private
  f_DiagrammsController : TmsDiagrammsController;
  constructor CreatePrim(aDiagrammsController : TmsDiagrammsController);
 protected
  function pm_GetCurrentDiagramms: ImsDiagrammsList;
  procedure pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
 public
  class function Create(aDiagrammsController : TmsDiagrammsController): ImsDiagrammsHolder;
 end;//TmsDiagrammsHolder

constructor TmsDiagrammsHolder.CreatePrim(aDiagrammsController : TmsDiagrammsController);
begin
 inherited Create;
 f_DiagrammsController := aDiagrammsController;
end;

class function TmsDiagrammsHolder.Create(aDiagrammsController : TmsDiagrammsController): ImsDiagrammsHolder;
begin
 Result := CreatePrim(aDiagrammsController);
end;

function TmsDiagrammsHolder.pm_GetCurrentDiagramms: ImsDiagrammsList;
begin
 Result := f_DiagrammsController.CurrentDiagramms;
end;

procedure TmsDiagrammsHolder.pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
begin
 f_DiagrammsController.CurrentDiagramms := aValue;
end;

{$Include msIvalidator.mixin.pas}

// TmsDiagrammsController

constructor TmsDiagrammsController.CreatePrim(aImage: TPaintBox;
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
 f_DiagrammsRoot := TmsDiagramms.Create;
 CurrentDiagramms := f_DiagrammsRoot;
 CurrentDiagramms.AddNewDiagramm;
end;

class function TmsDiagrammsController.Create(aImage: TPaintBox; aShapes: TComboBox; aDiagramm: TComboBox; aAddDiagramm: TButton; aSaveDiagramm: TButton; aLoadDiagramm: TButton): ImsDiagrammsController;
begin
 Result := CreatePrim(aImage, aShapes, aDiagramm, aAddDiagramm, aSaveDiagramm, aLoadDiagramm);
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
 if (aValue = nil) OR not aValue.EQ(f_CurrentDiagramm) then
 begin
  f_CurrentDiagramm := aValue;
  if (aValue <> nil) then
  begin
   cbDiagramm.OnChange := nil;
   cbDiagramm.ItemIndex := cbDiagramm.Items.IndexOf(aValue.Name);
   cbDiagramm.OnChange := cbDiagrammChange;
  end;//aValue <> nil
  if (f_CurrentDiagramm <> nil) then
   f_CurrentDiagramm.Invalidate;
 end;//not aValue.EQ(f_CurrentDiagramm)
end;

function TmsDiagrammsController.pm_GetCurrentDiagramms: ImsDiagrammsList;
begin
 Result := f_CurrentDiagramms;
end;

procedure TmsDiagrammsController.pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
var
 l_Index : Integer;
begin
 if (f_CurrentDiagramms <> aValue) then
 begin
  f_CurrentDiagramms := aValue;
  l_Index := cbShapes.ItemIndex;
  cbShapes.Items.Clear;
  cbDiagramm.Items.Clear;
  if (f_CurrentDiagramms = nil) then
   CurrentDiagramm := nil
  else
  begin
   f_CurrentDiagramms.ShapesForToolbarToList(cbShapes.Items);
   CurrentDiagramm := f_CurrentDiagramms.FirstDiagramm;
   if (l_Index < 0) then
    if (cbShapes.Count > 0) then
     l_Index := 0;
   cbShapes.ItemIndex := Min(cbShapes.Count-1, l_Index);
  end;//f_CurrentDiagramms <> nil
 end;//f_CurrentDiagramms <> aValue
end;

procedure TmsDiagrammsController.btLoadDiagrammClick(Sender: TObject);
var
 l_D : ImsDiagramm;
 l_I : Integer;
begin
 l_I := cbDiagramm.ItemIndex;
 f_DiagrammsRoot.DeSerialize;
 cbDiagramm.Clear;
 Assert(f_DiagrammsRoot.EQ(CurrentDiagramms));
 for l_D in f_DiagrammsRoot do
  cbDiagramm.Items.Add(l_D.Name);
 cbDiagramm.ItemIndex := l_I;
end;

procedure TmsDiagrammsController.btSaveDiagrammClick(Sender: TObject);
begin
 f_DiagrammsRoot.Serialize;
end;

procedure TmsDiagrammsController.cbDiagrammChange(Sender: TObject);
begin
 Assert(CurrentDiagramms <> nil);
 CurrentDiagramm := CurrentDiagramms.SelectDiagramm(cbDiagramm.Items[cbDiagramm.ItemIndex]);
 Assert(CurrentDiagramm <> nil);
 CurrentDiagramm.Invalidate;
end;

procedure TmsDiagrammsController.btAddDiagrammClick(Sender: TObject);
begin
 CurrentDiagramms.AddNewDiagramm;
end;

destructor TmsDiagrammsController.Destroy;
begin
 f_CurrentDiagramm := nil;
 CurrentDiagramms := nil;
 f_DiagrammsRoot := nil;
 inherited;
end;

procedure TmsDiagrammsController.Clear;
begin
 CurrentDiagramm.Clear;
end;

procedure TmsDiagrammsController.ProcessClick(const aStart: TPointF);
begin
 CurrentDiagramm.ProcessClick(TmsClickContext.Create(TmsShapeCreator.Create(TmsShapesForToolbar.Instance.Items[cbShapes.ItemIndex]), aStart, TmsDiagrammsHolder.Create(Self)));
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

procedure TmsDiagrammsController.DoDiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
begin
 Assert(CurrentDiagramms <> nil);
 if not CurrentDiagramms.EQ(aDiagramms) then
  Exit;
 if (CurrentDiagramms <> nil) then
 begin
  if (CurrentDiagramms.IndexOf(aDiagramm) >= 0) then
  begin
   cbDiagramm.Items.Add(aDiagramm.Name);
   CurrentDiagramm := aDiagramm;
  end;//CurrentDiagramms.IndexOf(aDiagramm) >= 0
 end;//CurrentDiagramms <> nil
end;

end.

