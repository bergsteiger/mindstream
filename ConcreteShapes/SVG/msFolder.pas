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
  Result := 'M 0,20, L 100,20, L 100,90, L 0,90, L 0,20' +
  // begin UHO
  'L 0, 0' +
  'L 40, 0' +
  'L 40, 20';
end;

end.
