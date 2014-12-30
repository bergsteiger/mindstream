unit msGreenCircle;

interface

uses
 msInterfaces,
 msCircle
 ;

type
  TmsGreenCircle = class(TmsCircle)
  protected
   procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  public
   class function IsForToolbar: Boolean; override;
  end;//TmsGreenCircle

implementation

uses
 System.UITypes
 ;

procedure TmsGreenCircle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Green;
end;

class function TmsGreenCircle.IsForToolbar: Boolean;
begin
 Result := false;
end;

end.
