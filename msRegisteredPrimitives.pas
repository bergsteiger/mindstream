unit msRegisteredPrimitives;

interface

uses
 msShape,
 Generics.Collections
 ;

type
 RmsShape = class of TmsShape;

 TmsRegistered = TList<RmsShape>;

 TmsRegisteredPrimitives  = class
 strict private
  f_Registered : TmsRegistered;
  class var FInstance: TmsRegisteredPrimitives;
  constructor Create;
  class destructor Fini;
 public
  class function Instance: TmsRegisteredPrimitives;
  procedure AddPrimitive(const aValue : RmsShape);
  property Primitives: TmsRegistered read f_Registered;
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
 f_Registered := TmsRegistered.Create;
end;

class function TmsRegisteredPrimitives.Instance: TmsRegisteredPrimitives;
begin
 if (FInstance = nil) then
  FInstance := TmsRegisteredPrimitives.Create;
 Result := FInstance;
end;

end.
