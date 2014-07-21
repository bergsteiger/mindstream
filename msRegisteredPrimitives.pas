unit msRegisteredPrimitives;

interface

uses
 msShape, Generics.Collections;

type
 RmsShape = class of TmsShape;

 TmsRegistered = TList<RmsShape>;

 TmsRegisteredPrimitives  = class
 strict private
  FmsRegistered : TmsRegistered;
  class var FInstance: TmsRegisteredPrimitives;
  constructor Create;
 public
  class function GetInstance: TmsRegisteredPrimitives;
  procedure AddPrimitive(const Value : RmsShape);
 end;


implementation

procedure TmsRegisteredPrimitives.AddPrimitive(const Value: RmsShape);
begin
 FmsRegistered.Add(Value);
end;

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
