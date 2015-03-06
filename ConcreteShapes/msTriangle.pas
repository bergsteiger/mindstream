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
  class function InitialHeight: Single; override;
  function GetPolygon: TPolygon; override;
 public
  class function IsForToolbar: Boolean; override;
 end;//TmsTriangle

implementation

uses
 System.Math;

class function TmsTriangle.InitialHeight: Single;
begin
 Result := 100;
end;

class function TmsTriangle.IsForToolbar: Boolean;
begin
 Result := True;
end;

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

end.
