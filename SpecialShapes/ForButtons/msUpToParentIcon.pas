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
 msUpArrow,
 msFolderIcon,
 msShapesGroup
 ;

// TmsUpToParentIcon

class function TmsUpToParentIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsFolderIcon.Create, TmsUpArrow.Create]);
end;

end.
