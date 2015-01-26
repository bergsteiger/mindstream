unit msRemoverIcon;

interface

uses
 msSVGShape,
 msInterfaces,
 msButtonIcon,
 msFolderToolIcon
 ;

type
 TmsRemoverIcon = class(TmsFolderToolIcon)
 // - "Иконка для удаления фигур"
 protected
  class function ToolIcon: ImsShape; override;
 end;//TmsFolder

implementation

uses
 System.UITypes,
 msShapesGroup,
 msFolderIcon,
 msRemoveIcon
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.ToolIcon: ImsShape;
begin
 Result := TmsRemoveIcon.Create;
end;

end.
