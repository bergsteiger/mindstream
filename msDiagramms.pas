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
  constructor CreatePrim;
 protected
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm); override;
  procedure Serialize;
  procedure DeSerialize;
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
 public
  class function Create: ImsDiagramms;
  procedure Assign(anOther: TmsDiagramms);
 end;//TmsDiagramms

implementation

uses
 System.SysUtils,
 FMX.Graphics,
 System.UITypes,
 //msDiagrammsMarshal,
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

procedure TmsDiagramms.DiagrammAdded(const aDiagramm: ImsDiagramm);
begin
 inherited;
end;

const
 c_FileName = 'All.json';

procedure TmsDiagramms.DeSerialize;
begin
 Assert(false);
 (*TmsDiagrammsMarshal.DeSerialize(c_FileName, self);*)
end;

procedure TmsDiagramms.Assign(anOther: TmsDiagramms);
begin
 inherited Assign(anOther);
end;

procedure TmsDiagramms.Serialize;
begin
 Assert(false);
 (*TmsDiagrammsMarshal.Serialize(c_FileName, self);*)
end;

procedure TmsDiagramms.SaveTo(const aFileName: String);
begin
 Assert(false);
 (*TmsDiagrammsMarshal.Serialize(aFileName, Self);*)
end;

procedure TmsDiagramms.LoadFrom(const aFileName: String);
begin
 Assert(false);
 (*TmsDiagrammsMarshal.DeSerialize(aFileName, Self);*)
end;

end.

