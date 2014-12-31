unit msBlackTriangle;

interface

uses
 System.UITypes,
 msInterfaces,
 msTriangle
 ;

type
 TmsBlackTriangle = class(TmsTriangle)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  public
   class function IsForToolbar: Boolean; override;
 end;//TmsBlackTriangle

implementation

{ TmsBlackTriangle }

procedure TmsBlackTriangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
  inherited;
 theCtx.rFillColor := TAlphaColorRec.Black;
end;

class function TmsBlackTriangle.IsForToolbar: Boolean;
begin
 Result := false;
end;

end.
