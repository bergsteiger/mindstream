unit msDependency;

interface

uses
 msInterfaces,
 msConnector
 ;

type
 TmsDependency = class(TmsConnector)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsDependency

implementation

uses
 FMX.Graphics
 ;

procedure TmsDependency.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.Dash;
 theCtx.rStrokeThickness := 2;
end;

end.
