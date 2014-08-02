unit msTriangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ,System.Math.Vectors
 ;

type
 TmsTriangle = class(TmsShape)
 protected
  class function InitialHeight: Single; virtual;
  function Polygon: TPolygon; virtual;
  function FillColor: TAlphaColor; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsTriangle

implementation

uses
 System.Math;

function TmsTriangle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Green;
end;

class function TmsTriangle.InitialHeight: Single;
begin
 Result := 100;
end;

function TmsTriangle.Polygon: TPolygon;
begin
 SetLength(Result, 4);
 Result[0] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X + InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[2] := TPointF.Create(StartPoint.X,
                        StartPoint.Y - InitialHeight / 2);
 Result[3] := Result[0];
end;

procedure TmsTriangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

initialization
 TmsTriangle.Register;

end.
