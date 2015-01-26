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
 msFolderIcon
 ;

// TmsPickerIcon

class function TmsPickerIcon.ToolIcon: ImsShape;
begin
 Result := TmsDownArrow.Create;
end;

end.
