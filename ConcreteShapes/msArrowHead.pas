unit msArrowHead;

interface

uses
 System.Math.Vectors,
 msPolylineShape,
 msInterfaces;

type
 TmsArrowHead = class(TmsPolylineShape)
 protected
  class function InitialHeight: Single; override;
  function GetPolygon: TPolygon; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
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

class function TmsArrowHead.InitialHeight: Single;
begin
 Result := 20;
end;

class function TmsArrowHead.IsForToolbar: Boolean;
begin
 Result := True;
end;

procedure TmsArrowHead.TransformDrawOptionsContext(
  var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeThickness := 1.5;
end;

end.
