unit msLineView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsLineView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsLineView

implementation

uses
 msShape,
 msPredefinedShapes
 ;

// TmsLineView

procedure TmsLineView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_Proxy : ImsShape;
 l_FinishPoint: TPointF;
begin
 if (aShape.StartPoint = aShape.FinishPoint) then
 begin
  l_Proxy := MCmsPointCircle.AsRef.CreateShape(aShape.StartPoint);
  try
   l_Proxy.DrawTo(aCtx);
  finally
   l_Proxy := nil;
  end;//try..finally
 end//StartPoint = FinishPoint
 else
 begin
  l_FinishPoint := aShape.FinishPoint;
  if (aShape.ShapeClass.ArrowHeadShapeMC <> nil) then
  begin
   l_Proxy := aShape.ShapeClass.ArrowHeadShapeMC.CreateShape(l_FinishPoint);
   try
    l_FinishPoint := l_Proxy.TransformFinishPoint(TmsShape.AngleBetween(aShape.StartPoint, l_FinishPoint));
   finally
    l_Proxy := nil;
   end;//try..finally
  end;//aShape.ShapeClass.ArrowHeadShapeMC <> nil
  aCtx.rCanvas.DrawLine(aShape.StartPoint, l_FinishPoint, 1);
 end;//StartPoint = FinishPoint
end;

end.
