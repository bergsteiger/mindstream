unit msMover;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 System.UITypes
 ;

type
 TmsMover = class(TmsShape)
 private
  f_Moving : TmsShape;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor Create(const aStartPoint: TPointF; aMoving: TmsShape);
 public
  class function Make(const aStartPoint: TPointF; aShapeByPt: TmsShapeByPt): TmsShape; override;
  function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aFinishPoint: TPointF; var NeedRemove: Boolean); override;
 end;//TmsMover

implementation

uses
 msRectangle,
 FMX.Types,
 System.SysUtils;

constructor TmsMover.Create(const aStartPoint: TPointF; aMoving: TmsShape);
begin
 inherited Create(aStartPoint);
 f_Moving := aMoving;
end;

class function TmsMover.Make(const aStartPoint: TPointF; aShapeByPt: TmsShapeByPt): TmsShape;
var
 l_Moving : TmsShape;
begin
 l_Moving := aShapeByPt(aStartPoint);
 if (l_Moving <> nil) then
  Result := Create(aStartPoint, l_Moving)
 else
  Result := nil;
end;

function TmsMover.IsNeedsSecondClick : Boolean;
begin
 Result := true;
end;

procedure TmsMover.EndTo(const aFinishPoint: TPointF; var NeedRemove: Boolean);
begin
 if (f_Moving <> nil) then
  f_Moving.MoveTo(aFinishPoint);
 NeedRemove := true;
 // - теперь надо —≈Ѕя удалить
end;

procedure TmsMover.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Ctx : TmsDrawContext;
begin
 if (f_Moving <> nil) then
 begin
  l_Ctx := aCtx;
  l_Ctx.rMoving := True;
  f_Moving.DrawTo(l_Ctx);
 end;//f_Moving <> nil
end;

initialization
 TmsMover.Register;

end.
