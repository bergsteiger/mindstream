unit msUpArrow;

interface

uses
 msInterfaces,
 msLineWithArrow
 ;

type
 TmsUpArrow = class(TmsLineWithArrow)
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
 Result := TmsLineWithArrow.CreateCompleted(TPointF.Create(0, 50), TPointF.Create(0, 0));
end;

end.
