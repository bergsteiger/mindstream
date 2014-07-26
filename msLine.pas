unit msLine;

interface

uses
 msShape, FMX.Graphics, System.Types;

type
 TmsLine = class(TmsShape)
 protected
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation
{ TLine }

procedure TmsLine.DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawLine(StartPoint.Add(aOrigin),
                  FinishPoint.Add(aOrigin), 1);
end;

class function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := True;
end;

end.
