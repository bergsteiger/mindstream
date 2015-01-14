unit msUpToParentIcon;

interface

uses
 msInterfaces,
 msButtonIcon
 ;

type
 TmsUpToParentIcon = class(TmsButtonIcon)
 public
  class function Create: ImsShape; override;
 end;//TmsUpToParentIcon

implementation

uses
 msUpArrow
 ;

// TmsUpToParentIcon

class function TmsUpToParentIcon.Create: ImsShape;
begin
 Result := TmsUpArrow.Create;
end;

end.
