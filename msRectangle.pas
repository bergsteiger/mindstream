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
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;

implementation

{ TmsRectangle }

class function TmsRectangle.InitialWidth: Single;
begin
 Result := 100;
end;

class function TmsRectangle.InitialHeight: Single;
begin
 Result := 90;
end;

class function TmsRectangle.CornerRadius: Single;
begin
 Result := 0;
end;

function TmsRectangle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.White;
end;

procedure TmsRectangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Finish : TPointF;
begin
 l_Finish := TPointF.Create(StartPoint.X + InitialWidth,
                            StartPoint.Y + InitialHeight);
 aCtx.rCanvas.DrawRect(TRectF.Create(StartPoint,
                                l_Finish),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.ctRound);
 aCtx.rCanvas.FillRect(TRectF.Create(StartPoint,
                                l_Finish),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  0.5,
                  TCornerType.ctRound);
end;

initialization
 TmsRectangle.Register;

end.
