unit msPickerIcon;

interface

uses
 msInterfaces,
 msButtonIcon,
 msFolderToolIcon
 ;

type
 TmsPickerIcon = class(TmsFolderToolIcon)
 public
  class function ToolIcon: ImsShape; override;
 end;//TmsPickerIcon

implementation

uses
 msDownArrow,
 msShapesGroup,
 msFolderIcon,
 System.Types
 ;

// TmsPickerIcon

class function TmsPickerIcon.ToolIcon: ImsShape;
begin
 Result := TmsDownArrow.Create(TPointF.Create(0, 20));
end;

end.
