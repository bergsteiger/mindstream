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
  procedure DrawShape(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  property StartPoint : TPointF read FStartPoint write FStartPoint;
  property FinishPoint : TPointF read FFinishPoint write FFinishPoint;
  class function IsNeedsSecondClick : Boolean; virtual; abstract;
 end;

implementation

constructor TmsShape.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinishPoint := aFinishPoint;
end;

procedure TmsShape.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 DrawShape(aCanvas, aOrigin);
end;



end.
