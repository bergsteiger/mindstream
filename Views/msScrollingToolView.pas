unit msScrollingToolView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsScrollingToolView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsScrollingToolView

implementation

uses
 msMovingPointer
 ;

// TmsScrollingToolView

procedure TmsScrollingToolView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 l_Proxy : ImsShape;
begin
 l_Proxy := TmsMovingPointer.Create(aShape.StartPoint);
 try
  l_Proxy.DrawTo(aCtx);
 finally
  l_Proxy := nil;
 end;///try..fianlly
end;

end.
