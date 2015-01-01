unit msPolygonShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 System.Math.Vectors
 ;

type
 TmsPolygonShape = class(TmsShape)
  // - класс для реализации полигональных объектов
 protected
  function Polygon: TPolygon; virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPolygonShape

implementation

{ TmsPolygonShape }

procedure TmsPolygonShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

function TmsPolygonShape.Polygon: TPolygon;
begin
 assert(False);
end;

end.
