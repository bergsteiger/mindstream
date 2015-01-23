unit msDownLeftArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsDownLeftArrow = class(TmsSpecialArrow)
 public
  class function Create(const aPointedPoint: TPointF): ImsShape; override;
 end;//TmsDownLeftArrow

implementation

// TmsDownLeftArrow

class function TmsDownLeftArrow.Create(const aPointedPoint: TPointF): ImsShape;
begin
 Result := CreateCompletedInternal(TPointF.Create(aPointedPoint.X, aPointedPoint.Y), TPointF.Create(aPointedPoint.X - InitialLength, aPointedPoint.Y + InitialLength));
end;

end.
