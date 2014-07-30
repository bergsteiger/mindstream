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
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
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

procedure TmsCircle.DoDrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 l_Start  : TPointF;
 l_Finish : TPointF;
begin
 l_Start := TPointF.Create(StartPoint.X - InitialRadiusX, StartPoint.Y - InitialRadiusY);
 l_Finish := TPointF.Create(StartPoint.X + InitialRadiusX, StartPoint.Y + InitialRadiusY);
 aCanvas.DrawEllipse(TRectF.Create(l_Start.Add(aOrigin),
                                   l_Finish.Add(aOrigin)),
                     1);
 aCanvas.FillEllipse(TRectF.Create(l_Start.Add(aOrigin),
                                   l_Finish.Add(aOrigin)),
                     0.5);
end;

initialization
 TmsCircle.Register;

end.
