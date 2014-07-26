unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 msRegisteredPrimitives
 ;

type
 TmsRectangle = class(TmsShape)
 protected
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
 end;

implementation

const
 c_RectangleHeight = 150;
 c_RectangleWidth = 100;

{ TmsRectangle }

constructor TmsRectangle.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 inherited Create(aStartPoint,
                  TPointF.Create(aStartPoint.X + c_RectangleWidth,
                                 aStartPoint.Y + c_RectangleHeight));
end;

procedure TmsRectangle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawRect(TRectF.Create(StartPoint.Add(aOrigin),
                                FinishPoint.Add(aOrigin)),
                                0, 0,
                                AllCorners, 1,
                                TCornerType.ctRound);
end;

initialization
 TmsRegisteredPrimitives.Instance.AddPrimitive(TmsRectangle);

end.
