unit msScrollingTool;

interface

uses
 msShape,
 msInterfaces,
 System.Types,
 msTool,
 msShapesGroup
 ;

type
 TmsScrollingTool = class(TmsTool)
 private
  FStartPoint: TPointF;
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
 end;//TmsScrollingTool

implementation

uses
 msCircle,
 msTriangle,
 msPointCircle,
 msMoveIcon,
 msScalingShape
 ;

// TmsScrollingTool

class function TmsScrollingTool.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsCircle.Create(), TmsMoveIcon.Create]);
end;

procedure TmsScrollingTool.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : ImsShape;
begin
 l_Proxy := TmsScalingShape.Create(TmsMoveIcon.Create(Self.StartPoint), 0.5);
 // - люблю я Self.XXX. Мне лично так понятнее. Да и with - меньше лажает.
 try
  l_Proxy.DrawTo(aCtx);
 finally
  l_Proxy := nil;
 end;///try..fianlly
 //inherited;
 // - а вот тут нам точно ОТ ПРЕДКА ничего рисовать не надо
end;

function TmsScrollingTool.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 aCtx.rShapesController.RemoveShape(Self);
 Result := True;
end;

class function TmsScrollingTool.IsForToolbar: Boolean;
begin
 Result := True;
end;

function TmsScrollingTool.IsNeedsMouseUp: Boolean;
begin
 Result := True;
end;

class function TmsScrollingTool.IsTool: Boolean;
begin
 Result := true;
end;

procedure TmsScrollingTool.MouseMove(const aHolder: ImsDiagrammsHolder;
                                    const aPoint: TPointF);
var
 l_Delta : TPointF;
begin
 l_Delta := (aPoint - Self.StartPoint);
 aHolder.Scroll(l_Delta);
end;

function TmsScrollingTool.pm_GetStartPoint: TPointF;
begin
 Result := FStartPoint;
end;

procedure TmsScrollingTool.SetStartPoint(const aStartPoint: TPointF);
begin
 inherited;
 // - не уверен, что Inherited тут концептуально правилен, но пусть пока будет
 FStartPoint := aStartPoint;
end;

end.

