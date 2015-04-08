unit FMX.DUnit.msAppLog;

interface

uses
 FMX.DUnit.msLog
 ;

type
 TmsAppLog = class (TmsLog)
 strict private
  class var f_Instance: TmsAppLog;
  constructor Create(const aFileName: String);
  class destructor Fini;
 public
  class function Instance: TmsAppLog;
 end;//TmsAppLog

implementation

uses
 System.SysUtils,
 FMX.Dialogs
 ;

// TmsAppLog

constructor TmsAppLog.Create(const aFileName: String);
begin
 inherited Create(aFileName);
end;

class destructor TmsAppLog.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsAppLog.Instance: TmsAppLog;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create(ChangeFileExt(ParamStr(0), '.App.Log'));
 Result := f_Instance;
end;

end.

