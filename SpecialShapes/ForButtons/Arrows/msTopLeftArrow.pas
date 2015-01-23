unit msTopLeftArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsTopLeftArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsTopLeftArrow

implementation

// TmsTopLeftArrow

class function TmsTopLeftArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X + InitialLength, aPointedPoint.Y + InitialLength), TPointF.Create(aPointedPoint.X, aPointedPoint.Y));
end;

end.
