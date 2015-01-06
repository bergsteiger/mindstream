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
  function Polygon: TPolygon; virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
 public
  class function IsForToolbar: Boolean; override;
 end;//TmsPolygonShape

implementation

{ TmsPolygonShape }
function TmsPolygonShape.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(0,0,100,100);
end;


class function TmsPolygonShape.IsForToolbar: Boolean;
begin
 Result := False;
end;

function TmsPolygonShape.Polygon: TPolygon;
begin
 assert(False);
end;

procedure TmsPolygonShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

end.
