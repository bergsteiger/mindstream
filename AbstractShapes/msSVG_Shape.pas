unit msSVG_Shape;

interface

uses
 msInterfaces,
 msPolygonShape,
 System.Types,
 System.Math.Vectors,
 FMX.Graphics,
 System.SysUtils
 ;

type
 TmsSVG_Shape = class abstract(TmsPolygonShape)
// TmsSVG_Shape = class abstract(TmsShape)
  // - класс для реализации SVG объектов
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPolygonShape

implementation

// TmsPolygonShape

procedure TmsSVG_Shape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

end.
