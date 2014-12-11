unit msDashLine;

interface

uses
 msLine,
 FMX.Graphics,
 msShape,
 msInterfaces
 ;

type
 TmsDashLine = class(TmsLine)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsDashLine

implementation

procedure TmsDashLine.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.sdDash;
end;

end.

