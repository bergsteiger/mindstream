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
  function GetPolygonSVG: String; virtual; abstract;
 end;//TmsPolygonShape

implementation

// TmsSVG_Shape

procedure TmsSVG_Shape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_OriginalMatrix: TMatrix;
begin
 l_OriginalMatrix := aCtx.rCanvas.Matrix;
 try
  inherited;
 finally
  aCtx.rCanvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
 end;//try..finally
end;

end.
