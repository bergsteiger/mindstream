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

function TmsCircle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Red;
end;

function TmsCircle.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := False;
end;

procedure TmsCircle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Start  : TPointF;
 l_Finish : TPointF;
begin
 l_Start := TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY);
 l_Finish := TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY);
 aCtx.rCanvas.DrawEllipse(TRectF.Create(l_Start,
                                   l_Finish),
                     1);
 aCtx.rCanvas.FillEllipse(TRectF.Create(l_Start,
                                   l_Finish),
                     0.5);
end;

initialization
 TmsCircle.Register;

end.

