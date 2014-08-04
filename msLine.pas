unit msLine;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types
 ;

type
 TmsLine = class(TmsShape)
 private
  FFinishPoint: TPointF;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor Create(const aStartPoint: TPointF); override;
  property FinishPoint : TPointF Read FFinishPoint write FFinishPoint;
 public
  function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aCtx: TmsEndShapeContext); override;
  procedure MoveTo(const aFinishPoint: TPointF); override;
 end;

implementation

uses
 SysUtils,
 msPointCircle
 ;

constructor TmsLine.Create(const aStartPoint: TPointF);
begin
 inherited;
 FinishPoint := aStartPoint;
end;

procedure TmsLine.EndTo(const aCtx: TmsEndShapeContext);
begin
 FinishPoint := aCtx.rStartPoint;
end;

procedure TmsLine.MoveTo(const aFinishPoint: TPointF);
begin
 Assert(false, 'Примитив ' + ClassName + ' не может быть перемещён');
end;

procedure TmsLine.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : TmsShape;
begin
 if (StartPoint = FinishPoint) then
 begin
  l_Proxy := TmsPointCircle.Create(StartPoint);
  try
   l_Proxy.DrawTo(aCtx);
  finally
   FreeAndNil(l_Proxy);
  end;//try..finally
 end//StartPoint = FinishPoint
 else
  aCtx.rCanvas.DrawLine(StartPoint,
                   FinishPoint, 1);
end;

function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := true;
end;

initialization
 TmsLine.Register;

end.
