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
 TmsRectangle = class(TmsShape)
 protected
  class function CornerRadius: Single; virtual;
  class function InitialWidth: Single; virtual;
  class function InitialHeight: Single; virtual;

  function GetCoordinateForDraw: TRectF;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 public
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end;//TmsRectangle

implementation

{ TmsRectangle }

class function TmsRectangle.InitialWidth: Single;
begin
 Result := 100;
end;

class function TmsRectangle.InitialHeight: Single;
begin
 Result := 90;
end;

function TmsRectangle.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := GetCoordinateForDraw.Contains(aPoint);
end;

class function TmsRectangle.CornerRadius: Single;
begin
 Result := 0;
end;

procedure TmsRectangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_msPointContext: TRectF;
begin
 l_msPointContext := GetCoordinateForDraw;
 aCtx.rCanvas.DrawRect(l_msPointContext,
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.ctRound);
 aCtx.rCanvas.FillRect(l_msPointContext,
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  0.5,
                  TCornerType.ctRound);
end;

function TmsRectangle.GetCoordinateForDraw: TRectF;
var
 l_StartPoint, l_FinalPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(StartPoint.X - InitialWidth / 2,
                               StartPoint.Y - InitialHeight / 2);
 l_FinalPoint := TPointF.Create(StartPoint.X + InitialWidth / 2,
                            StartPoint.Y + InitialHeight / 2);
 Result := TRectF.Create(l_StartPoint, l_FinalPoint);
end;

procedure TmsRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.White;
end;

end.


