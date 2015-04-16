unit msCircleView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsCircleView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsCircleView

implementation

// TmsCircleView

procedure TmsCircleView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_Rect : TRectF;
begin
 l_Rect := aShape.DrawBounds;
 aCtx.rCanvas.DrawEllipse(l_Rect, aCtx.rLineOpacity);
 aCtx.rCanvas.FillEllipse(l_Rect, aCtx.rOpacity);
end;

end.
