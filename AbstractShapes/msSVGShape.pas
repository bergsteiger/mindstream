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
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
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
 l_SVG_String: string;
 l_PD: TPathData;
 l_Point: TPointF;
begin
 l_PD := TPathData.Create;
 try
  l_SVG_String := GetPolygonSVG;
  l_PD.Data := l_SVG_String;
  l_Point:= l_PD.FlattenToPolygon(l_PolygonSVG);
  Result := l_PolygonSVG;
 finally
  FreeAndNil(l_PD);
 end;//try..finally
end;

procedure TmsSVGShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_OriginalMatrix: TMatrix;
begin
 l_OriginalMatrix := aCtx.rCanvas.Matrix;
 try
  inherited;
 finally
  aCtx.rCanvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
 end;//try..finally
end;

procedure TmsSVGShape.TransformDrawOptionsContext(
  var theCtx: TmsDrawOptionsContext);
begin
  inherited;
 theCtx.rFillColor := TAlphaColorRec.Azure;
end;

end.
