unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsRectangle = class(TmsShape)
 protected
  class function CornerRadius: Single; virtual;
  class function InitialWidth: Single; virtual;
  class function InitialHeight: Single; virtual;
  function FillColor: TAlphaColor; override;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
 end;

implementation

{ TmsRectangle }

class function TmsRectangle.InitialWidth: Single;
begin
 Result := 100;
end;

class function TmsRectangle.InitialHeight: Single;
begin
 Result := 150;
end;

constructor TmsRectangle.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 inherited Create(aStartPoint,
                  TPointF.Create(aStartPoint.X + InitialWidth,
                                 aStartPoint.Y + InitialHeight));
end;

class function TmsRectangle.CornerRadius: Single;
begin
 Result := 0;
end;

function TmsRectangle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.White;
end;

procedure TmsRectangle.DoDrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawRect(TRectF.Create(StartPoint.Add(aOrigin),
                                FinishPoint.Add(aOrigin)),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.ctRound);
 aCanvas.FillRect(TRectF.Create(StartPoint.Add(aOrigin),
                                FinishPoint.Add(aOrigin)),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.ctRound);
end;

initialization
 TmsRectangle.Register;

end.
