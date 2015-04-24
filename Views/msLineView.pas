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
 msShape
 ;

// TmsLineView

procedure TmsLineView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_Proxy : ImsShape;
 l_FinishPoint: TPointF;
begin
 if (aShape.StartPoint = aShape.FinishPoint) then
 begin
  l_Proxy := TmsShape.NamedMC('PointCircle').CreateShape(aShape.StartPoint);
  try
   l_Proxy.DrawTo(aCtx);
  finally
   l_Proxy := nil;
  end;//try..finally
 end//StartPoint = FinishPoint
 else
 begin
  l_FinishPoint := aShape.TransformFinishPoint(aShape.FinishPoint);
  aCtx.rCanvas.DrawLine(aShape.StartPoint, l_FinishPoint, 1);
 end;//StartPoint = FinishPoint
end;

end.
