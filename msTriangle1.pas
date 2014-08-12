unit msTriangle1;

interface

uses
 msShape,
 msTriangle,
 System.Math,
 System.UITypes,
 System.Types
 {$IfDef VER270}
 , 
 System.Math.Vectors
 {$EndIf}
 ;

type
 TmsTriangle1 = class(TmsTriangle)
 protected
  function Polygon: TPolygon; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsTriangle1

implementation

procedure TmsTriangle1.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Coral;
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

end.
