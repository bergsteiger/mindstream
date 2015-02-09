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
  class function GetInstance(const aFileName: String): TmsAppLog;
  procedure ShowMsg;
 end;

implementation

uses
 System.SysUtils,
 FMX.Dialogs
 ;

constructor TmsAppLog.Create(const aFileName: String);
begin
// inherited Create(aFileName);
end;

destructor TmsAppLog.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsAppLog.GetInstance(const aFileName: String): TmsAppLog;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create(aFileName);
 Result := f_Instance;
end;

procedure TmsAppLog.ShowMsg;
begin
 ShowMessage('Hello Log');
end;

end.
