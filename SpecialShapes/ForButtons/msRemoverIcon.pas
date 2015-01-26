unit msRemoverIcon;

interface

uses
 msSVGShape,
 msInterfaces,
 msButtonIcon
 ;

type
 TmsRemoverIcon = class(TmsButtonIcon)
 // - "Иконка для удаления фигур"
 public
  class function Create: ImsShape; override;
 end;//TmsFolder

implementation

uses
 System.UITypes,
 msShapesGroup,
 msFolderIcon,
 msRemoveIcon
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsFolderIcon.Create, TmsRemoveIcon.Create]);
end;

end.
