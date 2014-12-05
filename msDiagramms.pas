unit msDiagramms;

interface

uses
 msDiagramm,
 Generics.Collections,
 System.Types,
 FMX.Objects,
 System.Classes,
 msCoreObjects,
 msWatchedObjectInstance,
 Data.DBXJSONReflect
 ;

type
 TmsDiagrammList = class(TObjectList<TmsDiagramm>)
 end;//TmsDiagrammList

 TmsDiagramms = class(TmsWatchedObject)
 private
  [JSONMarshalled(True)]
  f_Diagramms : TmsDiagrammList;
  [JSONMarshalled(False)]
  f_CurrentDiagramm : TmsDiagramm;
  function pm_GetCurrentDiagramm: TmsDiagramm;
  function pm_GetDiagramms: TmsDiagrammList;
  procedure pm_SetDiagramms(aValue: TmsDiagrammList);
 public
  constructor Create(anImage: TImage; aList: TStrings);
  destructor Destroy; override;
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
  property Diagramms: TmsDiagrammList read pm_GetDiagramms write pm_SetDiagramms;
  property CurrentDiagramm: TmsDiagramm read pm_GetCurrentDiagramm;
 end;//TmsDiagramms

implementation

uses
 System.SysUtils
 ;

constructor TmsDiagramms.Create(anImage: TImage; aList: TStrings);
begin
 inherited Create;
 f_Diagramms := TmsDiagrammList.Create;
 AddDiagramm(anImage, aList);
end;

function TmsDiagramms.pm_GetCurrentDiagramm: TmsDiagramm;
begin
 Result := f_CurrentDiagramm;
end;

function TmsDiagramms.pm_GetDiagramms: TmsDiagrammList;
begin
 if (f_Diagramms = nil) then
  f_Diagramms := TmsDiagrammList.Create;
 Result := f_Diagramms;
end;

procedure TmsDiagramms.pm_SetDiagramms(aValue: TmsDiagrammList);
var
 l_D : TmsDiagramm;
begin
 if (f_Diagramms <> nil) then
  f_Diagramms.Clear;
 if (aValue <> nil) then
  for l_D in aValue do
  begin
   if (f_Diagramms = nil) then
    f_Diagramms := TmsDiagrammList.Create;
   f_Diagramms.Add(l_D);
  end;//for l_D in aValue
end;

procedure TmsDiagramms.AddDiagramm(anImage: TImage; aList: TStrings);
begin
 f_CurrentDiagramm := TmsDiagramm.Create(anImage, 'Диаграмма №' + IntToStr(f_Diagramms.Count + 1));
 f_Diagramms.Add(f_CurrentDiagramm);
 if (aList <> nil) then
  aList.AddObject(f_CurrentDiagramm.Name, f_CurrentDiagramm);
end;

function TmsDiagramms.CurrentDiagrammIndex: Integer;
begin
 Result := f_Diagramms.IndexOf(f_CurrentDiagramm);
end;

procedure TmsDiagramms.SelectDiagramm(anIndex: Integer);
begin
 if (anIndex < 0) OR (anIndex >= f_Diagramms.Count) then
  Exit;
 f_CurrentDiagramm := f_Diagramms.Items[anIndex];
 CurrentDiagramm.Invalidate;
end;

procedure TmsDiagramms.DeSerialize;
begin
 CurrentDiagramm.DeSerialize;
end;

destructor TmsDiagramms.Destroy;
begin
 FreeAndNil(f_Diagramms);
 inherited;
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
 CurrentDiagramm.Serialize;
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

