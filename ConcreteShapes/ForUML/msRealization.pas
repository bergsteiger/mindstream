unit msRealization;

interface

uses
 msInterfaces,
 msConnector
 ;

type
 TmsRealization = class(TmsConnector)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsRealization

implementation

uses
 FMX.Graphics
 ;

procedure TmsRealization.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.Dash;
end;

end.
