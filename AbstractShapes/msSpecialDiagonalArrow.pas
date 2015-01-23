unit msSpecialDiagonalArrow;

interface

uses
 msSpecialArrow
 ;

type
 TmsSpecialDiagonalArrow = class abstract(TmsSpecialArrow)
 public
  class function InitialLength: Extended; override;
 end;//TmsSpecialDiagonalArrow

implementation

uses
 Math
 ;

// TmsSpecialDiagonalArrow

class function TmsSpecialDiagonalArrow.InitialLength: Extended;
begin
 Result := inherited InitialLength / Sqrt(2);
 // - вспоминаем теорему Пифагора и делим длину на квадратный корень из двух
end;

end.
