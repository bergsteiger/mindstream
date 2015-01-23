unit msTopRightArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsTopRightArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsTopRightArrow

implementation

// TmsTopRightArrow

class function TmsTopRightArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X, aPointedPoint.Y + InitialLength), TPointF.Create(aPointedPoint.X + InitialLength, aPointedPoint.Y));
end;

end.
