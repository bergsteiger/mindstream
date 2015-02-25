unit msMixIn;

interface

uses
 msInterfaces,
 msClass
 ;

type
 TmsMixIn = class(TmsClass)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsMixIn

implementation

uses
 System.UITypes
 ;

procedure TmsMixIn.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightgreen;
end;

end.
