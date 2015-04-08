unit msArrowHead;

interface

uses
 System.Math.Vectors,
 msPolylineShape,
 msInterfaces;

type
 TmsArrowHead = class(TmsPolylineShape)
 protected
  function GetPolygon: TPolygon; override;
 end;//TmsTriangle


implementation

uses
 System.Types,
 FMX.Types;

// TmsArrowHead

function TmsArrowHead.GetPolygon: TPolygon;
begin
 SetLength(Result, 3);
 Result[0] := TPointF.Create(StartPoint.X - ShapeClass.InitialHeight / 2,
                        StartPoint.Y + ShapeClass.InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X + ShapeClass.InitialHeight / 2,
                        StartPoint.Y);
 Result[2] := TPointF.Create(StartPoint.X - ShapeClass.InitialHeight / 2,
                        StartPoint.Y - ShapeClass.InitialHeight / 2);
 //Result[3] := ClosePolygon;
end;

end.
