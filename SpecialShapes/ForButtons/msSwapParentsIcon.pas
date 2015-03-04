unit msSwapParentsIcon;

interface

uses
 msInterfaces,
 msButtonIcon,
 msFolderToolIcon
 ;

type
 TmsSwapParentsIcon = class(TmsFolderToolIcon)
 public
  class function ToolIcon: ImsShape; override;
 end;//TmsSwapParentsIcon

implementation

uses
 System.Types,
 msShapesGroup,
 msLeftArrow,
 msLineWithArrow,
 msFolderIcon
 ;

// TmsSwapParentsIcon

class function TmsSwapParentsIcon.ToolIcon: ImsShape;
const
 cLength = 60;
begin
 Result := TmsShapesGroup.Create([
                                  TmsLineWithArrow.CreateCompleted(TPointF.Create(cLength / 2, 0), TPointF.Create(0, 0), nil),
                                  TmsLineWithArrow.CreateCompleted(TPointF.Create(cLength / 2, 0), TPointF.Create(cLength, 0), nil)
                                 ]);
end;

end.
