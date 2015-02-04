unit msMouseUpShape;

interface

uses
 msShape,
 msInterfaces,
 System.Types,
 msTool,
 msShapesGroup
 ;

type
 TmsMouseUpShape = class(TmsTool)
 public
  class function ButtonShape: ImsShape; override;
  class function IsTool: Boolean; override;
  class function IsForToolbar: Boolean; override;
 end;//TmsTool

implementation

uses
 msCircle,
 msSmallTriangle
 ;

// TmsTool

class function TmsMouseUpShape.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsCircle.Create(), TmsSmallTriangle.Create()]); //TmsGreenCircle.Create(TPointF.Create(0, 0));
end;

class function TmsMouseUpShape.IsForToolbar: Boolean;
begin
 Result := True;
end;

class function TmsMouseUpShape.IsTool: Boolean;
begin
 Result := true;
end;

end.

