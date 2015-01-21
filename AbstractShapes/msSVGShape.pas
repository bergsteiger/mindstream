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
  function GetPolygonSVG: String; virtual; abstract;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
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
 l_Mid : TPointF;
 l_StartPoint : TPointF;
begin
 l_PD := TPathData.Create;
 try
  l_PD.Data := GetPolygonSVG;
  l_PD.FlattenToPolygon(l_PolygonSVG);
  l_R := PolygonBounds(l_PolygonSVG);

  l_StartPoint := StartPoint;
  Result := nil;
  for l_P in l_PolygonSVG do
  begin
   l_Mid := (l_R.BottomRight + l_R.TopLeft) / 2;
   Result := Result + [(l_P - l_Mid) + l_StartPoint];
  end;//for l_P in l_PolygonSVG
 finally
  FreeAndNil(l_PD);
 end;//try..finally
end;

procedure TmsSVGShape.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Azure;
end;

end.
