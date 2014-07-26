unit msDashDotLine;

interface

uses
 msLine,
 FMX.Graphics
 ;

type
 TmsDashDotLine = class(TmsLine)
 protected
  function StrokeDash: TStrokeDash; override;
 end;//TmsDotLine

implementation

function TmsDashDotLine.StrokeDash: TStrokeDash;
begin
 Result := TStrokeDash.DashDot;
end;

initialization
 TmsDashDotLine.Register;

end.
