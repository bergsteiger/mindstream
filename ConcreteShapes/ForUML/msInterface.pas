unit msInterface;

interface

uses
 msInterfaces,
 msClass
 ;

type
 TmsInterface = class(TmsClass)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsInterface

implementation

uses
 System.UITypes
 ;

procedure TmsInterface.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightblue;
end;

end.
