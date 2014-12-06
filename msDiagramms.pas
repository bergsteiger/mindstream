unit msDiagramms;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 msDiagramm,
 Generics.Collections,
 System.Types,
 FMX.Objects,
 System.Classes,
 msCoreObjects,
 msWatchedObjectInstance
 ;

type
 TmsDiagrammList = class(TList<ImsDiagramm>)
 end;//TmsDiagrammList

 TmsItemsHolderParent = TmsWatchedObject;
 TmsItemGet = ImsDiagramm;
 TmsItemSet = TmsDiagramm;
 TmsItemsList = TmsDiagrammList;
 {$Include msItemsHolder.mixin.pas}
 TmsDiagramms = class(TmsItemsHolder)
 private
  [JSONMarshalled(True)]
  f_CurrentDiagramm : Integer;
  function pm_GetCurrentDiagramm: TmsDiagramm;
 public
  constructor Create(anImage: TImage; aList: TStrings);
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  procedure AllowedShapesToList(aList: TStrings);
  procedure ResizeTo(anImage: TImage);
  procedure AddDiagramm(anImage: TImage; aList: TStrings);
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
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils,
 msDiagrammsMarshal
 ;

{$Include msItemsHolder.mixin.pas}

// TmsDiagramms

constructor TmsDiagramms.Create(anImage: TImage; aList: TStrings);
begin
 inherited Create;
 AddDiagramm(anImage, aList);
end;

function TmsDiagramms.pm_GetCurrentDiagramm: TmsDiagramm;
begin
 Result := Items[f_CurrentDiagramm].toObject As TmsDiagramm;
end;

procedure TmsDiagramms.AddDiagramm(anImage: TImage; aList: TStrings);
var
 l_D : TmsDiagramm;
begin
 l_D := TmsDiagramm.Create(anImage, 'Диаграмма №' + IntToStr(Items.Count + 1));
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
begin
 inherited Assign(anOther);
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
 CurrentDiagramm.ResizeTo(anImage);
end;

function TmsDiagramms.CurrentShapeClassIndex: Integer;
begin
 Result := CurrentDiagramm.CurrentShapeClassIndex;
end;

end.

