unit msRightArrow;

interface

uses
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsRightArrow = class(TmsSpecialArrow)
 public
  class function Create: ImsShape; override;
 end;//TmsRightArrow

implementation

uses
 System.Types
 ;

// TmsRightArrow

class function TmsRightArrow.Create: ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(0, 0), TPointF.Create(InitialLength, 0));
end;

end.
