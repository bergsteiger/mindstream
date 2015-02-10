unit msAppLog;

interface

uses
 msCoreObjects
 ;

type
 TmsAppLog = class (TmsLog)
 strict private
  class var f_Instance: TmsAppLog;
  constructor Create(const aFileName: String);
  destructor Fini;
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

destructor TmsAppLog.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsAppLog.Instance: TmsAppLog;
const
 c_AppLogFileName = 'Mindstream.App.Log';
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create(ExtractFilePath(ParamStr(0)) + c_AppLogFileName);
 Result := f_Instance;
end;

end.

