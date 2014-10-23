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
 TmsDiagrammList = class(TObjectList<TmsDiagramm>)
 end;//TmsDiagrammList

 TmsDiagramms = class(TObject)
 private
  f_Diagramms : TmsDiagrammList;
  f_CurrentDiagramm : TmsDiagramm;
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
 f_CurrentDiagramm.Invalidate;
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

function TmsDiagramms.CurrentShapeClassIndex: Integer;
begin
 Result := f_CurrentDiagramm.CurrentShapeClassIndex;
end;

end.

