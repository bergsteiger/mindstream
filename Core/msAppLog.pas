unit msAppLog;

interface

type
 TmsAppLog = class
 strict private
  class var f_Instance: TmsAppLog;
  constructor Create;
  destructor Fini;
 public
  class function GetInstance: TmsAppLog;
 end;

implementation

uses
 System.SysUtils
 ;
constructor TmsAppLog.Create;
begin
 inherited;
end;

destructor TmsAppLog.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsAppLog.GetInstance: TmsAppLog;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create;
 Result := f_Instance;
end;

end.
