unit msActor;

interface

uses
  msInterfaces,
  msPolygonShape,
  System.Types,
  System.Math.Vectors,
  FMX.Graphics,
  System.SysUtils,
  msSVGShape;

type
  TmsActor = class (TmsSVGShape)
  protected
    procedure DoDrawTo(const aCtx: TmsDrawContext); override;
    function GetDrawBounds: TRectF; override;
  end;

implementation

{ TmsActor }

procedure TmsActor.DoDrawTo(const aCtx: TmsDrawContext);
var
  vHalfQuater: Pixel;
  vBounds: TRectF;
  vRect: TRectF;

  vFromPoint: TPointF;
  vToPoint: TPointF;
  vSVGCode: string;
  vBody: TPolygon;
begin
  vBounds :=  GetDrawBounds;
  vHalfQuater :=  vBounds.Height / 8;

  vRect.Create(
    StartPoint.X - vHalfQuater,
    StartPoint.Y - 4 * vHalfQuater,
    StartPoint.X + vHalfQuater,
    StartPoint.Y - 2 *vHalfQuater
  );
  aCtx.rCanvas.DrawEllipse(vRect, aCtx.rLineOpacity);
  aCtx.rCanvas.FillEllipse(vRect, aCtx.rOpacity);

  vFromPoint  :=  TPointF.Create(StartPoint.X - 2 * vHalfQuater, StartPoint.Y - 1 * vHalfQuater);
  vToPoint  :=  TPointF.Create(StartPoint.X + 2 * vHalfQuater, vFromPoint.Y);
  aCtx.rCanvas.DrawLine(vFromPoint, vToPoint, aCtx.rLineOpacity);

  vFromPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y - 2 * vHalfQuater);
  vToPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * vHalfQuater);
  aCtx.rCanvas.DrawLine(vFromPoint, vToPoint, aCtx.rLineOpacity);

  vFromPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * vHalfQuater);
  vToPoint  :=  TPointF.Create(StartPoint.X - 2 * vHalfQuater, StartPoint.Y + 4 * vHalfQuater);
  aCtx.rCanvas.DrawLine(vFromPoint, vToPoint, aCtx.rLineOpacity);

  vFromPoint  :=  TPointF.Create(StartPoint.X, StartPoint.Y + 2 * vHalfQuater);
  vToPoint  :=  TPointF.Create(StartPoint.X + 2 * vHalfQuater, StartPoint.Y + 4 * vHalfQuater);
  aCtx.rCanvas.DrawLine(vFromPoint, vToPoint, aCtx.rLineOpacity);
end;

function TmsActor.GetDrawBounds: TRectF;
var
  vQuater: Extended;
begin
  vQuater :=  Self.ShapeClass.InitialHeight / 4;

  Result.Create(
    StartPoint.X - vQuater,
    StartPoint.Y - 2 * vQuater,
    StartPoint.X + vQuater,
    StartPoint.Y + 2 * vQuater
  );
end;

end.
