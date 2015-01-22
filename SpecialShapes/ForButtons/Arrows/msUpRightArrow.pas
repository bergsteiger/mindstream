unit msUpRightArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow,
 msSpecialDiagonalArrow
 ;

type
 TmsUpRightArrow = class(TmsSpecialDiagonalArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsUpRightArrow

implementation

// TmsUpRightArrow

class function TmsUpRightArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X - InitialLength, aPointedPoint.Y + InitialLength), aPointedPoint);
end;

end.
