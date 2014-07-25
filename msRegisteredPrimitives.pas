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
  function GetPrimitivesCount: integer;
  function GetPrimitive(Index: Integer): RmsShape;
  procedure SetPrimitive(Index: Integer; const aValue: RmsShape);
 public
  class function GetInstance: TmsRegisteredPrimitives;
  procedure AddPrimitive(const aValue : RmsShape);
  procedure InsertPrimitive(Index: Integer; const aValue: RmsShape);
  procedure DeletePrimitive(Index: Integer);
  procedure ClearPrimitives;
  property PrimitivesCount: Integer read GetPrimitivesCount;
  property Primitives[Index: Integer]: RmsShape read GetPrimitive write SetPrimitive;
 end;

implementation

procedure TmsRegisteredPrimitives.AddPrimitive(const aValue: RmsShape);
begin
 FmsRegistered.Add(aValue);
end;

procedure TmsRegisteredPrimitives.ClearPrimitives;
begin
 FmsRegistered.Clear;
end;

constructor TmsRegisteredPrimitives.Create;
begin
 inherited;
 FmsRegistered := TmsRegistered.Create();
end;

procedure TmsRegisteredPrimitives.DeletePrimitive(Index: Integer);
begin
 FmsRegistered.Delete(Index);
end;

class function TmsRegisteredPrimitives.GetInstance: TmsRegisteredPrimitives;
begin
 If FInstance = nil Then
 begin
  FInstance := TmsRegisteredPrimitives.Create();
 end;
 Result := FInstance;
end;

function TmsRegisteredPrimitives.GetPrimitive(Index: Integer): RmsShape;
begin
 Result := FmsRegistered[Index];
end;

function TmsRegisteredPrimitives.GetPrimitivesCount: integer;
begin
 Result := FmsRegistered.Count;
end;

procedure TmsRegisteredPrimitives.InsertPrimitive(Index: Integer;
  const aValue: RmsShape);
begin
 FmsRegistered.Insert(Index, aValue);
end;

procedure TmsRegisteredPrimitives.SetPrimitive(Index: Integer;
  const aValue: RmsShape);
begin
 FmsRegistered[Index] := aValue;
end;

initialization

 TmsRegisteredPrimitives.GetInstance.AddPrimitive(TmsLine);
 TmsRegisteredPrimitives.GetInstance.AddPrimitive(TmsRectangle);
 TmsRegisteredPrimitives.GetInstance.AddPrimitive(TmsCircle);
// TmsRegisteredPrimitives.GetInstance.AddPrimitive(TmsPointCircle);
end.
