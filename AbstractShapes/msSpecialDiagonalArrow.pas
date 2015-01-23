unit msSpecialDiagonalArrow;

interface

uses
 msSpecialArrow
 ;

type
 TmsSpecialDiagonalArrow = class abstract(TmsSpecialArrow)
 public
  class function InitialLength: Integer; override;
 end;//TmsSpecialDiagonalArrow

implementation

// TmsSpecialDiagonalArrow

class function TmsSpecialDiagonalArrow.InitialLength: Integer;
begin
 Result := inherited InitialLength;
end;

end.
