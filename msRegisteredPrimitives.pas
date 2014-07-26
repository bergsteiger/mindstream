unit msRegisteredPrimitives;

interface

uses
 msShape
 ;

type
 TmsRegisteredPrimitives  = class
 strict private
  f_Registered : RmsShapeList;
  class var FInstance: TmsRegisteredPrimitives;
  constructor Create;
  class destructor Fini;
 public
  class function Instance: TmsRegisteredPrimitives;
  procedure AddPrimitive(const aValue : RmsShape);
  property Primitives: RmsShapeList read f_Registered;
  destructor Destroy; override;
 end;

implementation

uses
 SysUtils
 ;

class destructor TmsRegisteredPrimitives.Fini;
begin
 FreeAndNil(FInstance);
end;

destructor TmsRegisteredPrimitives.Destroy;
begin
 FreeAndNil(f_Registered);
 inherited;
end;

procedure TmsRegisteredPrimitives.AddPrimitive(const aValue: RmsShape);
begin
 f_Registered.Add(aValue);
end;

constructor TmsRegisteredPrimitives.Create;
begin
 inherited;
 f_Registered := RmsShapeList.Create;
end;

class function TmsRegisteredPrimitives.Instance: TmsRegisteredPrimitives;
begin
 if (FInstance = nil) then
  FInstance := TmsRegisteredPrimitives.Create;
 Result := FInstance;
end;

end.
