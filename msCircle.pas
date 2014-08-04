unit msCircle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsCircle = class(TmsShape)
 protected
  class function InitialRadiusX: Integer; virtual;
  class function InitialRadiusY: Integer; virtual;

  function DrawOptionsContext: TmsDrawOptionsContext; override;
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
begin
 Result := False;

 l_StartRectPoint := TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY);
 l_FinishRectPoint := TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY);

 l_x0 := Round(l_StartRectPoint.X + l_FinishRectPoint.X) div 2;
 l_y0 := Round(l_StartRectPoint.Y + l_FinishRectPoint.Y) div 2;
 l_a := Round(l_FinishRectPoint.X - l_StartRectPoint.X) div 2;
 l_b := Round(l_FinishRectPoint.Y - l_StartRectPoint.Y) div 2;

 Result := Sqr((aPoint.X - l_x0)/l_a)+
           Sqr((aPoint.Y - l_y0)/l_b) <= 1.0;
end;

procedure TmsCircle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_StartRectPoint, l_FinishRectPoint : TPointF;
begin
 l_StartRectPoint := TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY);
 l_FinishRectPoint := TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY);

 aCtx.rCanvas.DrawEllipse(TRectF.Create(l_StartRectPoint, l_FinishRectPoint), 1);
 aCtx.rCanvas.FillEllipse(TRectF.Create(l_StartRectPoint, l_FinishRectPoint), 0.5);
end;

function TmsCircle.DrawOptionsContext: TmsDrawOptionsContext;
begin
 Result.FillColor := TAlphaColorRec.Red;
end;

initialization
 TmsCircle.Register;

end.

