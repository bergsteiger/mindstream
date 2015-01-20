unit msPolygonShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 System.Math.Vectors,
 msPointedShape
 ;

type
 TmsPolygonShape = class abstract(TmsPointedShape)
  // - класс для реализации полигональных объектов
 protected
  function Polygon: TPolygon;
  function GetPolygon: TPolygon; virtual; abstract;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end;//TmsPolygonShape

implementation

// TmsPolygonShape

function TmsPolygonShape.GetDrawBounds: TRectF;
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


function TmsPolygonShape.Polygon: TPolygon;
begin
 Result := GetPolygon;
 Assert(Length(Result) > 3);
end;

procedure TmsPolygonShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

function TmsPolygonShape.ContainsPt(const aPoint: TPointF): Boolean;
var
 i,j : integer;
Begin
 Result := False;
 j := High(Polygon);
 for i := Low(Polygon) to High(Polygon) do
 begin
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

end.
