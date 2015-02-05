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
 protected
  function IsNeedsMouseUp: Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 public
  procedure MouseMove(const aFinishPoint: TPointF); override;
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

function TmsMouseUpShape.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 aCtx.rShapesController.RemoveShape(Self);
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

procedure TmsMouseUpShape.MouseMove(const aFinishPoint: TPointF);
begin
  inherited;
 Assert(false);
end;

end.

