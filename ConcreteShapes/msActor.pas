unit msActor;

interface

uses
  msInterfaces,
  msPolygonShape,
  msPointedShape,
  msRectangularShape,
  FMX.Graphics
  ;

type
  TmsActor = class(TmsRectangularShape)
  // ћне так кажетс€, что данный примитив можно разбить на три - TmsPolygonShape, TmsCircle и TmsShapeGroup.
  // ѕЋќ’ќ  ј∆≈“—я.
  protected
    procedure DoDrawTo(const aCtx: TmsDrawContext); override;
    function GetDrawBounds: TRectF; override;
  end;//TmsActor

implementation

// TmsActor

procedure TmsActor.DoDrawTo(const aCtx: TmsDrawContext);
var
  l_DH: Pixel;
  l_DW: Pixel;
  l_CircleRect: TRectF;

  l_StartPoint: TPointF;
  l_EndPoint: TPointF;
begin
  l_DH := DrawBounds.Height / 8;
  l_DW := DrawBounds.Width / 4;

  l_CircleRect.Create(
    StartPoint.X - l_DW,
    StartPoint.Y - 4 * l_DH,
    StartPoint.X + l_DW,
    StartPoint.Y - 2 * l_DH
  );
  aCtx.rCanvas.DrawEllipse(l_CircleRect, aCtx.rLineOpacity);
  aCtx.rCanvas.FillEllipse(l_CircleRect, aCtx.rOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X - 2 * l_DW, StartPoint.Y - 1 * l_DH);
  l_EndPoint  :=  TPointF.Create(StartPoint.X + 2 * l_DW, l_StartPoint.Y);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y - 2 * l_DH);
  l_EndPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * l_DH);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * l_DH);
  l_EndPoint  :=  TPointF.Create(StartPoint.X - 2 * l_DW, StartPoint.Y + 4 * l_DH);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * l_DH);
  l_EndPoint  :=  TPointF.Create(StartPoint.X + 2 * l_DW, StartPoint.Y + 4 * l_DH);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);
end;

function TmsActor.GetDrawBounds: TRectF;
var
  l_HeightQuater: Pixel;
begin
  l_HeightQuater :=  Self.ShapeClass.InitialHeight / 4;

  Result.Create(
    StartPoint.X - l_HeightQuater,
    StartPoint.Y - 2 * l_HeightQuater,
    StartPoint.X + l_HeightQuater,
    StartPoint.Y + 2 * l_HeightQuater
  );
end;

end.
