unit msBlackRectangle;

interface

uses
 System.UITypes,
 msInterfaces,
 msRectangle
 ;

type
 TmsBlackRectangle = class(TmsRectangle)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;

  class function InitialWidth: Single; override;
  class function InitialHeight: Single; override;
 end;//TmsBlackRectangle

implementation

{ TmsBlackRectangle }

class function TmsBlackRectangle.InitialHeight: Single;
begin
 Result := 100;
end;

class function TmsBlackRectangle.InitialWidth: Single;
begin
 Result := 15;
end;

procedure TmsBlackRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
end;

end.
