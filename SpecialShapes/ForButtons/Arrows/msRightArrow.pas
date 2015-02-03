unit msRightArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsRightArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsRightArrow

implementation

// TmsRightArrow

class function TmsRightArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X - InitialLength, aPointedPoint.Y), aPointedPoint);
end;

end.
