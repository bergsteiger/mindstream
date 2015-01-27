unit msFolder;

interface

uses
 msSVGShape
 ;

type
 TmsFolder = class(TmsSVGShape)
 // - "папка"
 protected
  function GetPolygonSVG: String; override;
 end;//TmsFolder

implementation

// TmsFolder

function TmsFolder.GetPolygonSVG: String;
begin
  Result := 'M 40,40, L 100,40, L 100,80, L 40,80, L 40,40' +
  // begin UHO
  'L 40,20' +
  'L 60, 20' +
  'L 60, 40';
end;

end.
