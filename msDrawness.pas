unit msDrawness;

interface

uses
 FMX.Graphics,
 Generics.Collections,
 System.SysUtils,
 System.Types,
 System.UITypes,
 msShape,
 msRegisteredPrimitives;

type
 TShapeList = TObjectList<TmsShape>;

 TmsDrawness = class
 private
  FShapeList : TShapeList;
  FCurrentClass : RmsShape;
  FCurrentAddedShape : TmsShape;
 public
  constructor Create;
  destructor Destroy; override;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  procedure AddPrimitive(const aStart: TPointF; const aFinish: TPointF);
  procedure Clear(const aCanvas : TCanvas);
  property CurrentClass : RmsShape read FCurrentClass write FCurrentClass;
  function CurrentAddedShape: TmsShape;
  procedure FinalizeCurrentShape(const aFinish: TPointF);
 end;

implementation

{ TDrawness }

procedure TmsDrawness.AddPrimitive(const aStart: TPointF; const aFinish: TPointF);
begin
 Assert(CurrentClass <> nil);
 FCurrentAddedShape := CurrentClass.Create(aStart, aFinish);
 FShapeList.Add(FCurrentAddedShape);
 if not FCurrentAddedShape.IsNeedsSecondClick then
 // - если не надо SecondClick, то наш примитив - завершён
  FCurrentAddedShape := nil;
end;

procedure TmsDrawness.Clear(const aCanvas: TCanvas);
begin
  aCanvas.BeginScene;
  aCanvas.Clear(TAlphaColorRec.Null);
  aCanvas.EndScene;
end;

constructor TmsDrawness.Create;
begin
 FShapeList := TShapeList.Create;
 FCurrentAddedShape := nil;
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
 Clear(aCanvas);
 for i:= 0 to FShapeList.Count-1
  do FShapeList[i].DrawTo(aCanvas, aOrigin);
end;

procedure TmsDrawness.FinalizeCurrentShape(const aFinish: TPointF);
begin
  Assert(CurrentAddedShape <> nil);
  CurrentAddedShape.FinalPoint := aFinish;
  FCurrentAddedShape := nil;
end;

end.
