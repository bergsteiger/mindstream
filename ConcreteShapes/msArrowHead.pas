unit msArrowHead;

interface

uses
 System.Math.Vectors,
 msPolylineShape,
 msInterfaces;

type
 TmsArrowHead = class(TmsPolylineShape)
 protected
  class function InitialHeight: Pixel; override;
  function GetPolygon: TPolygon; override;
 public
  class function IsForToolbar: Boolean; override;
 end;//TmsTriangle


implementation

uses
 System.Types,
 FMX.Types;

{ TmsArrowHead }

function TmsArrowHead.GetPolygon: TPolygon;
begin
 SetLength(Result, 3);
 Result[0] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X + InitialHeight / 2,
                        StartPoint.Y);
 Result[2] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y - InitialHeight / 2);
 //Result[3] := ClosePolygon;
end;

class function TmsArrowHead.InitialHeight: Pixel;
begin
 Result := 20;
end;

class function TmsArrowHead.IsForToolbar: Boolean;
begin
 Result := True;
end;

end.
