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

  function FillColor: TAlphaColor; override;
  function ContainsPt(const aPoint: TPointF): Boolean; override;

  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
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

function TmsCircle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Red;
end;

function TmsCircle.ContainsPt(const aPoint: TPointF): Boolean;
var
 f_StartRectPoint, f_FinishRectPoint : TPointF;
 l_x0, l_y0, l_a, l_b : Integer;
begin
 Result := False;

 f_StartRectPoint := TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY);
 f_FinishRectPoint := TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY);

 l_x0 := Round(f_StartRectPoint.X + f_FinishRectPoint.X) div 2;
 l_y0 := Round(f_StartRectPoint.Y + f_FinishRectPoint.Y) div 2;
 l_a := Round(f_FinishRectPoint.X - f_StartRectPoint.X) div 2;
 l_b := Round(f_FinishRectPoint.Y - f_StartRectPoint.Y) div 2;

 Result := Sqr((aPoint.X - l_x0)/l_a)+
           Sqr((aPoint.Y - l_y0)/l_b) <= 1.0;
end;

procedure TmsCircle.DoDrawTo(const aCtx: TmsDrawContext);
var
 f_StartRectPoint, f_FinishRectPoint : TPointF;
begin
 f_StartRectPoint := TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY);
 f_FinishRectPoint := TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY);

 aCtx.rCanvas.DrawEllipse(TRectF.Create(f_StartRectPoint, f_FinishRectPoint), 1);
 aCtx.rCanvas.FillEllipse(TRectF.Create(f_StartRectPoint, f_FinishRectPoint), 0.5);
end;

initialization
 TmsCircle.Register;

end.

