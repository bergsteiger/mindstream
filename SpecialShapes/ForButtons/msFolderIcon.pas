unit msFolderIcon;

interface

uses
 msInterfaces
 ;

type
 TmsFolderIcon = class
  class function Create: ImsShape;
 end;//TmsFolderIcon

implementation

uses
 msPredefinedShapes
 ;

class function TmsFolderIcon.Create: ImsShape;
begin
 Result := MCmsFolder.AsRef.CreateShape(TPointF.Create(0, 0));
end;

end.
