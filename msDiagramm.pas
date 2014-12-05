unit msDiagramm;

interface

uses
 FMX.Graphics,
 Generics.Collections,
 System.SysUtils,
 System.Types,
 System.UITypes,
 msShape,
 msPointCircle,
 System.Classes,
 FMX.Objects,
 msRegisteredShapes,
 FMX.Dialogs,
 System.JSON,
 Data.DBXJSONReflect,
 msCoreObjects,
 msSerializeInterfaces,
 msInterfacedNonRefcounted
 ;

type
 TmsShapeList = class(TList<ImsShape>)
 public
  function ShapeByPt(const aPoint: TPointF): ImsShape;
 end; // TmsShapeList

 TmsDiagramm = class(TmsInterfacedNonRefcounted, ImsShapeByPt, ImsShapesController)
 // - ¬ыдел€ем интерфейс ImsObjectWrap.
 //   —мешно - если TmsDiagramm его реализет Ќјѕ–яћ”ё, то всЄ хорошо.
 //   ј если через ImsSerializable, то - AV.
 //   ѕро это можно писать отдельную статью.
 private
  [JSONMarshalled(True)]
  FShapeList: TmsShapeList;
  [JSONMarshalled(False)]
  FCurrentClass: RmsShape;
  [JSONMarshalled(False)]
  FCurrentAddedShape: ImsShape;
  [JSONMarshalled(False)]
  FMovingShape: TmsShape;
  [JSONMarshalled(False)]
  FCanvas: TCanvas;
  [JSONMarshalled(False)]
  FOrigin: TPointF;
  fName: String;
 private
  procedure DrawTo(const aCanvas: TCanvas; const aOrigin: TPointF);
  function CurrentAddedShape: ImsShape;
  procedure BeginShape(const aStart: TPointF);
  procedure EndShape(const aFinish: TPointF);
  function ShapeIsEnded: Boolean;
  class function AllowedShapes: TmsRegisteredShapes;
  procedure CanvasChanged(aCanvas: TCanvas);
  function ShapeByPt(const aPoint: TPointF): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  property CurrentClass: RmsShape read FCurrentClass write FCurrentClass;
  function pm_GetShapeList: TmsShapeList;
  procedure pm_SetShapeList(aValue: TmsShapeList);
 public
  constructor Create(anImage: TImage; const aName: String);
  procedure ResizeTo(anImage: TImage);
  destructor Destroy; override;
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure Invalidate;
  procedure AllowedShapesToList(aList: TStrings);
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  property Name: String read fName write fName;
  property ShapeList: TmsShapeList read pm_GetShapeList write pm_SetShapeList;
  function CurrentShapeClassIndex: Integer;
  procedure Serialize;
  procedure DeSerialize;
  procedure Assign(const anOther : TmsDiagramm);
 end;//TmsDiagramm

implementation

uses
 msMover,
 msCircle,
 msDiagrammMarshal
 ;

const
 c_FileName = '.json';

class function TmsDiagramm.AllowedShapes: TmsRegisteredShapes;
begin
 Result := TmsRegisteredShapes.Instance;
end;

procedure TmsDiagramm.AllowedShapesToList(aList: TStrings);
var
 l_Class: RmsShape;
begin
 aList.Clear;
 for l_Class in AllowedShapes do
  if l_Class.IsForToolbar then
   aList.AddObject(l_Class.ClassName, TObject(l_Class));
end;

function TmsDiagramm.CurrentShapeClassIndex: Integer;
begin
 Result := AllowedShapes.IndexOf(FCurrentClass);
end;

procedure TmsDiagramm.SelectShape(aList: TStrings; anIndex: Integer);
begin
 CurrentClass := RmsShape(aList.Objects[anIndex]);
end;

procedure TmsDiagramm.Serialize;
begin
 TmsDiagrammMarshal.Serialize(Self.Name + c_FileName, self);
end;

procedure TmsDiagramm.ProcessClick(const aStart: TPointF);
begin
 if ShapeIsEnded then
  // - мы Ќ≈ ƒќЅј¬ЋяЋ» примитива - надо его ƒќЅј¬»“№
  BeginShape(aStart)
 else
  EndShape(aStart);
end;

procedure TmsDiagramm.BeginShape(const aStart: TPointF);
begin
 assert(CurrentClass <> nil);
 FCurrentAddedShape := CurrentClass.Create(TmsMakeShapeContext.Create(aStart, Self));
 if (FCurrentAddedShape <> nil) then
 begin
  FShapeList.Add(FCurrentAddedShape);
  if not FCurrentAddedShape.IsNeedsSecondClick then
   // - если не надо SecondClick, то наш примитив - завершЄн
   FCurrentAddedShape := nil;
  Invalidate;
 end; // FCurrentAddedShape <> nil
