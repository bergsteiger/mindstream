unit msRectangleView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsRectangleView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsRectangleView

implementation

uses
 FMX.Types
 ;

// TmsRectangleView

procedure TmsRectangleView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_R: TRectF;
begin
 l_R := aShape.DrawBounds;
 aCtx.rCanvas.DrawRect(l_R,
                  aShape.ShapeClass.CornerRadius,
                  aShape.ShapeClass.CornerRadius,
                  AllCorners,
                  aCtx.rLineOpacity,
                  TCornerType.Round);
 aCtx.rCanvas.FillRect(l_R,
                  aShape.ShapeClass.CornerRadius,
                  aShape.ShapeClass.CornerRadius,
                  AllCorners,
                  aCtx.rOpacity,
                  TCornerType.Round);
end;

end.
