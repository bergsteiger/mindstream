unit msBlackTriangle;

interface

uses
 System.UITypes,
 msInterfaces,
 msTriangle,
 System.Types
 ;

type
 TmsBlackTriangle = class(TmsTriangle)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsBlackTriangle

implementation

{ TmsBlackTriangle }

procedure TmsBlackTriangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
  inherited;
 theCtx.rFillColor := TAlphaColorRec.Black;
end;

end.
