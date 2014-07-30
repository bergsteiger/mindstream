unit msMover;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 System.UITypes
 ;

type
 TmsMover = class(TmsShape)
 protected
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
  function StrokeDash: TStrokeDash; override;
  function FillColor: TAlphaColor; override;
  function StrokeColor: TAlphaColor; override;
 end;//TmsMover

implementation

uses
 msRectangle,
 FMX.Types;
{ TmsMover }

procedure TmsMover.DoDrawTo(const aCanvas: TCanvas; const aOrigin: TPointF);
var
 l_Finish : TPointF;
begin
 inherited;
 aCanvas.Fill.Color := FillColor;
 aCanvas.Stroke.Thickness := 4;

 l_Finish := TPointF.Create(StartPoint.X + 150,
                            StartPoint.Y + 150);

 aCanvas.DrawRect(TRectF.Create(StartPoint,
                                l_Finish),
                                0,
                                0,
                                AllCorners,
                                0.5,
                                TCornerType.ctRound);

 aCanvas.FillRect(TRectF.Create(StartPoint,
                                l_Finish),
                                0,
                                0,
                                AllCorners,
                                0.5,
                                TCornerType.ctRound);
end;

function TmsMover.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Darkred;
end;

function TmsMover.StrokeColor: TAlphaColor;
begin
 Result := TAlphaColors.Darkmagenta;
end;

function TmsMover.StrokeDash: TStrokeDash;
begin
 Result :=  TStrokeDash.sdDashDot;
end;

initialization
 TmsMover.Register;

end.
