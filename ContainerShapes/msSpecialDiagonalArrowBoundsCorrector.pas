unit msSpecialDiagonalArrowBoundsCorrector;

interface

uses
 msBoundsCorrector
 ;

type
 TmsSpecialDiagonalArrowBoundsCorrector = class(TmsBoundsCorrector)
 protected
  function ExtentCoeff: Extended; override;
 end;//TmsSpecialDiagonalArrowBoundsCorrector

implementation

uses
 msSpecialDiagonalArrow
 ;

// TmsSpecialDiagonalArrowBoundsCorrector

function TmsSpecialDiagonalArrowBoundsCorrector.ExtentCoeff: Extended;
begin
 Result := TmsSpecialDiagonalArrow.ExtentCoeff;
// Result := 1.0;
end;

end.
