unit msConnector;

interface

uses
 System.Types,
 msInterfaces,
 msLine,
 Data.DBXJSONReflect
 ;

type
 TmsConnector = class(TmsLine)
 strict private
  [JSONMarshalled(False)]
  f_LeftShape : ImsShape;
 protected
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; override;
 end;//TmsConnector

implementation

// TmsConnector

procedure TmsConnector.SetStartPoint(const aStartPoint: TPointF);
begin
 inherited;
end;

function TmsConnector.pm_GetStartPoint: TPointF;
begin
 Result := inherited;
end;

function TmsConnector.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
begin
 Result := inherited;
end;

end.
