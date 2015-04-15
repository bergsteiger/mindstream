unit msPolylineShape;

interface

uses
 msInterfaces,
 msPolygonShape,
 System.Math.Vectors,
 FMX.Graphics;

type
 TmsPolylineShape = class abstract(TmsPolygonShape)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPolylineShape

implementation

uses
 FMX.Types,
 SysUtils;

// TmsPolylineShape

procedure TmsPolylineShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 I: Integer;
 l_Path: TPathData;
 l_P: TPolygon;
begin
 l_P := Polygon;
 l_Path := TPathData.Create;
 try
  for I := 0 to High(l_P) do
   if I = 0
    then l_Path.MoveTo(l_P[I])
    else l_Path.LineTo(l_P[I]);
  aCtx.rCanvas.DrawPath(l_Path, 1);
 finally
  FreeAndNil(l_Path);
 end;
end;

end.
