unit msDiagramms;

interface

uses
 msDiagramm,
 Generics.Collections,
 System.Types,
 FMX.Objects,
 System.Classes
 ;

type
 TmsDiagrammList = TObjectList<TmsDiagramm>;

 TmsDiagramms = class(TObject)
 private
  f_Diagramms : TmsDiagrammList;
  f_CurrentDiagramm : TmsDiagramm;
 public
  constructor Create(anImage: TImage);
  destructor Destroy; override;
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  procedure AllowedShapesToList(aList: TStrings);
  procedure ResizeTo(anImage: TImage);
  procedure DiagramsToList(aList: TStrings);
  procedure AddDiagramm(anImage: TImage);
  function CurrentDiagrammIndex: Integer;
  procedure SelectDiagramm(anIndex: Integer);
 end;//TmsDiagramms

implementation

uses
 System.SysUtils
 ;

constructor TmsDiagramms.Create(anImage: TImage);
begin
 inherited Create;
 f_Diagramms := TmsDiagrammList.Create;
 AddDiagramm(anImage);
end;

procedure TmsDiagramms.AddDiagramm(anImage: TImage);
begin
 f_CurrentDiagramm := TmsDiagramm.Create(anImage, IntToStr(f_Diagramms.Count + 1));
 f_Diagramms.Add(f_CurrentDiagramm);
 f_CurrentDiagramm.Invalidate;
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
 f_CurrentDiagramm.Invalidate;
end;

procedure TmsDiagramms.DiagramsToList(aList: TStrings);
var
 l_D : TmsDiagramm;
begin
 aList.Clear;
 for l_D in f_Diagramms do
  aList.AddObject(l_D.Name, l_D);
end;

destructor TmsDiagramms.Destroy;
begin
 FreeAndNil(f_Diagramms);
 inherited;
end;

procedure TmsDiagramms.ProcessClick(const aStart: TPointF);
begin
 f_CurrentDiagramm.ProcessClick(aStart);
end;

procedure TmsDiagramms.Clear;
begin
 f_CurrentDiagramm.Clear;
end;

procedure TmsDiagramms.SelectShape(aList: TStrings; anIndex: Integer);
begin
 f_CurrentDiagramm.SelectShape(aList, anIndex);
end;

procedure TmsDiagramms.AllowedShapesToList(aList: TStrings);
begin
 f_CurrentDiagramm.AllowedShapesToList(aList);
end;

procedure TmsDiagramms.ResizeTo(anImage: TImage);
begin
 f_CurrentDiagramm.ResizeTo(anImage);
end;

end.
