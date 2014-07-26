unit msDashLine;

interface

uses
 msLine,
 FMX.Graphics
 ;

type
 TmsDashLine = class(TmsLine)
 protected
  function StrokeDash: TStrokeDash; override;
 end;//TmsDashLine

implementation

function TmsDashLine.StrokeDash: TStrokeDash;
begin
 Result := TStrokeDash.Dash;
end;

initialization
 TmsDashLine.Register;

end.
