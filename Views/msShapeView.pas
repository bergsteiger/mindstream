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
   function ShapeContainsPt(const aShape: ImsShape; const aPoint: TPointF): Boolean; virtual;
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

function TmsShapeView.ShapeContainsPt(const aShape: ImsShape; const aPoint: TPointF): Boolean;
begin
 Result := aShape.DrawBounds.Contains(aPoint);
end;

end.
