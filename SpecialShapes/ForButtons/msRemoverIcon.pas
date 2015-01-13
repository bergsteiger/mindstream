unit msRemoverIcon;

interface

uses
 msInterfaces,
 msGreenCircle
 ;

type
 TmsRemoverIcon = class(TmsGreenCircle)
 public
  class function Create: ImsShape;
 end;//TmsRemoverIcon

implementation

uses
 System.Types
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.Create: ImsShape;
begin
 Result := inherited Create(TPointF.Create(0, 0));
end;

end.
