unit msRoundedRectange;

interface

uses
 msRectangle,
 System.Types,
 FMX.Graphics,
 FMX.Types
 ;

type
 TmsRoundedRectangle = class(TmsRectangle)
 protected
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 end;//TmsRoundedRectangle

implementation

procedure TmsRoundedRectangle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawRect(TRectF.Create(StartPoint.Add(aOrigin),
                                FinishPoint.Add(aOrigin)),
                  10, 10,
                  AllCorners, 1,
                  TCornerType.ctRound);
end;

initialization
 TmsRoundedRectangle.Register;

end.
