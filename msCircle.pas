unit msCircle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsCircle = class(TmsShape)
 protected
  class function InitialRadius: Integer; virtual;
  function FillColor: TAlphaColor; override;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
 end;

implementation

{ TmsCircle }

class function TmsCircle.InitialRadius: Integer;
begin
 Result := 50;
end;

function TmsCircle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Red;
end;

constructor TmsCircle.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 inherited Create(TPointF.Create(aStartPoint.X - InitialRadius, aStartPoint.Y - InitialRadius),
                  TPointF.Create(aStartPoint.X + InitialRadius, aStartPoint.Y + InitialRadius));
end;

procedure TmsCircle.DoDrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawEllipse(TRectF.Create(StartPoint.Add(aOrigin),
                                   FinishPoint.Add(aOrigin)),
                     1);
 aCanvas.FillEllipse(TRectF.Create(StartPoint.Add(aOrigin),
                                   FinishPoint.Add(aOrigin)),
                     0.5);
end;

initialization
 TmsCircle.Register;

end.
