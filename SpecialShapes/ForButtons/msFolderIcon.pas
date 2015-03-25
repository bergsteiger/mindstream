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
 msShape
 ;

class function TmsFolderIcon.Create: ImsShape;
begin
 Result := TmsShape.NamedMC('Folder').CreateShape(TPointF.Create(0, 0));
end;

end.
