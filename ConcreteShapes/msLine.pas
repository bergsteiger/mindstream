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
  function ContainsPt(const aPoint: TPointF): Boolean; override;
  class function SamePoint(const A: TPointF; const B: TPointF): Boolean;
  property FinishPoint : TPointF Read FFinishPoint write FFinishPoint;
 public
  function IsNeedsSecondClick : Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  procedure MoveTo(const aStartPoint: TPointF; const aFinishPoint: TPointF); override;
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

class function TmsLine.SamePoint(const A: TPointF; const B: TPointF): Boolean;
const
 cEpsilon = 5;
begin
 Result := (Abs(A.X - B.X) <= cEpsilon) AND (Abs(A.Y - B.Y) <= cEpsilon);
end;

function TmsLine.ContainsPt(const aPoint: TPointF): Boolean;
// https://bitbucket.org/ingword/mindstream/issue/3/tmsline-tmsmover
(*
http://algolist.manual.ru/maths/geom/datastruct.php

enum {LEFT,  RIGHT,  BEYOND,  BEHIND, BETWEEN, ORIGIN, DESTINATION};
//    ÑËÅÂÀ, ÑÏÐÀÂÀ, ÂÏÅÐÅÄÈ, ÏÎÇÀÄÈ, ÌÅÆÄÓ,   ÍÀ×ÀËÎ, ÊÎÍÅÖ

int Point::classify(Point &p0, Point &pl)
{
  Point p2 = *this;
  Point a = p1 - pO;
  Point b = p2 - pO;
  double sa = a. x * b.y - b.x * a.y;
  if (sa > 0.0)
    return LEFT;
  if (sa < 0.0)
    return RIGHT;
  if ((a.x * b.x < 0.0) || (a.y * b.y < 0.0))
    return BEHIND;
  if (a.length() < b.length())
    return BEYOND;
  if (pO == p2)
    return ORIGIN;
  if (p1 == p2)
    return DESTINATION;
  return BETWEEN;
}
*)
begin
 //Result := inherited;
 Result := SamePoint(Self.StartPoint, aPoint) OR SamePoint(Self.FinishPoint, aPoint);
end;

function TmsLine.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 Result := true;
 FinishPoint := aCtx.rStartPoint;
end;

procedure TmsLine.MoveTo(const aStartPoint: TPointF; const aFinishPoint: TPointF);
begin
 if SamePoint(Self.StartPoint, aStartPoint) then
  Self.SetStartPoint(aFinishPoint)
 else
 if SamePoint(Self.FinishPoint, aStartPoint) then
  Self.FinishPoint := aFinishPoint
 else
  raise EmsLineCannotBeMoved.Create('Ïðèìèòèâ ' + ClassName + ' íå ìîæåò áûòü ïåðåìåù¸í');
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
  aCtx.rCanvas.DrawLine(StartPoint, l_FinishPoint, 1);
 end;//StartPoint = FinishPoint
end;

function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := true;
end;

end.
