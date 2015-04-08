unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msRectangularShape
 ;

type
 TmsRectangle = class(TmsRectangularShape)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsRectangle

implementation

// TmsRectangle

procedure TmsRectangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_R: TRectF;
begin
 l_R := DrawBounds;
 aCtx.rCanvas.DrawRect(l_R,
                  ShapeClass.CornerRadius,
                  ShapeClass.CornerRadius,
                  AllCorners,
                  aCtx.rLineOpacity,
                  TCornerType.Round);
 aCtx.rCanvas.FillRect(l_R,
                  ShapeClass.CornerRadius,
                  ShapeClass.CornerRadius,
                  AllCorners,
                  aCtx.rOpacity,
                  TCornerType.Round);
end;

end.


