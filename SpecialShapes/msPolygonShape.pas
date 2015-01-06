unit msPolygonShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 System.Math.Vectors
 ;

type
 TmsPolygonShape = class abstract(TmsShape)
  // - класс для реализации полигональных объектов
 protected
  function Polygon: TPolygon; virtual; abstract;
//  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
 public
  class function IsForToolbar: Boolean; override;
  class function IsTool: Boolean; override;
 end;//TmsPolygonShape

implementation

{ TmsPolygonShape }
function TmsPolygonShape.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(0,0,100,100);
end;


class function TmsPolygonShape.IsForToolbar: Boolean;
begin
 Result := False;
end;

class function TmsPolygonShape.IsTool: Boolean;
begin
 Result := True;
end;

end.
