unit msRemoverIcon;

interface

uses
 msInterfaces,
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
 System.Types,
 System.UITypes,
 msShapesGroup,
 msFolderIcon,
 msRemoveIcon,
 msScalingShape
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.ToolIcon: ImsShape;
begin
 Result := TmsScalingShape.Create(TmsRemoveIcon.Create(TPointF.Create(20, 30)), 0.5);
end;

end.
