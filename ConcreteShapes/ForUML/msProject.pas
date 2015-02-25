unit msProject;

interface

uses
 msInterfaces,
 msLibrary
 ;

type
 TmsProject = class(TmsLibrary)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsProject

implementation

uses
 System.UITypes
 ;

procedure TmsProject.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightgreen;
end;

end.
