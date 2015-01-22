unit msDownArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsDownArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsDownArrow

implementation

// TmsDownArrow

class function TmsDownArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X, aPointedPoint.Y), TPointF.Create(aPointedPoint.X, aPointedPoint.Y + InitialLength));
end;

end.
