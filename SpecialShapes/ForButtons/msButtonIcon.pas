unit msButtonIcon;

interface

uses
 System.Types,
 msInterfaces
 ;

type
 TmsButtonIcon = class abstract
 public
  class function Create: ImsShape;  overload; virtual;
  class function Create(const aCenter: TPointF): ImsShape; overload; virtual; abstract;
 end;//TmsButtonIcon

implementation

// TmsButtonIcon

class function TmsButtonIcon.Create: ImsShape;
begin
 Result := Create(TPointF.Create(0, 0));
end;

end.
