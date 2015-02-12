unit msMovingPointer;

interface

uses
 System.Types,
 msInterfaces
 ;

type
 TmsMovingPointer = class
 public
  class function Create(const aPoint: TPointF): ImsShape; reintroduce;
 end;//TmsMovingPointer

implementation

uses
 msScalingShape,
 msMoveIcon
 ;

// TmsMovingPointer

class function TmsMovingPointer.Create(const aPoint: TPointF): ImsShape;
begin
 Result := TmsScalingShape.Create(TmsMoveIcon.Create(aPoint), 0.5);
end;

end.
