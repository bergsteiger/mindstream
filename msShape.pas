unit msShape;

interface
uses
 FMX.Graphics,
 System.Types,
 FMX.Types;

type
 TmsShape = class
 protected
  FStartPoint: TPointF;
  FFinishPoint: TPointF;
  property StartPoint : TPointF read FStartPoint;
  property FinishPoint : TPointF read FFinishPoint;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
  class function IsNeedsSecondClick : Boolean; virtual; abstract;
  procedure EndTo(aFinishPoint: TPointF);
 end;

implementation

constructor TmsShape.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinishPoint := aFinishPoint;
end;

procedure TmsShape.EndTo(aFinishPoint: TPointF);
begin
 FFinishPoint := aFinishPoint;
end;

end.
