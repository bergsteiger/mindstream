unit msMovingPointerView;

interface

uses
 msInterfaces,
 msShapeView
 ;

type
 TmsMovingPointerView = class(TmsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsMovingPointerView

implementation

uses
 msMovingPointer
 ;

// TmsMovingPointerView

procedure TmsMovingPointerView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
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
