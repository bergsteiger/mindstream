unit msSpecialDiagonalArrow;

interface

uses
 msSpecialArrow
 ;

type
 TmsSpecialDiagonalArrow = class abstract(TmsSpecialArrow)
 public
  class function InitialLength: Extended; override;
  class function ExtentCoeff: Extended;
 end;//TmsSpecialDiagonalArrow

implementation

uses
 Math
 ;

// TmsSpecialDiagonalArrow

class function TmsSpecialDiagonalArrow.ExtentCoeff: Extended;
begin
 Result := Sqrt(2);
end;

class function TmsSpecialDiagonalArrow.InitialLength: Extended;
begin
 Result := inherited InitialLength / ExtentCoeff;
 // - вспоминаем теорему Пифагора и делим длину на квадратный корень из двух
end;

end.
