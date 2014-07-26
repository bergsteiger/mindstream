unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types
 ;

type
 TmsRectangle = class(TmsShape)
 protected
  class function CornerRadius: Single; virtual;
  class function InitialWidth: Single; virtual;
  class function InitialHeight: Single; virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
 end;

implementation

uses
 System.UITypes
 ;

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

procedure TmsRectangle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.Fill.Color := TAlphaColorRec.White;
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
