unit msDotLine;

interface

uses
 msLine,
 FMX.Graphics,
 msShape
 ;

type
 TmsDotLine = class(TmsLine)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsDotLine

implementation

procedure TmsDotLine.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.sdDot;
end;

initialization
 TmsDotLine.Register;

end.
