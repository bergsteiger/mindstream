unit msShape;

interface
uses
 FMX.Graphics,
 System.Types,
 FMX.Types;

type
 TmsShape = class abstract (TObject)
 private
  FStartPoint: TPointF;
  FFinishPoint: TPointF;
 protected
  property StartPoint : TPointF read FStartPoint;
  property FinishPoint : TPointF read FFinishPoint;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
  class function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aFinishPoint: TPointF);
 end;

implementation

constructor TmsShape.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinishPoint := aFinishPoint;
end;

procedure TmsShape.EndTo(const aFinishPoint: TPointF);
begin
 FFinishPoint := aFinishPoint;
end;

class function TmsShape.IsNeedsSecondClick : Boolean;
begin
 Result := false;
end;

end.
