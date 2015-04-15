unit msTextShapeView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsTextShapeView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsTextShapeView

implementation

uses
 FMX.Types
 ;

// TmsTextShapeView

procedure TmsTextShapeView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_msPointContext: TRectF;
begin
 l_msPointContext := aShape.DrawBounds;
 aCtx.rCanvas.FillText(l_msPointContext,
                       aShape.ShapeClass.Text,
                       false,
                       1,
                       [],
                       TTextAlign.Center,
                       TTextAlign.Center);
 if aCtx.rMoving then
 begin
  aCtx.rCanvas.DrawRect(l_msPointContext,
                   0{CornerRadius},
                   0{CornerRadius},
                   AllCorners,
                   1,
                   TCornerType.Round);
 end;//aCtx.rMoving
end;

end.
