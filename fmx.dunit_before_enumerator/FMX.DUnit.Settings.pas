unit FMX.DUnit.Settings;

interface
type
 TmsDUnitSettings  = class
 strict private
  f_IsUseDiffer : Boolean;
  class var FInstance: TmsDUnitSettings;
  constructor Create;
  function pm_GetIsUseDiffer : Boolean;
  procedure pm_SetIsUseDiffer(const aValue : Boolean);
 public
  class function Instance: TmsDUnitSettings;
  property IsUseDiffer: Boolean
   read pm_GetIsUseDiffer
   write pm_SetIsUseDiffer;
 end;

implementation

constructor TmsDUnitSettings.Create;
begin
 inherited;
end;

class function TmsDUnitSettings.Instance: TmsDUnitSettings;
begin
 if (FInstance = nil) then
  FInstance := TmsDUnitSettings.Create;
 Result := FInstance;
end;

function TmsDUnitSettings.pm_GetIsUseDiffer: Boolean;
begin
 Result := f_IsUseDiffer;
end;

procedure TmsDUnitSettings.pm_SetIsUseDiffer(const aValue: Boolean);
begin
 f_IsUseDiffer := aValue;
end;

end.
