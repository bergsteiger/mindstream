unit msTriangle;

interface

uses
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 System.Math.Vectors,
 msInterfaces,
 msPolygonShape
 ;

type
 TmsTriangle = class(TmsPolygonShape)
 protected
  function GetPolygon: TPolygon; override;
  function TransformFinishPoint(anAngle: Single): TPointF; override;
 end;//TmsTriangle

implementation

uses
 System.Math;

// TmsTriangle

function TmsTriangle.GetPolygon: TPolygon;
begin
 SetLength(Result, 4);
 Result[0] := TPointF.Create(StartPoint.X - ShapeClass.InitialHeight / 2,
                             StartPoint.Y + ShapeClass.InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X + ShapeClass.InitialHeight / 2,
                             StartPoint.Y + ShapeClass.InitialHeight / 2);
 Result[2] := TPointF.Create(StartPoint.X,
                             StartPoint.Y - ShapeClass.InitialHeight / 2);
 Result[3] := Result[0];
end;

function TmsTriangle.TransformFinishPoint(anAngle: Single): TPointF;
begin
 Result := TPointF.Create(StartPoint.X - Self.ShapeClass.InitialHeight * Cos(anAngle),
                          StartPoint.Y - Self.ShapeClass.InitialHeight * Sin(anAngle));
end;

end.
