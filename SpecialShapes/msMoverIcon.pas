unit msMoverIcon;

interface

uses
 msInterfaces,
 System.Types,
 System.Math.Vectors,
 msPolygonShape
 ;

type
 TmsMoverIcon = class(TmsPolygonShape)
  // - класс для реализации полигональных объектов
 private

 protected
  function Polygon: TPolygon; virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
 end;//TmsPolygonShape

implementation

{ TmsMoverIcon }
function TmsMoverIcon.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(0,0,100,100);
end;


function TmsMoverIcon.Polygon: TPolygon;
begin

end;

procedure TmsMoverIcon.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_P : TPolygon;
begin
 l_P := Polygon;
 aCtx.rCanvas.DrawPolygon(l_P, 1);
 aCtx.rCanvas.FillPolygon(l_P, 0.5);
end;

end.
