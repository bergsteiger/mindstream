unit msCircle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msPointedShape
 ;

type
 TmsCircle = class(TmsPointedShape)
 protected
  class function InitialRadiusX: Integer; virtual;
  class function InitialRadiusY: Integer; virtual;

  function GetDrawBounds: TRectF; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 public
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end;

implementation

{ TmsCircle }

class function TmsCircle.InitialRadiusX: Integer;
begin
 Result := 50;
end;

class function TmsCircle.InitialRadiusY: Integer;
begin
 Result := InitialRadiusX;
end;

function TmsCircle.ContainsPt(const aPoint: TPointF): Boolean;
var
 l_StartRectPoint, l_FinishRectPoint : TPointF;
 l_x0, l_y0, l_a, l_b : Integer;
 l_Rect : TRectF;
begin
 Result := False;

 l_Rect := DrawBounds;

 l_StartRectPoint := l_Rect.TopLeft;
 l_FinishRectPoint := l_Rect.BottomRight;

 l_x0 := Round(l_StartRectPoint.X + l_FinishRectPoint.X) div 2;
 l_y0 := Round(l_StartRectPoint.Y + l_FinishRectPoint.Y) div 2;
 l_a := Round(l_FinishRectPoint.X - l_StartRectPoint.X) div 2;
 l_b := Round(l_FinishRectPoint.Y - l_StartRectPoint.Y) div 2;

 Result := Sqr((aPoint.X - l_x0)/l_a)+
           Sqr((aPoint.Y - l_y0)/l_b) <= 1.0;
end;

function TmsCircle.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY),
                         TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY));
end;

procedure TmsCircle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Rect : TRectF;
begin
 l_Rect := DrawBounds;

 aCtx.rCanvas.DrawEllipse(l_Rect, 1);
 aCtx.rCanvas.FillEllipse(l_Rect, 0.5);
end;

procedure TmsCircle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Red;
end;

end.

