unit msDownArrow;

interface

uses
 msInterfaces,
 msLineWithArrow
 ;

type
 TmsDownArrow = class(TmsLineWithArrow)
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
 Result := TmsLineWithArrow.CreateCompleted(TPointF.Create(0, 0), TPointF.Create(0, 50));
end;

end.
