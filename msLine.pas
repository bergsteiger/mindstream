unit msLine;

interface

uses
 msShape, FMX.Graphics, System.Types;

type
 TmsLine = class(TmsShape)
 protected
  procedure DrawShape(const aCanvas : TCanvas); override;
  procedure DoLogic; override;
 public
  constructor Create(const aStartPoint, aFinalPoint: TPointF); override;
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation
{ TLine }

constructor TmsLine.Create(const aStartPoint, aFinalPoint: TPointF);
begin
 inherited;
 FNeedsSecondClick := True;
end;

procedure TmsLine.DoLogic;
begin
 inherited;

end;

procedure TmsLine.DrawShape(const aCanvas : TCanvas);
begin
 aCanvas.DrawLine(FStartPoint, FFinalPoint, 1);
end;

class function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := True;
end;

end.
