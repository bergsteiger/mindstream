unit msLeftArrow;

interface

uses
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsLeftArrow = class(TmsSpecialArrow)
 public
  class function Create: ImsShape;
 end;//TmsLeftArrow

implementation

uses
 System.Types
 ;

// TmsLeftArrow

class function TmsLeftArrow.Create: ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(InitialLength, 0), TPointF.Create(0, 0));
end;

end.
