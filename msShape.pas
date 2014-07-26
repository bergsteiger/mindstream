unit msShape;

interface
uses
 FMX.Graphics,
 System.Types,
 FMX.Types;

type
 TmsShape = class
 protected
  FStartPoint, FFinishPoint: TPointF;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); virtual;
  property StartPoint : TPointF read FStartPoint write FStartPoint;
  property FinishPoint : TPointF read FFinishPoint write FFinishPoint;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
  class function IsNeedsSecondClick : Boolean; virtual; abstract;
 end;

implementation

constructor TmsShape.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinishPoint := aFinishPoint;
end;

end.
