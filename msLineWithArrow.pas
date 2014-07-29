unit msLineWithArrow;

interface

uses
 msLine,
 FMX.Graphics,
 System.Types,
 msSmallTriangle;

type
 TmsLineWithArrow = class(TmsLine)
 protected
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 end;//TmsLineWithArrow

implementation

{ TmsLineWithArrow }

procedure TmsLineWithArrow.DoDrawTo(const aCanvas: TCanvas;
  const aOrigin: TPointF);
begin
  inherited;
  aCanvas.DrawLine(StartPoint.Add(aOrigin),
                   TPointF.Create(0,0), 1);
end;

initialization
 TmsLineWithArrow.Register;

end.
