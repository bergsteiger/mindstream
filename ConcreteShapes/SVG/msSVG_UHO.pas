unit msSVG_UHO;

interface

uses
 msSVG_Shape,
 System.Types,
 System.Math.Vectors,
 FMX.Graphics,
 System.SysUtils,
 msInterfaces,
 System.UITypes
 ;

type
 TmsSVG_UHO = class(TmsSVG_Shape)
// TmsSVG_Shape = class abstract(TmsShape)
  // - класс для реализации SVG Уха
 protected
  function Polygon: TPolygon; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsPolygonShape

implementation

// TmsPolygonShape

function TmsSVG_UHO.Polygon: TPolygon;
var
 l_PolygonSVG : TPolygon;
 l_SVG_String: string;
 l_PD: TPathData;
 l_Point: TPointF;
begin
 l_PD := TPathData.Create;
 try
  l_SVG_String := 'M 40,40, L 100,40, L 100,80, L 40,80, L 40,40' +
  // begin UHO
  'L 40,20' +
  'L 60, 20' +
  'L 60, 40';

  l_PD.Data := l_SVG_String;
  l_Point:= l_PD.FlattenToPolygon(l_PolygonSVG);
  Result := l_PolygonSVG;
 finally
  FreeAndNil(l_PD);
 end;//try..finally
end;

procedure TmsSVG_UHO.TransformDrawOptionsContext(
  var theCtx: TmsDrawOptionsContext);
begin
  inherited;
 theCtx.rFillColor := TAlphaColorRec.Azure;
end;

end.
