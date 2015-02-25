unit msGeneralization;

interface

uses
 msInterfaces,
 msConnector
 ;

type
 TmsGeneralization = class(TmsConnector)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsGeneralization

implementation

uses
 FMX.Graphics
 ;

procedure TmsGeneralization.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 //theCtx.rStrokeDash := TStrokeDash.Dash;
end;

end.
