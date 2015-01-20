unit msFolder;

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
 TmsFolder = class(TmsSVG_Shape)
 // - "папка"
 protected
  function GetPolygonSVG: String; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsFolder

implementation

// TmsSVG_UHO

function TmsFolder.GetPolygonSVG: String;
begin
  Result := 'M 40,40, L 100,40, L 100,80, L 40,80, L 40,40' +
  // begin UHO
  'L 40,20' +
  'L 60, 20' +
  'L 60, 40';
end;

procedure TmsFolder.TransformDrawOptionsContext(
  var theCtx: TmsDrawOptionsContext);
begin
  inherited;
 theCtx.rFillColor := TAlphaColorRec.Azure;
end;

end.
