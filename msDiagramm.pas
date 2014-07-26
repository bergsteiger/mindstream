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
 FMX.Objects
 ;

type
 TmsDiagramm = class(TObject)
 private
  FShapeList : TmsShapeList;
  FCurrentClass : RmsShape;
  FCurrentAddedShape : TmsShape;
  FCanvas : TCanvas;
  FOrigin : TPointF;
 private
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  function CurrentAddedShape: TmsShape;
  procedure BeginShape(const aStart: TPointF);
  procedure EndShape(const aFinish: TPointF);
  function ShapeIsEnded: Boolean;
  class function AllowedShapes: RmsShapeList;
  procedure CanvasChanged(aCanvas: TCanvas);
 public
  constructor Create(anImage: TImage);
  procedure ResizeTo(anImage: TImage);
  destructor Destroy; override;
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  property CurrentClass : RmsShape read FCurrentClass write FCurrentClass;
  procedure Invalidate;
  procedure AllowedShapesToList(aList: TStrings);
  procedure SelectShape(aList: TStrings; anIndex: Integer);
 end;

implementation

uses
 msRegisteredPrimitives
 ;

class function TmsDiagramm.AllowedShapes: RmsShapeList;
begin
 Result := TmsRegisteredPrimitives.Instance.Primitives;
end;

procedure TmsDiagramm.AllowedShapesToList(aList: TStrings);
var
 l_Class : RmsShape;
begin
 for l_Class in AllowedShapes do
  aList.AddObject(l_Class.ClassName, TObject(l_Class));
end;

procedure TmsDiagramm.SelectShape(aList: TStrings; anIndex: Integer);
begin
 CurrentClass := RmsShape(aList.Objects[anIndex]);
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
 Assert(CurrentClass <> nil);
 FCurrentAddedShape := CurrentClass.Create(aStart, aStart);
 FShapeList.Add(FCurrentAddedShape);
 if not FCurrentAddedShape.IsNeedsSecondClick then
 // - если не надо SecondClick, то наш примитив - завершЄн
  FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDiagramm.Clear;
begin
 FCanvas.BeginScene;
 try
  FCanvas.Clear(TAlphaColorRec.Null);
 finally
  FCanvas.EndScene;
 end;//try..finally
end;

constructor TmsDiagramm.Create(anImage: TImage);
begin
 FShapeList := TmsShapeList.Create;
 FCurrentAddedShape := nil;
 FCanvas := nil;
 FOrigin := TPointF.Create(0, 0);
 ResizeTo(anImage);
 FCurrentClass := AllowedShapes.First;
end;

procedure TmsDiagramm.ResizeTo(anImage: TImage);
begin
 anImage.Bitmap := TBitmap.Create(Round(anImage.Width), Round(anImage.Height));
 CanvasChanged(anImage.Bitmap.Canvas);
end;

procedure TmsDiagramm.CanvasChanged(aCanvas: TCanvas);
begin
 FCanvas := aCanvas;
 Invalidate;
end;

function TmsDiagramm.CurrentAddedShape: TmsShape;
begin
 Result := FCurrentAddedShape;
end;

destructor TmsDiagramm.Destroy;
begin
 FreeAndNil(FShapeList);
 inherited;
end;

procedure TmsDiagramm.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 l_Shape : TmsShape;
begin
 aCanvas.BeginScene;
 try
  for l_Shape in FShapeList do
   l_Shape.DrawTo(aCanvas, aOrigin);
 finally
  aCanvas.EndScene;
 end;//try..finally
end;

procedure TmsDiagramm.EndShape(const aFinish: TPointF);
begin
 Assert(CurrentAddedShape <> nil);
 CurrentAddedShape.EndTo(aFinish);
 FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDiagramm.Invalidate;
begin
 Clear;
 DrawTo(FCanvas, FOrigin);
end;

function TmsDiagramm.ShapeIsEnded: Boolean;
begin
 Result := (CurrentAddedShape = nil);
end;

end.
