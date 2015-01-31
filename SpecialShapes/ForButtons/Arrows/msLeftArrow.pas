unit msLeftArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsLeftArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsLeftArrow

implementation

// TmsLeftArrow

class function TmsLeftArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X + InitialLength, aPointedPoint.Y), TPointF.Create(aPointedPoint.X, aPointedPoint.Y));
end;

end.
