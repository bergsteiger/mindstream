unit msRegisteredPrimitives;

interface
type
 TmsRegisteredPrimitives  = class
 strict private
  class var FInstance: TmsRegisteredPrimitives;
  constructor Create;
 public
  class function GetInstance: TmsRegisteredPrimitives;
 end;



implementation

 constructor TmsRegisteredPrimitives.Create;
 begin
  inherited;
 end;

 class function TmsRegisteredPrimitives.GetInstance: TmsRegisteredPrimitives;
 begin
  If FInstance = nil Then
  begin
   FInstance := TmsRegisteredPrimitives.Create();
  end;
  Result := FInstance;
 end;

end.
