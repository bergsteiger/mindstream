unit msMoverIcon;

interface

uses
 msInterfaces,
 System.Types,
 System.Math.Vectors,
 msPolygonShape,
 msButtonIcon
 ;

type
 TmsMoverIcon = class(TmsButtonIcon)
 public
  class function Create: ImsShape; override;
 end;//TmsPolygonShape

implementation

uses
 msShapesGroup,
 msFolderIcon,
 msMoveIcon
 ;

// TmsMoverIcon

class function TmsMoverIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsFolderIcon.Create, TmsMoveIcon.Create]);
end;

end.
