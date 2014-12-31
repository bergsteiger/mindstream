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
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; virtual;
  class function IsTool: Boolean; override;
 end;//TmsTool

implementation

// TmsTool

class function TmsTool.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := nil;
end;

class function TmsTool.IsTool: Boolean;
begin
 Result := true;
end;

end.

