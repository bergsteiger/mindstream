unit msActor;

interface

uses
  msInterfaces,
  msPolygonShape,
  System.Types,
  System.Math.Vectors,
  FMX.Graphics,
  System.SysUtils;

type
  TmsActor = class (TmsPolygonShape)
  // Мне так кажется, что данный примитив можно разбить на три - TmsPolygonShape, TmsCircle и TmsShapeGroup.
  protected
    function GetPolygon: TPolygon; override;
    procedure DoDrawTo(const aCtx: TmsDrawContext); override;
    function GetDrawBounds: TRectF; override;
  end;//TmsActor

implementation

// TmsActor

procedure TmsActor.DoDrawTo(const aCtx: TmsDrawContext);
var
  l_HeightHalfQuater: Pixel;
  l_CircleRect: TRectF;

  l_StartPoint: TPointF;
  l_EndPoint: TPointF;
begin
  l_HeightHalfQuater :=  GetDrawBounds.Height / 8;

  l_CircleRect.Create(
    StartPoint.X - l_HeightHalfQuater,
    StartPoint.Y - 4 * l_HeightHalfQuater,
    StartPoint.X + l_HeightHalfQuater,
    StartPoint.Y - 2 *l_HeightHalfQuater
  );
  aCtx.rCanvas.DrawEllipse(l_CircleRect, aCtx.rLineOpacity);
  aCtx.rCanvas.FillEllipse(l_CircleRect, aCtx.rOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X - 2 * l_HeightHalfQuater, StartPoint.Y - 1 * l_HeightHalfQuater);
  l_EndPoint  :=  TPointF.Create(StartPoint.X + 2 * l_HeightHalfQuater, l_StartPoint.Y);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y - 2 * l_HeightHalfQuater);
  l_EndPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * l_HeightHalfQuater);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * l_HeightHalfQuater);
  l_EndPoint  :=  TPointF.Create(StartPoint.X - 2 * l_HeightHalfQuater, StartPoint.Y + 4 * l_HeightHalfQuater);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);

  l_StartPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * l_HeightHalfQuater);
  l_EndPoint  :=  TPointF.Create(StartPoint.X + 2 * l_HeightHalfQuater, StartPoint.Y + 4 * l_HeightHalfQuater);
  aCtx.rCanvas.DrawLine(l_StartPoint, l_EndPoint, aCtx.rLineOpacity);
end;

function TmsActor.GetDrawBounds: TRectF;
var
  l_HeightQuater: Extended;
begin
  l_HeightQuater :=  Self.ShapeClass.InitialHeight / 4;

  Result.Create(
    StartPoint.X - l_HeightQuater,
    StartPoint.Y - 2 * l_HeightQuater,
    StartPoint.X + l_HeightQuater,
    StartPoint.Y + 2 * l_HeightQuater
  );
end;

function TmsActor.GetPolygon: TPolygon;
var
  l_Bounds: TRectF;
begin
  SetLength(Result, 5);
  l_Bounds  :=  GetDrawBounds;
  Result[0] :=  TPointF.Create(StartPoint.X, l_Bounds.Top);
  Result[1] :=  TPointF.Create(l_Bounds.Left, StartPoint.Y);
  Result[2] :=  TPointF.Create(l_Bounds.Right, StartPoint.Y);
  Result[3] :=  TPointF.Create(l_Bounds.Left, l_Bounds.Bottom);
  Result[4] :=  TPointF.Create(l_Bounds.Right, l_Bounds.Bottom);
end;

end.
