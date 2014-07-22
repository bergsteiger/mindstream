unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types;

type
 TmsRectangle = class(TmsShape)
 protected
  procedure DrawShape(const aCanvas : TCanvas); override;
  procedure DoLogic; override;
 public
  constructor Create(const aStartPoint, aFinalPoint: TPointF); override;
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation

const
 c_RectangleHeight = 150;
 c_RectangleWidth = 100;

{ TmsRectangle }

constructor TmsRectangle.Create(const aStartPoint, aFinalPoint: TPointF);
begin
 inherited;
 FNeedsSecondClick := False;
 FFinalPoint:= TPointF.Create(FStartPoint.X+c_RectangleWidth,
                              FStartPoint.Y + c_RectangleHeight);
end;

procedure TmsRectangle.DoLogic;
begin
  inherited;

end;

procedure TmsRectangle.DrawShape(const aCanvas: TCanvas);
begin
 aCanvas.DrawRect(TRectF.Create(FStartPoint, FFinalPoint),
                                0, 0,
                                AllCorners, 1,
                                TCornerType.ctRound);
end;

class function TmsRectangle.IsNeedsSecondClick: Boolean;
begin
 Result := False;
end;

end.
