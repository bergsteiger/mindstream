unit msTool;

interface

uses
 msShape,
 msInterfaces,
 System.Types,
 msPointlessShape
 ;

type
 TmsTool = class(TmsPointlessShape)
 public
  class function ButtonShape: ImsShape; override;
  class function IsTool: Boolean; override;
 end;//TmsTool

implementation

// TmsTool

class function TmsTool.ButtonShape: ImsShape;
begin
 Result := TmsShape.NamedMC('GreenCircle').Creator.CreateShape(TPointF.Create(0, 0));
end;

class function TmsTool.IsTool: Boolean;
begin
 Result := true;
end;

end.

