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
const
 cLength = 60;
begin
 Result := TmsShapesGroup.Create([
                                  TmsLineWithArrow.CreateCompleted(TPointF.Create(cLength / 2, 0), TPointF.Create(0, 0)),
                                  TmsLineWithArrow.CreateCompleted(TPointF.Create(cLength / 2, 0), TPointF.Create(cLength, 0))
                                 ]);
end;

end.
