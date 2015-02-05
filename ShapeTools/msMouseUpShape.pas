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
  function IsNeedsMouseUp: Boolean; override;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsTool

implementation

uses
 msCircle,
 msTriangle
 ;

// TmsTool

class function TmsMouseUpShape.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsCircle.Create(), TmsTriangle.Create()]); //TmsGreenCircle.Create(TPointF.Create(0, 0));
end;

procedure TmsMouseUpShape.DoDrawTo(const aCtx: TmsDrawContext);
begin
  inherited;

end;

class function TmsMouseUpShape.IsForToolbar: Boolean;
begin
 Result := True;
end;

function TmsMouseUpShape.IsNeedsMouseUp: Boolean;
begin
 Result := True;
end;

class function TmsMouseUpShape.IsTool: Boolean;
begin
 Result := true;
end;

end.

