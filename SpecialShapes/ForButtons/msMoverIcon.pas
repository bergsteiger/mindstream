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
 msMoveIcon
 ;

// TmsMoverIcon

class function TmsMoverIcon.ToolIcon: ImsShape;
begin
 Result := TmsMoveIcon.Create;
end;

end.
