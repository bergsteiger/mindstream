unit msAssociation;

interface

uses
 msInterfaces,
 msDependency
 ;

type
 TmsAssociation = class(TmsDependency)
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
 theCtx.rStrokeDash := TStrokeDash.Solid;
end;

end.
