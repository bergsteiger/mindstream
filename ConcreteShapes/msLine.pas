unit msLine;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 SysUtils,
 msInterfaces
 ;

type
 TmsLine = class(TmsShape)
 private
  FFinishPoint: TPointF;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF); override;
  property FinishPoint : TPointF Read FFinishPoint write FFinishPoint;
 public
  function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aCtx: TmsEndShapeContext); override;
  procedure MoveTo(const aFinishPoint: TPointF); override;
 end;//TmsLine

 EmsLineCannotBeMoved = class(Exception)
 end;//EmsLineCannotBeMoved

implementation

uses
 msPointCircle
 ;

constructor TmsLine.CreateInner(const aStartPoint: TPointF);
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
 raise EmsLineCannotBeMoved.Create('Примитив ' + ClassName + ' не может быть перемещён');
end;

procedure TmsLine.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : TmsShape;
begin
 if (StartPoint = FinishPoint) then
 begin
  l_Proxy := TmsPointCircle.CreateInner(StartPoint);
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

end.
