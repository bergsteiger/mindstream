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
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; override;
  class function IsTool: Boolean; override;
 end;//TmsTool

implementation

uses
 msGreenCircle
 ;

// TmsTool

class function TmsTool.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := TmsGreenCircle.Create(aStartPoint);
end;

class function TmsTool.IsTool: Boolean;
begin
 Result := true;
end;

end.

