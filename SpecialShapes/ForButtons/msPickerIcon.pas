unit msPickerIcon;

interface

uses
 msInterfaces
 ;

type
 TmsPickerIcon = class
 public
  class function Create: ImsShape;
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
