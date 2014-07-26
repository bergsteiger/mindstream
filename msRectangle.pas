unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types
 ;

type
 TmsRectangle = class(TmsShape)
 protected
  class function CornerRadius: Single; virtual;
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

class function TmsRectangle.CornerRadius: Single;
begin
 Result := 0;
end;

procedure TmsRectangle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawRect(TRectF.Create(StartPoint.Add(aOrigin),
                                FinishPoint.Add(aOrigin)),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.ctRound);
end;

initialization
 TmsRectangle.Register;

end.
