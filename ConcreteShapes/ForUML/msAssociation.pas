unit msAssociation;

interface

uses
 msInterfaces,
 msConnector
 ;

type
 TmsAssociation = class(TmsConnector)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsAssociation

implementation

uses
 FMX.Graphics
 ;

procedure TmsAssociation.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 //theCtx.rStrokeDash := TStrokeDash.Dash;
end;

end.
