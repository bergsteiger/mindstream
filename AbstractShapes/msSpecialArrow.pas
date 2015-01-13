unit msSpecialArrow;

interface

uses
 msLineWithArrow
 ;

type
 TmsSpecialArrow = class abstract(TmsLineWithArrow)
 protected
  class function InitialLength: Integer;
 end;//TmsSpecialArrow

implementation

// TmsSpecialArrow

class function TmsSpecialArrow.InitialLength: Integer;
begin
 Result := 50;
end;

end.
