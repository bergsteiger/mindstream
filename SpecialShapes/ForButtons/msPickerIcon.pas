unit msPickerIcon;

interface

uses
 msInterfaces,
 msButtonIcon
 ;

type
 TmsPickerIcon = class(TmsButtonIcon)
 public
  class function Create: ImsShape; override;
 end;//TmsPickerIcon

implementation

uses
 msDownArrow,
 msShapesGroup
 ;

// TmsPickerIcon

class function TmsPickerIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsDownArrow.Create]);
end;

end.
