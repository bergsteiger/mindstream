unit msActorView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsActorView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsActorView

implementation

// TmsActorView

procedure TmsActorView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
  l_DH: Pixel;
  l_DW: Pixel;
  l_CircleRect: TRectF;

  l_StartPoint: TPointF;
  l_EndPoint: TPointF;
begin
  l_DH := aShape.DrawBounds.Height / 8;
  l_DW := aShape.DrawBounds.Width / 4;

  l_CircleRect.Create(
    aShape.StartPoint.X - l_DW,
    aShape.StartPoint.Y - 4 * l_DH,
    aShape.StartPoint.X + l_DW,
    aShape.StartPoint.Y - 2 * l_DH
  );
  aCtx.rCanvas.DrawEllipse(l_CircleRect, aCtx.rLineOpacity);
  aCtx.rCanvas.FillEllipse(l_CircleRect, aCtx.rOpacity);

  l_StartPoint := TPointF.Create(aShape.StartPoint.X - 2 * l_DW, aShape.StartPoint.Y - 1 * l_DH);
  l_EndPoint := TPointF.Create(aShape.StartPoint.X + 2 * l_DW, l_StartPoint.Y);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint := TPointF.Create(aShape.StartPoint.X, aShape.StartPoint.Y - 2 * l_DH);
  l_EndPoint := TPointF.Create(aShape.StartPoint.X, aShape.StartPoint.Y + 2 * l_DH);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint := TPointF.Create(aShape.StartPoint.X, aShape.StartPoint.Y + 2 * l_DH);
  l_EndPoint := TPointF.Create(aShape.StartPoint.X - 2 * l_DW, aShape.StartPoint.Y + 4 * l_DH);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint := TPointF.Create(aShape.StartPoint.X, aShape.StartPoint.Y + 2 * l_DH);
  l_EndPoint := TPointF.Create(aShape.StartPoint.X + 2 * l_DW, aShape.StartPoint.Y + 4 * l_DH);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);
end;

end.
