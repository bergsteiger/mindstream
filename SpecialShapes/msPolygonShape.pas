unit msPolygonShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 System.Math.Vectors
 ;

type
 TmsPolygonShape = class abstract(TmsShape)
  // - класс для реализации полигональных объектов
 protected
  function Polygon: TPolygon; virtual; abstract;
//  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
 public
  class function IsForToolbar: Boolean; override;
  class function IsTool: Boolean; override;
 end;//TmsPolygonShape

implementation

{ TmsPolygonShape }
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


class function TmsPolygonShape.IsForToolbar: Boolean;
begin
 Result := False;
end;

class function TmsPolygonShape.IsTool: Boolean;
begin
 Result := True;
end;

end.
