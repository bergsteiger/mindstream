unit msButtonIcon;

interface

uses
 System.Types,
 msInterfaces
 ;

type
 TmsButtonIcon = class abstract
 public
  class function Create: ImsShape; virtual; abstract;
 end;//TmsButtonIcon

implementation

// TmsButtonIcon

end.

