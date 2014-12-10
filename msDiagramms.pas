unit msDiagramms;

interface

uses
 {$Include msIvalidator.mixin.pas}
 ,
 System.Types,
 FMX.Objects,
 System.Classes,
 msCoreObjects,
 msWatchedObjectInstance,
 msInterfacedNonRefcounted,
 msShape,
 msCustomDiagramms,
 Data.DBXJSONReflect
 ;

type
 TmsIvalidatorParent = TmsCustomDiagramms;
 {$Include msIvalidator.mixin.pas}
 TmsDiagramms = class(TmsIvalidator)
 private
  [JSONMarshalled(True)]
  f_CurrentDiagramm : Integer;
  [JSONMarshalled(False)]
  f_Image: TPaintBox;
  function pm_GetCurrentDiagramm: TmsDiagramm;
  procedure DoInvalidateDiagramm(aDiagramm: TmsDiagramm); override;
 public
  constructor Create(anImage: TPaintBox; aList: TStrings);
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  procedure AllowedShapesToList(aList: TStrings);
  procedure AddDiagramm(aList: TStrings);
  function CurrentDiagrammIndex: Integer;
  procedure SelectDiagramm(anIndex: Integer);
  function CurrentShapeClassIndex: Integer;
  procedure Serialize;
  procedure DeSerialize;
  property CurrentDiagramm: TmsDiagramm read pm_GetCurrentDiagramm;
  procedure Assign(anOther: TmsDiagramms);
 end;//TmsDiagramms

implementation

uses
 {$Include msIvalidator.mixin.pas}
 System.SysUtils,
 FMX.Graphics,
 System.UITypes,
 msDiagrammsMarshal,
 msRegisteredShapes,
 msInvalidators
 ;

{$Include msIvalidator.mixin.pas}

// TmsDiagramms

constructor TmsDiagramms.Create(anImage: TPaintBox; aList: TStrings);
begin
 inherited Create;
 f_Image := anImage;
 AddDiagramm(aList);
end;

function TmsDiagramms.pm_GetCurrentDiagramm: TmsDiagramm;
begin
 Result := Items[f_CurrentDiagramm].toObject As TmsDiagramm;
end;

procedure TmsDiagramms.DoInvalidateDiagramm(aDiagramm: TmsDiagramm);
var
 l_Canvas : TCanvas;
begin
 if (f_Image <> nil) then
  if (aDiagramm = CurrentDiagramm) then
   f_Image.Repaint;
end;

procedure TmsDiagramms.AddDiagramm(aList: TStrings);
var
 l_D : ImsDiagramm;
begin
 l_D := TmsDiagramm.Create('Диаграмма №' + IntToStr(Items.Count + 1));
 Items.Add(l_D);
 f_CurrentDiagramm := Items.IndexOf(l_D);
 if (aList <> nil) then
  aList.Add(l_D.Name);
end;

function TmsDiagramms.CurrentDiagrammIndex: Integer;
begin
 Result := f_CurrentDiagramm;
end;

procedure TmsDiagramms.SelectDiagramm(anIndex: Integer);
begin
 if (anIndex < 0) OR (anIndex >= Items.Count) then
  Exit;
 f_CurrentDiagramm := anIndex;
 CurrentDiagramm.Invalidate;
end;

const
 c_FileName = 'All.json';

procedure TmsDiagramms.DeSerialize;
begin
 TmsDiagrammsMarshal.DeSerialize(c_FileName, self);
end;

procedure TmsDiagramms.Assign(anOther: TmsDiagramms);
var
 l_D : ImsDiagramm;
begin
 inherited Assign(anOther);
 for l_D in Items do
 begin
  (l_D.toObject As TmsDiagramm).CurrentClass := TmsRegisteredShapes.Instance.First;
 end;//for l_D
 Self.f_CurrentDiagramm := anOther.CurrentDiagrammIndex;
 CurrentDiagramm.Invalidate;
end;

procedure TmsDiagramms.ProcessClick(const aStart: TPointF);
begin
 CurrentDiagramm.ProcessClick(aStart);
end;

procedure TmsDiagramms.Clear;
begin
 CurrentDiagramm.Clear;
end;

procedure TmsDiagramms.SelectShape(aList: TStrings; anIndex: Integer);
begin
 CurrentDiagramm.SelectShape(aList, anIndex);
end;

procedure TmsDiagramms.Serialize;
begin
 TmsDiagrammsMarshal.Serialize(c_FileName, self);
end;

procedure TmsDiagramms.AllowedShapesToList(aList: TStrings);
begin
 CurrentDiagramm.AllowedShapesToList(aList);
end;

function TmsDiagramms.CurrentShapeClassIndex: Integer;
begin
 Result := CurrentDiagramm.CurrentShapeClassIndex;
end;

end.

