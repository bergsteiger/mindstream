unit msSVG_UHO;

interface

uses
 msSVG_Shape,
 System.Types,
 System.Math.Vectors,
 FMX.Graphics,
 System.SysUtils
 ;

type
 TmsSVG_UHO = class(TmsSVG_Shape)
// TmsSVG_Shape = class abstract(TmsShape)
  // - класс для реализации SVG Уха
 protected
  function Polygon: TPolygon; override;
 end;//TmsPolygonShape

implementation

// TmsPolygonShape

function TmsSVG_UHO.Polygon: TPolygon;
const
 с_InitialHeight = 150;
var
 l_PolygonSVG : TPolygon;
 l_SVG_String: string;
 l_PD: TPathData;
 l_Point: TPointF;
begin
 l_PD := TPathData.Create;

 l_SVG_String := 'M 100,0,  L 200,100, L 100,200, L 0,100, L 100,0';

 l_PD.Data := l_SVG_String;
 l_Point:= l_PD.FlattenToPolygon(l_PolygonSVG);
 Result := l_PolygonSVG;

 FreeAndNil(l_PD);
end;

end.
