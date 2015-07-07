unit msPolygonShapeView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsPolygonShapeView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsPolygonShapeView

implementation

// TmsPolygonShapeView

procedure TmsPolygonShapeView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_P : TPolygon;
begin
 l_P := aShape.Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, aCtx.rLineOpacity);
 aCtx.rCanvas.FillPolygon(l_P, aCtx.rOpacity);
end;

end.
