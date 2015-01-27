unit msUpLeftArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow,
 msSpecialDiagonalArrow
 ;

type
 TmsUpLeftArrow = class(TmsSpecialDiagonalArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsUpLeftArrow

implementation

// TmsUpLeftArrow

class function TmsUpLeftArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X + InitialLength, aPointedPoint.Y + InitialLength), TPointF.Create(aPointedPoint.X, aPointedPoint.Y));
end;

end.
