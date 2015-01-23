unit msUpRightArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsUpRightArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsUpRightArrow

implementation

// TmsUpRightArrow

class function TmsUpRightArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X, aPointedPoint.Y + InitialLength), TPointF.Create(aPointedPoint.X + InitialLength, aPointedPoint.Y));
end;

end.
