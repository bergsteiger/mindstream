unit u_TCounter;

interface

type
 TCounter = class (TObject)
 private
  FInput : Integer;
 public
  constructor Create(aInput : Integer);
  function DoubleIt: Integer;
 end;
implementation

{ TCounter }

constructor TCounter.Create(aInput: Integer);
begin
 FInput := aInput;
end;

function TCounter.DoubleIt: Integer;
begin
 Result := FInput * 2;
end;

end.
