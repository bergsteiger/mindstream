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
 public
  constructor Create;
  destructor Destroy; override;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  procedure AddPrimitive(const aShape : TmsShape);
  procedure Clear(const aCanvas : TCanvas);
  property CurrentClass : RmsShape read FCurrentClass write FCurrentClass;
  function CurrentAddedShape: TmsShape;
 end;

implementation

{ TDrawness }

procedure TmsDrawness.AddPrimitive(const aShape: TmsShape);
begin
 FShapeList.Add(aShape);
end;

procedure TmsDrawness.Clear(const aCanvas: TCanvas);
begin
  aCanvas.BeginScene;
  aCanvas.Clear(TAlphaColorRec.Null);
  aCanvas.EndScene;
end;

constructor TmsDrawness.Create;
begin
 FShapeList := TShapeList.Create();
end;

function TmsDrawness.CurrentAddedShape: TmsShape;
begin
 result := FShapeList.Last;
end;

destructor TmsDrawness.Destroy;
begin
 freeandnil(FShapeList);
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

end.
