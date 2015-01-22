unit msMoverIcon;

interface

uses
 msInterfaces,
 System.Types,
 System.Math.Vectors,
 msPolygonShape,
 msButtonIcon,
 msFolderToolIcon
 ;

type
 TmsMoverIcon = class(TmsFolderToolIcon)
 public
  class function ToolIcon: ImsShape; override;
 end;//TmsPolygonShape

implementation

uses
 msShapesGroup,
 msFolderIcon,
 msMoveIcon,
 msScalingShape
 ;

// TmsMoverIcon

class function TmsMoverIcon.ToolIcon: ImsShape;
begin
 Result := TmsScalingShape.Create(TmsMoveIcon.Create(TPointF.Create(20, 20)), 0.7);
end;

end.
