unit msUpArrow;

interface

uses
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsUpArrow = class(TmsSpecialArrow)
 public
  class function Create: ImsShape;
 end;//TmsUpArrow

implementation

uses
 System.Types
 ;

// TmsUpArrow

class function TmsUpArrow.Create: ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(0, InitialLength), TPointF.Create(0, 0));
end;

end.
