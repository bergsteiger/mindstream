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
 private
  FStartPoint: TPointF;
  function ScrollSpeed: Single;
 protected
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
 public
  class function ButtonShape: ImsShape; override;
  class function IsTool: Boolean; override;
  class function IsForToolbar: Boolean; override;
 protected
  function IsNeedsMouseUp: Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 public
  procedure MouseMove(const aHolder: ImsDiagrammsHolder;
                      const aPoint: TPointF); override;
 end;//TmsTool

implementation

uses
 msCircle,
 msTriangle,
 msPointCircle
 ;

// TmsTool

class function TmsMouseUpShape.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsCircle.Create(), TmsTriangle.Create()]);
end;

procedure TmsMouseUpShape.DoDrawTo(const aCtx: TmsDrawContext);
begin
  inherited;

end;

function TmsMouseUpShape.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 aCtx.rShapesController.RemoveShape(Self);
 Result := True;
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


procedure TmsMouseUpShape.MouseMove(const aHolder: ImsDiagrammsHolder;
                                    const aPoint: TPointF);
var
 l_Delta : TPointF;
begin
 l_Delta := (aPoint - StartPoint) / ScrollSpeed;
 aHolder.Scroll(l_Delta);
end;

function TmsMouseUpShape.pm_GetStartPoint: TPointF;
begin
 Result := FStartPoint;
end;

function TmsMouseUpShape.ScrollSpeed: Single;
begin
 Result := 150;
end;

procedure TmsMouseUpShape.SetStartPoint(const aStartPoint: TPointF);
begin
  inherited;
 FStartPoint := aStartPoint;
end;

end.

