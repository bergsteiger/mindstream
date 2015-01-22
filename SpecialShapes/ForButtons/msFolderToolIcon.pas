unit msFolderToolIcon;

interface

uses
 System.Types,
 msInterfaces,
 msButtonIcon
 ;

type
 TmsFolderToolIcon = class abstract(TmsButtonIcon)
 protected
  class function ToolIcon: ImsShape; virtual; abstract;
 public
  class function Create: ImsShape; override; final;
 end;//TmsFolderToolIcon

implementation

uses
 msShapesGroup,
 msFolderIcon
 ;

// TmsFolderToolIcon

class function TmsFolderToolIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsFolderIcon.Create, ToolIcon]);
end;

end.
