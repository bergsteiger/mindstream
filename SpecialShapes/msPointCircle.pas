unit msPointCircle;

interface

uses
 FMX.Graphics,
 System.Types,
 msShape,
 msCircle,
 System.UITypes,
 msInterfaces
 ;

type
 TmsPointCircle = class(TmsCircle)
 protected
  class function InitialRadiusX: Integer; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 public
  class function IsForToolbar: Boolean; override;
 end;//TmsPointCircle

implementation

{ TmsPointCircle }

class function TmsPointCircle.InitialRadiusX: Integer;
begin
 Result := 10;
end;

procedure TmsPointCircle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Null;
end;

class function TmsPointCircle.IsForToolbar: Boolean;
begin
 Result := false;
end;

end.


