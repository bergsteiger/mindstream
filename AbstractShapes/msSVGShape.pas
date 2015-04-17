unit msSVGShape;

interface

uses
 msInterfaces,
 msPolygonShape,
 System.Types,
 System.Math.Vectors,
 FMX.Graphics,
 System.SysUtils
 ;

type
 TmsSVGShape = class abstract(TmsPolygonShape)
 // - базовый класс для реализации SVG объектов
 protected
  function GetPolygon: TPolygon; override; final;
 end;//TmsSVGShape

implementation

uses
 System.UITypes
 ;

// TmsSVGShape

function TmsSVGShape.GetPolygon: TPolygon;
var
 l_PolygonSVG : TPolygon;
 l_PD: TPathData;
 l_R : TRectF;
 l_P : TPointF;
 l_P1 : TPointF;
 l_Mid : TPointF;
 l_StartPoint : TPointF;
begin
 l_PD := TPathData.Create;
 try
  Assert(Self.ShapeClass.SVGCode <> '');
  l_PD.Data := Self.ShapeClass.SVGCode;
  l_PD.FlattenToPolygon(l_PolygonSVG, 0.05);
  l_R := PolygonBounds(l_PolygonSVG);

  l_StartPoint := StartPoint;
  l_Mid := (l_R.BottomRight + l_R.TopLeft) / 2;
  Result := nil;
  for l_P in l_PolygonSVG do
  begin
   l_P1 := (l_P - l_Mid) + l_StartPoint;
//   l_P1.X := Round(l_P1.X);
//   l_P1.Y := Round(l_P1.Y);
   Result := Result + [l_P1];
  end;//for l_P in l_PolygonSVG
 finally
  FreeAndNil(l_PD);
 end;//try..finally
end;

end.
