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
   function ShapeContainsPt(const aShape: ImsShape; const aPoint: TPointF): Boolean; override;
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

function TmsCircleView.ShapeContainsPt(const aShape: ImsShape; const aPoint: TPointF): Boolean;
var
 l_StartRectPoint, l_FinishRectPoint : TPointF;
 l_x0, l_y0, l_a, l_b : Integer;
 l_Rect : TRectF;
begin
 l_Rect := aShape.DrawBounds;

 l_StartRectPoint := l_Rect.TopLeft;
 l_FinishRectPoint := l_Rect.BottomRight;

 l_x0 := Round(l_StartRectPoint.X + l_FinishRectPoint.X) div 2;
 l_y0 := Round(l_StartRectPoint.Y + l_FinishRectPoint.Y) div 2;
 l_a := Round(l_FinishRectPoint.X - l_StartRectPoint.X) div 2;
 l_b := Round(l_FinishRectPoint.Y - l_StartRectPoint.Y) div 2;

 Result := Sqr((aPoint.X - l_x0)/l_a)+
           Sqr((aPoint.Y - l_y0)/l_b) <= 1.0;
end;

end.
