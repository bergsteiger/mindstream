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
 l_AL : TmsAdditionalLineCoeff;
 l_C : Single;
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
 l_AL := ShapeClass.AdditionalLinesH;
 for l_C in l_AL do
  aCtx.rCanvas.DrawLine(TPointF.Create(l_R.Left, l_R.Top + l_R.Height * l_C),
                        TPointF.Create(l_R.Right, l_R.Top + l_R.Height * l_C), aCtx.rLineOpacity);
end;

end.


