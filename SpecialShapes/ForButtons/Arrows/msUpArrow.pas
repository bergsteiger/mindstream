unit msUpArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsUpArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsUpArrow

implementation

// TmsUpArrow

class function TmsUpArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X, aPointedPoint.Y + InitialLength),
                                   TPointF.Create(aPointedPoint.X, aPointedPoint.Y));
end;

end.
