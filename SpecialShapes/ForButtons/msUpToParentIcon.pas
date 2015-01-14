unit msUpToParentIcon;

interface

uses
 msInterfaces
 ;

type
 TmsUpToParentIcon = class
 public
  class function Create: ImsShape;
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
