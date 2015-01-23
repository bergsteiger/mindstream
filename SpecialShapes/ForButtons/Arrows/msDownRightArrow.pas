unit msDownRightArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsDownRightArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsDownRightArrow

implementation

// TmsDownArrow

class function TmsDownRightArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X, aPointedPoint.Y), TPointF.Create(aPointedPoint.X + InitialLength, aPointedPoint.Y + InitialLength));
end;

end.
