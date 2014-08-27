unit msRegisteredShapes;

interface

uses
 msShape
 ;

type
 RmsShapeList = TList<RmsShape>;

 TmsRegisteredShapes = class
 strict private
  f_Registered : RmsShapeList;
  class var f_Instance: TmsRegisteredShapes;
  constructor Create;
  class destructor Fini;
 public
  class function Instance: TmsRegisteredShapes;
  function First: RmsShape;
  procedure Register(const aValue: RmsShape); overload;
  procedure Register(const aShapes: array of RmsShape); overload;
  destructor Destroy; override;
  function GetEnumerator: RmsShapeList.TEnumerator;
    function IndexOf(const aValue: RmsShape): Integer;
    function Func: Integer;
  end;//TmsRegisteredShapes

implementation

uses
 System.SysUtils
 ;

function TmsRegisteredShapes.First: RmsShape;
begin
 Result := f_Registered.First;
end;

function TmsRegisteredShapes.GetEnumerator: RmsShapeList.TEnumerator;
begin
 Result := f_Registered.GetEnumerator;
end;

class destructor TmsRegisteredShapes.Fini;
begin
 FreeAndNil(f_Instance);
end;

destructor TmsRegisteredShapes.Destroy;
begin
 FreeAndNil(f_Registered);
 inherited;
end;

procedure TmsRegisteredShapes.Register(const aValue: RmsShape);
begin
 Assert(f_Registered.IndexOf(aValue) < 0);
 f_Registered.Add(aValue);
end;

procedure TmsRegisteredShapes.Register(const aShapes: array of RmsShape);
var
 l_Index : Integer;
begin
 for l_Index := Low(aShapes) to High(aShapes) do
  Self.Register(aShapes[l_Index]);
end;

constructor TmsRegisteredShapes.Create;
begin
 inherited;
 f_Registered := RmsShapeList.Create;
end;

class function TmsRegisteredShapes.Instance: TmsRegisteredShapes;
begin
 if (f_Instance = nil) then
  f_Instance := TmsRegisteredShapes.Create;
 Result := f_Instance;
end;

function TmsRegisteredShapes.IndexOf(const aValue : RmsShape): Integer;
begin
 Result := f_Registered.IndexOf(aValue);
end;

function TmsRegisteredShapes.Func: Integer;
begin
end;

end.

