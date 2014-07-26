unit msDrawness;

interface

uses
 FMX.Graphics,
 Generics.Collections,
 System.SysUtils,
 System.Types,
 System.UITypes,
 msShape,
 msRegisteredPrimitives,
 msPointCircle;

type
 TShapeList = TObjectList<TmsShape>;

 TmsDrawness = class
 private
  FShapeList : TShapeList;
  FCurrentClass : RmsShape;
  FCurrentAddedShape : TmsShape;
  FCanvas : TCanvas;
  FOrigin : TPointF;
 private
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  function CurrentAddedShape: TmsShape;
 public
  constructor Create(aCanvas: TCanvas);
  destructor Destroy; override;
  procedure BeginShape(const aStart: TPointF);
  procedure Clear(const aCanvas : TCanvas);
  property CurrentClass : RmsShape read FCurrentClass write FCurrentClass;
  procedure EndShape(const aFinish: TPointF);
  procedure Invalidate;
  function ShapeIsEnded: Boolean;
 end;

implementation

{ TDrawness }

procedure TmsDrawness.BeginShape(const aStart: TPointF);
begin
 Assert(CurrentClass <> nil);
 FCurrentAddedShape := CurrentClass.Create(aStart, aStart);
 FShapeList.Add(FCurrentAddedShape);
 if not FCurrentAddedShape.IsNeedsSecondClick then
 // - если не надо SecondClick, то наш примитив - завершён
  FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDrawness.Clear(const aCanvas: TCanvas);
begin
 aCanvas.BeginScene;
 try
  aCanvas.Clear(TAlphaColorRec.Null);
 finally
  aCanvas.EndScene;
 end;//try..finally
end;

constructor TmsDrawness.Create(aCanvas: TCanvas);
begin
 FShapeList := TShapeList.Create;
 FCurrentAddedShape := nil;
 FCanvas := aCanvas;
 FOrigin := TPointF.Create(0, 0)
end;

function TmsDrawness.CurrentAddedShape: TmsShape;
begin
 Result := FCurrentAddedShape;
end;

destructor TmsDrawness.Destroy;
begin
 FreeAndNil(FShapeList);
 inherited;
end;

procedure TmsDrawness.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 i : Integer;
begin
 aCanvas.BeginScene;
 try
  for i:= 0 to FShapeList.Count-1
   do FShapeList[i].DrawTo(aCanvas, aOrigin);
 finally
  aCanvas.EndScene;
 end;//try..finally
end;

procedure TmsDrawness.EndShape(const aFinish: TPointF);
begin
 Assert(CurrentAddedShape <> nil);
 CurrentAddedShape.FinishPoint := aFinish;
 FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDrawness.Invalidate;
begin
 Clear(FCanvas);
 DrawTo(FCanvas, FOrigin);
end;

function TmsDrawness.ShapeIsEnded: Boolean;
begin
 Result := (CurrentAddedShape = nil);
end;

end.