end;

procedure TmsDiagramm.Clear;
begin
 if (FShapeList <> nil) then
  FShapeList.Clear;
 Invalidate;
end;

constructor TmsDiagramm.Create(anImage: TImage; const aName: String);
begin
 inherited Create;
 FShapeList := TmsShapeList.Create;
 FCurrentAddedShape := nil;
 FCanvas := nil;
 FOrigin := TPointF.Create(0, 0);
 ResizeTo(anImage);
 FCurrentClass := AllowedShapes.First;
 fName := aName;
end;

procedure TmsDiagramm.ResizeTo(anImage: TImage);
begin
 if (anImage <> nil) then
 begin
  anImage.Bitmap := TBitmap.Create(Round(anImage.Width), Round(anImage.Height));
  CanvasChanged(anImage.Bitmap.Canvas);
 end;//anImage <> nil
end;

procedure TmsDiagramm.CanvasChanged(aCanvas: TCanvas);
begin
 FCanvas := aCanvas;
 Invalidate;
end;

function TmsDiagramm.CurrentAddedShape: ImsShape;
begin
 Result := FCurrentAddedShape;
end;

procedure TmsDiagramm.Assign(const anOther : TmsDiagramm);
begin
 Self.ShapeList := anOther.ShapeList;
 Self.Name := anOther.Name;
 Self.Invalidate;
end;

procedure TmsDiagramm.DeSerialize;
begin
 Clear;
 try
  TmsDiagrammMarshal.DeSerialize(Self.Name + c_FileName, Self);
 except
  on EFOpenError do
   Exit;
 end;//try..except
end;

destructor TmsDiagramm.Destroy;
begin
 FreeAndNil(FShapeList);
 inherited;
end;

procedure TmsDiagramm.DrawTo(const aCanvas: TCanvas; const aOrigin: TPointF);
var
 l_Shape: ImsShape;
begin
 aCanvas.BeginScene;
 try
  Assert(FShapeList <> nil);
  for l_Shape in FShapeList do
   l_Shape.DrawTo(TmsDrawContext.Create(aCanvas, aOrigin));
 finally
  aCanvas.EndScene;
 end; // try..finally
end;

procedure TmsDiagramm.EndShape(const aFinish: TPointF);
begin
 assert(CurrentAddedShape <> nil);
 CurrentAddedShape.EndTo(TmsEndShapeContext.Create(aFinish, Self));
 FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDiagramm.Invalidate;
begin
 if (FCanvas <> nil) then
 begin
  FCanvas.BeginScene;
  try
   FCanvas.Clear(TAlphaColorRec.Null);
   DrawTo(FCanvas, FOrigin);
  finally
   FCanvas.EndScene;
  end;//try..finally
 end;//FCanvas <> nil
end;

function TmsDiagramm.ShapeIsEnded: Boolean;
begin
 Result := (CurrentAddedShape = nil);
end;

function TmsDiagramm.ShapeByPt(const aPoint: TPointF): ImsShape;

begin
 Result := FShapeList.ShapeByPt(aPoint);
end;

procedure TmsDiagramm.RemoveShape(const aShape: ImsShape);
begin
 Assert(FShapeList <> nil);
 FShapeList.Remove(aShape);
end;

function TmsDiagramm.pm_GetShapeList: TmsShapeList;
begin
 if (FShapeList = nil) then
  FShapeList := TmsShapeList.Create;
 Result := FShapeList;
end;

procedure TmsDiagramm.pm_SetShapeList(aValue: TmsShapeList);
var
 l_Shape : ImsShape;
begin
 if (FShapeList <> nil) then
  FShapeList.Clear;
 if (aValue <> nil) then
  for l_Shape in aValue do
  begin
   if (FShapeList = nil) then
    FShapeList := TmsShapeList.Create;
   FShapeList.Add(l_Shape);
  end;//for l_Shape in aValue
end;

function TmsShapeList.ShapeByPt(const aPoint: TPointF): ImsShape;
var
 l_Shape: ImsShape;
 l_Index: Integer;
begin
 Result := nil;
 for l_Index := Self.Count - 1 downto 0 do
 begin
  l_Shape := Self.Items[l_Index];
  if l_Shape.ContainsPt(aPoint) then
  begin
   Result := l_Shape;
   Exit;
  end; // l_Shape.ContainsPt(aPoint)
 end; // for l_Index
end;

end.
