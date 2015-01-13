unit msDownArrow;

interface

uses
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsDownArrow = class(TmsSpecialArrow)
 public
  class function Create: ImsShape;
 end;//TmsDownArrow

implementation

uses
 System.Types
 ;

// TmsDownArrow

class function TmsDownArrow.Create: ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(0, 0), TPointF.Create(0, InitialLength));
end;

end.
