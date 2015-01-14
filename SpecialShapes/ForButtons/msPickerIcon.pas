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
 msDownArrow
 ;

// TmsPickerIcon

class function TmsPickerIcon.Create: ImsShape;
begin
 Result := TmsDownArrow.Create;
end;

end.
