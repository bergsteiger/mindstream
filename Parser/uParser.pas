unit uParser;

interface

type
  TParser = class
  public
    procedure SomeDo(aIn : string);
  end;

implementation

{ TParser }

procedure TParser.SomeDo(aIn: string);
begin
  assert(false);
end;

end.
