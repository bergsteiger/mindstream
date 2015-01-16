unit msSVG_Shape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 System.Math.Vectors,
 FMX.Graphics,
 System.SysUtils
 ;

type
 TmsSVG_Shape = class(TmsShape)
// TmsSVG_Shape = class abstract(TmsShape)
  // - класс для реализации SVG объектов
 protected
  function Polygon: TPolygon; virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
 end;//TmsPolygonShape

implementation

// TmsPolygonShape

function TmsSVG_Shape.GetDrawBounds: TRectF;
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


function TmsSVG_Shape.Polygon: TPolygon;
{const
 с_InitialHeight = 150;
var
 l_PolygonSVG : TPolygon;
 l_SVG_String: string;
 l_PD: TPathData;
 l_Point: TPointF;          }
begin
 {l_PD := TPathData.Create;

 l_SVG_String := 'M 100,0,  L 200,100, L 100,200, L 0,100, L 100,0';

 l_PD.Data := l_SVG_String;
 l_Point:= l_PD.FlattenToPolygon(l_PolygonSVG);
 Result := l_PolygonSVG;

 FreeAndNil(l_PD);}
end;

procedure TmsSVG_Shape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

end.
