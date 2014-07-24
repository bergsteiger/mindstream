unit msDotLine;

interface

uses
 msLine,
 FMX.Graphics
 ;

type
 TmsDotLine = class(TmsLine)
 protected
  function StrokeDash: TStrokeDash; override;
 end;//TmsDotLine

implementation

function TmsDotLine.StrokeDash: TStrokeDash;
begin
 Result := TStrokeDash.sdDot;
end;

initialization
 TmsDotLine.Register;

end.
