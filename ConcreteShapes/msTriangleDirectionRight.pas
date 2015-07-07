unit msTriangleDirectionRight;

interface

uses
 msShape,
 msTriangle,
 System.Math,
 System.UITypes,
 System.Types
 {$IF DEFined(VER270) OR DEFined(VER280)}
 ,
 System.Math.Vectors
 {$ENDIF}
 ,
 msInterfaces
 ;

type
 TmsTriangleDirectionRight = class(TmsTriangle)
 protected
  function GetPolygon: TPolygon; override;
 end;//TmsTriangle1

implementation

// TmsTriangleDirectionRight

function TmsTriangleDirectionRight.GetPolygon: TPolygon;
begin
 SetLength(Result, 4);
 Result[0] := TPointF.Create(StartPoint.X - ShapeClass.InitialHeight / 2,
                        StartPoint.Y - ShapeClass.InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X - ShapeClass.InitialHeight / 2,
                        StartPoint.Y + ShapeClass.InitialHeight / 2);
 Result[2] := TPointF.Create(StartPoint.X + ShapeClass.InitialHeight / 2,
                        StartPoint.Y);
 Result[3] := Result[0];
end;

end.

