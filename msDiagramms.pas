unit msDiagramms;

interface

uses
 System.Types,
 FMX.Objects,
 System.Classes,
 msCoreObjects,
 msShape,
 Data.DBXJSONReflect,
 msDiagramm,
 msInterfaces,
 msDiagrammsList
 ;

type
 TmsDiagramms = class(TmsDiagrammsList, ImsDiagramms)
 private
  [JSONMarshalled(True)]
  f_CurrentDiagramm : Integer;
  constructor CreatePrim;
 protected
  function CurrentDiagrammIndex: Integer;
  function pm_GetCurrentDiagramm: ImsDiagramm;
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm); override;
  procedure Serialize;
  procedure DeSerialize;
  function  SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
  property CurrentDiagramm: ImsDiagramm
   read pm_GetCurrentDiagramm;
 public
  class function Create: ImsDiagramms;
  procedure Assign(anOther: TmsDiagramms);
 end;//TmsDiagramms

implementation

uses
 System.SysUtils,
 FMX.Graphics,
 System.UITypes,
 msDiagrammsMarshal,
 msRegisteredShapes,
 msInvalidators
 ;

// TmsDiagramms

class function TmsDiagramms.Create: ImsDiagramms;
begin
 Result := CreatePrim;
end;

constructor TmsDiagramms.CreatePrim;
begin
 inherited Create;
end;

function TmsDiagramms.pm_GetCurrentDiagramm: ImsDiagramm;
begin
 Result := Items[f_CurrentDiagramm];
end;

procedure TmsDiagramms.DiagrammAdded(const aDiagramm: ImsDiagramm);
begin
 f_CurrentDiagramm := Items.IndexOf(aDiagramm);
 inherited;
end;

function TmsDiagramms.CurrentDiagrammIndex: Integer;
begin
 Result := f_CurrentDiagramm;
end;

function TmsDiagramms.SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
var
 l_D : ImsDiagramm;
begin
 Result := nil;
 for l_D in Items do
  if (l_D.Name = aDiagrammName) then
  begin
   Result := l_D;
   break;
  end;//l_D.Name = aDiagrammName
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

procedure TmsDiagramms.Serialize;
begin
 TmsDiagrammsMarshal.Serialize(c_FileName, self);
end;

procedure TmsDiagramms.SaveTo(const aFileName: String);
begin
 TmsDiagrammsMarshal.Serialize(aFileName, Self);
end;

procedure TmsDiagramms.LoadFrom(const aFileName: String);
begin
 TmsDiagrammsMarshal.DeSerialize(aFileName, Self);
end;

end.

