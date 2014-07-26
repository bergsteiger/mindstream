unit msRegisteredPrimitives;

interface

uses
 msShape, Generics.Collections, msLine, msRectangle, msCircle, msPointCircle;

type
 RmsShape = class of TmsShape;

 TmsRegistered = TList<RmsShape>;

 TmsRegisteredPrimitives  = class
 strict private
  FmsRegistered : TmsRegistered;
  class var FInstance: TmsRegisteredPrimitives;
  constructor Create;
 public
  class function Instance: TmsRegisteredPrimitives;
  procedure AddPrimitive(const aValue : RmsShape);
  property Primitives: TmsRegistered read FmsRegistered;
 end;

implementation

procedure TmsRegisteredPrimitives.AddPrimitive(const aValue: RmsShape);
begin
 FmsRegistered.Add(aValue);
end;

constructor TmsRegisteredPrimitives.Create;
begin
 inherited;
 FmsRegistered := TmsRegistered.Create;
end;

class function TmsRegisteredPrimitives.Instance: TmsRegisteredPrimitives;
begin
 if (FInstance = nil) then
  FInstance := TmsRegisteredPrimitives.Create;
 Result := FInstance;
end;

initialization
 TmsRegisteredPrimitives.Instance.AddPrimitive(TmsLine);
 TmsRegisteredPrimitives.Instance.AddPrimitive(TmsRectangle);
 TmsRegisteredPrimitives.Instance.AddPrimitive(TmsCircle);
end.
