unit msDownRightArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow,
 msSpecialDiagonalArrow
 ;

type
 TmsDownRightArrow = class(TmsSpecialDiagonalArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsDownRightArrow

implementation

// TmsDownRightArrow

class function TmsDownRightArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X - InitialLength, aPointedPoint.Y - InitialLength),
                                   TPointF.Create(aPointedPoint.X, aPointedPoint.Y));
end;

end.
