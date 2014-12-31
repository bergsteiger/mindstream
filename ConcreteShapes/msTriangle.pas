unit msTriangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 {$IF DEFined(VER270) OR DEFined(VER280)}
 ,
 System.Math.Vectors
 {$ENDIF}
 ,
 msInterfaces
 ;

type
 TmsTriangle = class(TmsShape)
 protected
  class function InitialHeight: Single; virtual;
  function Polygon: TPolygon; virtual;
  function GetDrawBounds: TRectF; override;

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

function TmsTriangle.GetDrawBounds: TRectF;
var
 l_Pl : TPolygon;
 l_P : TPointF;
begin
 l_Pl := Polygon;
 Result.Left := High(Integer);
 Result.Top := High(Integer);
 Result.Right := Low(Integer);
 Result.Bottom := Low(Integer);
 for l_P in l_PL do
 begin
  if (l_P.X < Result.Left) then
   Result.Left := l_P.X;
  if (l_P.X > Result.Right) then
   Result.Right := l_P.X;

  if (l_P.Y < Result.Top) then
   Result.Top := l_P.Y;
  if (l_P.Y > Result.Bottom) then
   Result.Bottom := l_P.Y;
 end;//l_P in l_PL
 //Result := PolygonBounds(Polygon);
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

end.
