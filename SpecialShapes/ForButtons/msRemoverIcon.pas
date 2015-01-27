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
 msRemoveIcon,
 msScalingShape
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.ToolIcon: ImsShape;
begin
 Result := TmsScalingShape.Create(TmsRemoveIcon.Create, {1.3}{0.7}0.5);
end;

end.
