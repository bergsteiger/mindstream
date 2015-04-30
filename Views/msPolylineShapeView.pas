unit msPolylineShapeView;

interface

uses
 msInterfaces,
 msPolygonShapeView
 ;

type
 TmsPolylineShapeView = class(TmsPolygonShapeView)
  protected
   procedure DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape); override;
 end;//TmsPolylineShapeView

implementation

uses
 System.SysUtils
 ;

// TmsPolylineShapeView

procedure TmsPolylineShapeView.DrawShape(const aCtx: TmsDrawContext; const aShape: ImsShape);
var
 I: Integer;
 l_Path: TPathData;
 l_P: TPolygon;
begin
 l_P := aShape.Polygon;
 l_Path := TPathData.Create;
 try
  for I := 0 to High(l_P) do
  begin
   if (I = 0) then
    l_Path.MoveTo(l_P[I])
   else
    l_Path.LineTo(l_P[I]);
  end;//for I
  aCtx.rCanvas.DrawPath(l_Path, 1);
 finally
  FreeAndNil(l_Path);
 end;//try..finally
end;

end.
