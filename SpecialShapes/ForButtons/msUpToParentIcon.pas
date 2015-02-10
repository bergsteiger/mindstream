unit msUpToParentIcon;

interface

uses
 msInterfaces,
 msButtonIcon,
 msFolderToolIcon
 ;

type
 TmsUpToParentIcon = class(TmsFolderToolIcon)
 public
  class function ToolIcon: ImsShape; override;
 end;//TmsUpToParentIcon

implementation

uses
 msUpArrow,
 msFolderIcon,
 msShapesGroup,
 System.Types
 ;

// TmsUpToParentIcon

class function TmsUpToParentIcon.ToolIcon: ImsShape;
begin
 Result := TmsUpArrow.Create(TPointF.Create(0, -30));
end;

end.
