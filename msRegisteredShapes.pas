unit msRegisteredShapes;

interface

uses
 msShape
 ;

type
 TmsRegisteredShapes = class
 strict private
  f_Registered : RmsShapeList;
  class var f_Instance: TmsRegisteredShapes;
  constructor Create;
  class destructor Fini;
 public
  class function Instance: TmsRegisteredShapes;
  function First: RmsShape;
  procedure Register(const aValue : RmsShape);
  destructor Destroy; override;
  function GetEnumerator: RmsShapeList.TEnumerator;
 end;//TmsRegisteredShapes

implementation

uses
 SysUtils
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
 f_Registered.Add(aValue);
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

end.
