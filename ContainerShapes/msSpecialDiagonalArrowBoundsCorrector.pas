unit msSpecialDiagonalArrowBoundsCorrector;

interface

uses
 msBoundsCorrector
 ;

type
 TmsSpecialDiagonalArrowBoundsCorrector = class(TmsBoundsCorrector)
 protected
  class function ExtentCoeff: Extended; override;
 end;//TmsSpecialDiagonalArrowBoundsCorrector

implementation

uses
 msSpecialDiagonalArrow
 ;

class function TmsSpecialDiagonalArrowBoundsCorrector.ExtentCoeff: Extended;
begin
// Result := TmsSpecialDiagonalArrow.ExtentCoeff;
 Result := 1.0;
end;

end.
