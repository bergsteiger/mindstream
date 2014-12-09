unit msDiagramms;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 msDiagramm,
 System.Types,
 FMX.Objects,
 System.Classes,
 msCoreObjects,
 msWatchedObjectInstance,
 msInterfacedNonRefcounted
 ;

type
 TmsItemsHolderParent = TmsInterfacedNonRefcounted;
 TmsItem = ImsDiagramm;
 {$Include msItemsHolder.mixin.pas}
 TmsDiagramms = class(TmsItemsHolder, ImsIvalidator)
 private
  [JSONMarshalled(True)]
  f_CurrentDiagramm : Integer;
  [JSONMarshalled(False)]
  f_Image: TPaintBox;
  function pm_GetCurrentDiagramm: TmsDiagramm;
  procedure InvalidateDiagramm(aDiagramm: TmsDiagramm);
 public
  constructor Create(anImage: TPaintBox; aList: TStrings);
  procedure AfterConstruction; override;
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  procedure AllowedShapesToList(aList: TStrings);
  procedure ResizeTo(anImage: TImage);
  procedure AddDiagramm(aList: TStrings);
  function CurrentDiagrammIndex: Integer;
  procedure SelectDiagramm(anIndex: Integer);
  function CurrentShapeClassIndex: Integer;
  procedure Serialize;
  procedure DeSerialize;
  property CurrentDiagramm: TmsDiagramm read pm_GetCurrentDiagramm;
  procedure Assign(anOther: TmsDiagramms);
  destructor Destroy; override;
 end;//TmsDiagramms

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils,
 FMX.Graphics,
 System.UITypes,
 msDiagrammsMarshal,
 msRegisteredShapes,
 msInvalidators
 ;

{$Include msItemsHolder.mixin.pas}

// TmsDiagramms

constructor TmsDiagramms.Create(anImage: TPaintBox; aList: TStrings);
begin
 inherited Create;
 f_Image := anImage;
 AddDiagramm(aList);
end;

procedure TmsDiagramms.AfterConstruction;
begin
 TmsInvalidators.Subscribe(Self);
 inherited;
end;

destructor TmsDiagramms.Destroy;
begin
 TmsInvalidators.UnSubscribe(Self);
 inherited;
end;

function TmsDiagramms.pm_GetCurrentDiagramm: TmsDiagramm;
begin
 Result := Items[f_CurrentDiagramm].toObject As TmsDiagramm;
end;

procedure TmsDiagramms.InvalidateDiagramm(aDiagramm: TmsDiagramm);
var
 l_Canvas : TCanvas;
begin
 if (f_Image <> nil) then
  if (aDiagramm = CurrentDiagramm) then
  begin
   f_Image.Repaint;
   Exit;
   l_Canvas := f_Image.Canvas;
   if (l_Canvas <> nil) then
   begin
    l_Canvas.BeginScene;
    try
     l_Canvas.Clear(TAlphaColorRec.White);
     aDiagramm.DrawTo(l_Canvas);
    finally
     l_Canvas.EndScene;
    end;//try..finally
   end;//l_Canvas <> nil
  end;//aDiagramm = CurrentDiagramm
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
//  aList.AddObject(l_D.Name, TObject(f_CurrentDiagramm));
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
// CurrentDiagramm.DeSerialize;
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
// CurrentDiagramm.Serialize;
end;

procedure TmsDiagramms.AllowedShapesToList(aList: TStrings);
begin
 CurrentDiagramm.AllowedShapesToList(aList);
end;

procedure TmsDiagramms.ResizeTo(anImage: TImage);
begin
 //f_Image.Bitmap := TBitmap.Create(Round(anImage.Width), Round(anImage.Height));
 //CurrentDiagramm.ResizeTo(anImage);
end;

function TmsDiagramms.CurrentShapeClassIndex: Integer;
begin
 Result := CurrentDiagramm.CurrentShapeClassIndex;
end;

end.

