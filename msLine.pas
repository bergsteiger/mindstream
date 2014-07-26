unit msLine;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types
 ;

type
 TmsLine = class(TmsShape)
 protected
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation

uses
 SysUtils,
 msPointCircle
 ;

{ TLine }

procedure TmsLine.DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
var
 l_Proxy : TmsShape;
begin
 if (StartPoint = FinishPoint) then
 begin
  l_Proxy := TmsPointCircle.Create(StartPoint, StartPoint);
  try
   l_Proxy.DrawTo(aCanvas, aOrigin);
  finally
   FreeAndNil(l_Proxy);
  end;//try..finally
 end//StartPoint = FinishPoint
 else
  aCanvas.DrawLine(StartPoint.Add(aOrigin),
                   FinishPoint.Add(aOrigin), 1);
end;

class function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := True;
end;

initialization
 TmsLine.Register;

end.
