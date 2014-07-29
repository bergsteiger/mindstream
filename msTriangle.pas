unit msTriangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsTriangle = class(TmsShape)
 protected
  class function InitialHeight: Single; virtual;
  function FillColor: TAlphaColor; override;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 end;//TmsTriangle

implementation

uses
 System.Math
 ;

function TmsTriangle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Green;
end;

class function TmsTriangle.InitialHeight: Single;
begin
 Result := 100;
end;

procedure TmsTriangle.DoDrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 l_P : TPolygon;
begin
 SetLength(l_P, 4);
 l_P[0] := TPointF.Create(StartPoint.X - round(InitialHeight) div 2,
                        StartPoint.Y + round(InitialHeight) div 2);
 l_P[1] := TPointF.Create(StartPoint.X + round(InitialHeight) div 2,
                        StartPoint.Y + round(InitialHeight) div 2);
 l_P[2] := TPointF.Create(StartPoint.X,
                        StartPoint.Y - round(InitialHeight) div 2);
 l_P[3] := l_P[0];
 aCanvas.DrawPolygon(l_P, 1);
 aCanvas.FillPolygon(l_P, 0.5);
end;

initialization
 TmsTriangle.Register;

end.
