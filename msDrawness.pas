unit msDrawness;

interface

uses
 FMX.Graphics,
 Generics.Collections,
 System.SysUtils,
 System.Types,
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
  procedure DrawLastPrimitive(const aCanvas : TCanvas; const aOrigin : TPointF);
  property CurrentClass : RmsShape read FCurrentClass write FCurrentClass;
 end;

implementation

{ TDrawness }

procedure TmsDrawness.AddPrimitive(const aShape: TmsShape);
begin
 FShapeList.Add(aShape);
end;

constructor TmsDrawness.Create;
begin
 FShapeList := TShapeList.Create();
end;

destructor TmsDrawness.Destroy;
begin
 freeandnil(FShapeList);
 inherited;
end;

procedure TmsDrawness.DrawLastPrimitive(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 FShapeList.Last.DrawTo(aCanvas, aOrigin);
end;

procedure TmsDrawness.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 i : Integer;
begin
 for i:= 0 to FShapeList.Count-1
  do FShapeList[i].DrawTo(aCanvas, aOrigin);
end;

end.
