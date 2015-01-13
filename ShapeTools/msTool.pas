unit msTool;

interface

uses
 msShape,
 msInterfaces,
 System.Types
 ;

type
 TmsTool = class(TmsShape)
 public
  class function ButtonShape: ImsShape; override;
  class function IsTool: Boolean; override;
 end;//TmsTool

implementation

uses
 msGreenCircle
 ;

// TmsTool

class function TmsTool.ButtonShape: ImsShape;
begin
 Result := TmsGreenCircle.Create(TPointF.Create(0, 0));
end;

class function TmsTool.IsTool: Boolean;
begin
 Result := true;
end;

end.

