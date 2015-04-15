unit msShapeView;

interface

uses
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsShapeView = class(TmsInterfacedRefcounted, ImsShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); virtual;
  public
   class function Create: ImsShapeView;
 end;//TmsShapeView

implementation

// TmsShapeView

class function TmsShapeView.Create: ImsShapeView;
begin
 Result := inherited Create;
end;

procedure TmsShapeView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
begin
 Assert(false, 'Abstract method');
end;

end.
