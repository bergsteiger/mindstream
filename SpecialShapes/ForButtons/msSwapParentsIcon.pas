unit msSwapParentsIcon;

interface

uses
 msInterfaces
 ;

type
 TmsSwapParentsIcon = class
 public
  class function Create: ImsShape;
 end;//TmsSwapParentsIcon

implementation

uses
 System.Types,
 msShapesGroup,
 msLeftArrow,
 msLineWithArrow,
 msSmallTriangle
 ;

// TmsSwapParentsIcon

class function TmsSwapParentsIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsLeftArrow.Create, TmsLineWithArrow.CreateCompleted(TPointF.Create(TmsSmallTriangle.InitialHeight, 0), TPointF.Create(TmsLeftArrow.InitialLength, 0))]);
end;

end.
