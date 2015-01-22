unit msLine;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 SysUtils,
 msInterfaces,
 msPointedShape
 ;

type
 TmsLine = class(TmsPointedShape)
 private
  FFinishPoint: TPointF;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF); override;
  class function IsLineLike: Boolean; override;
  function GetDrawBounds: TRectF; override;
  function GetFinishPointForDraw: TPointF; virtual;
  property FinishPoint : TPointF Read FFinishPoint write FFinishPoint;
 public
  function IsNeedsSecondClick : Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  procedure MoveTo(const aFinishPoint: TPointF); override;
  class function CreateCompleted(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape;
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

class function TmsLine.IsLineLike: Boolean;
begin
 Result := true;
end;

function TmsLine.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(StartPoint, FinishPoint);
end;

function TmsLine.GetFinishPointForDraw: TPointF;
begin
 Result := FinishPoint;
end;

function TmsLine.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 Result := true;
 FinishPoint := aCtx.rStartPoint;
end;

procedure TmsLine.MoveTo(const aFinishPoint: TPointF);
begin
 raise EmsLineCannotBeMoved.Create('Примитив ' + ClassName + ' не может быть перемещён');
end;

class function TmsLine.CreateCompleted(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape;
begin
 Result := Self.Create(TmsMakeShapeContext.Create(aStartPoint, nil, nil));
 Result.EndTo(TmsEndShapeContext.Create(aFinishPoint, nil, nil));
end;

procedure TmsLine.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : ImsShape;
 l_FinishPoint: TPointF;
begin
 if (StartPoint = FinishPoint) then
 begin
  l_Proxy := TmsPointCircle.Create(StartPoint);
  try
   l_Proxy.DrawTo(aCtx);
  finally
   l_Proxy := nil;
  end;//try..finally
 end//StartPoint = FinishPoint
 else
 begin
  l_FinishPoint := GetFinishPointForDraw;
  aCtx.rCanvas.DrawLine(StartPoint,l_FinishPoint, 1);
 end;//StartPoint = FinishPoint
end;

function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := true;
end;

end.
