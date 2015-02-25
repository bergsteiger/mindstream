unit msSubsystem;

interface

uses
 msInterfaces,
 msLibrary
 ;

type
 TmsSubsystem = class(TmsLibrary)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsSubsystem

implementation

uses
 System.UITypes
 ;

procedure TmsSubsystem.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightblue;
end;

end.
