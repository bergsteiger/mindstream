unit msTriangle1;

interface

uses
 msTriangle,
 System.Math,
 System.UITypes,
 System.Types
// System.Math.Vectors
 ;

type
 TmsTriangle1 = class(TmsTriangle)
 protected
  function Polygon: TPolygon; override;
  function FillColor: TAlphaColor; override;
 end;//TmsTriangle1

implementation

function TmsTriangle1.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Coral;
end;

function TmsTriangle1.Polygon: TPolygon;
begin
 SetLength(Result, 4);
 Result[0] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y - InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[2] := TPointF.Create(StartPoint.X + InitialHeight / 2,
                        StartPoint.Y);
 Result[3] := Result[0];
end;

initialization
 TmsTriangle1.Register;

end.
