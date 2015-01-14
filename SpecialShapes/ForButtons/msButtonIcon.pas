unit msButtonIcon;

interface

uses
 msInterfaces
 ;

type
 TmsButtonIcon = class abstract
 public
  class function Create: ImsShape; virtual; abstract;
 end;//TmsButtonIcon

implementation

end.
