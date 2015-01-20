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
 // - базовый класс для реализации SVG объектов
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPolygonShape

implementation

// TmsSVG_Shape

procedure TmsSVG_Shape.DoDrawTo(const aCtx: TmsDrawContext);
begin
 inherited;
end;

end.
