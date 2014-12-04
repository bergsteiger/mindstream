unit msDashDotLine;

interface

uses
 msLine,
 FMX.Graphics,
 msShape
 ;

type
 TmsDashDotLine = class(TmsLine)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsDotLine

implementation

procedure TmsDashDotLine.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.sdDashDot;
end;

end.

