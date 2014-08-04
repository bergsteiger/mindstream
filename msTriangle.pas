unit msTriangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 {$IfDef VER270}
 ,
 System.Math.Vectors
 {$EndIf}
 ;

type
 TmsTriangle = class(TmsShape)
 protected
  class function InitialHeight: Single; virtual;
  function Polygon: TPolygon; virtual;

  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;

  function ContainsPt(const aPoint: TPointF): Boolean; override;

  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsTriangle

implementation

uses
 System.Math;

class function TmsTriangle.InitialHeight: Single;
begin
 Result := 100;
end;

function TmsTriangle.Polygon: TPolygon;
begin
 SetLength(Result, 4);
 Result[0] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X + InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[2] := TPointF.Create(StartPoint.X,
                        StartPoint.Y - InitialHeight / 2);
 Result[3] := Result[0];
end;

function TmsTriangle.ContainsPt(const aPoint: TPointF): Boolean;
var
 i,j : integer;
Begin
 Result := False;
 j := High(Polygon);
 For i := Low(Polygon) to High(Polygon) do begin
  if (
      (((Polygon[i].y <= aPoint.y) and (aPoint.y < Polygon[j].y)) or
         ((Polygon[j].y <= aPoint.y) and (aPoint.y < Polygon[i].y)))
      and
        (aPoint.x < ((Polygon[j].x - Polygon[i].x) *
                     (aPoint.y - Polygon[i].y) /
                     (Polygon[j].y - Polygon[i].y) + Polygon[i].x))
     ) then
   Result := not Result;
  j := i
 end;
end;

procedure TmsTriangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

procedure TmsTriangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Green;
end;

initialization
 TmsTriangle.Register;

end.
