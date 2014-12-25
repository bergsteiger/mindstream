unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces
 ;

type
 TmsPointContext = record
  fStartPoint, fFinalPoint: TPointF;
 constructor Create(const aStartPoint, aFinalPoint: TPointF);
 end;

 TmsRectangle = class(TmsShape)
 protected
  class function CornerRadius: Single; virtual;
  class function InitialWidth: Single; virtual;
  class function InitialHeight: Single; virtual;

  function GetCoordinateForDraw(aStartPoint: TPointf): TmsPointContext;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 public
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end;

implementation

{ TmsRectangle }
constructor TmsPointContext.Create(const aStartPoint, aFinalPoint: TPointF);
begin
 fStartPoint := aStartPoint;
 fFinalPoint := aFinalPoint;
end;

class function TmsRectangle.InitialWidth: Single;
begin
 Result := 100;
end;

class function TmsRectangle.InitialHeight: Single;
begin
 Result := 90;
end;

function TmsRectangle.ContainsPt(const aPoint: TPointF): Boolean;
var
 l_msPointContext: TmsPointContext;
 l_Rect: TRectF;
begin
 Result := False;
 l_msPointContext := GetCoordinateForDraw(StartPoint);
 l_Rect := TRectF.Create(l_msPointContext.fStartPoint,
                         l_msPointContext.fFinalPoint);
 Result := l_Rect.Contains(aPoint);
end;

class function TmsRectangle.CornerRadius: Single;
begin
 Result := 0;
end;

procedure TmsRectangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_msPointContext: TmsPointContext;
begin
 l_msPointContext := GetCoordinateForDraw(StartPoint);
 aCtx.rCanvas.DrawRect(TRectF.Create(l_msPointContext.fStartPoint,
                                     l_msPointContext.fFinalPoint),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.ctRound);
 aCtx.rCanvas.FillRect(TRectF.Create(l_msPointContext.fStartPoint,
                                     l_msPointContext.fFinalPoint),
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  0.5,
                  TCornerType.ctRound);
end;

function TmsRectangle.GetCoordinateForDraw(aStartPoint: TPointf): TmsPointContext;
var
 l_StartPoint, l_FinalPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(StartPoint.X - InitialWidth / 2,
                               StartPoint.Y - InitialHeight / 2);
 l_FinalPoint := TPointF.Create(StartPoint.X + InitialWidth / 2,
                            StartPoint.Y + InitialHeight / 2);
 Result := TmsPointContext.Create(l_StartPoint, l_FinalPoint);
end;

procedure TmsRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.White;
end;

end.


