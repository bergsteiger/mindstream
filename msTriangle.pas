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
  function FillColor: TAlphaColor; override;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 end;//TmsTriangle

implementation

uses
 System.Math.Vectors
 ;

function TmsTriangle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Green;
end;

procedure TmsTriangle.DoDrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
const
 cHeight = 100;
var
 l_P : TPolygon;
begin
 SetLength(l_P, 4);
 l_P[0] := TPointF.Create(StartPoint.X - cHeight div 2,
                        StartPoint.Y + cHeight div 2);
 l_P[1] := TPointF.Create(StartPoint.X + cHeight div 2,
                        StartPoint.Y + cHeight div 2);
 l_P[2] := TPointF.Create(StartPoint.X,
                        StartPoint.Y - cHeight div 2);
 l_P[3] := l_P[0];
 aCanvas.DrawPolygon(l_P, 1);
 aCanvas.FillPolygon(l_P, 0.5);
end;

initialization
 TmsTriangle.Register;

end.
