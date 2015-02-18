unit msLineF;

interface

uses
 System.Types,

 FMX.DUnit.msLog
 ;

type
 TmsLineF = record
 public
  procedure ToLog(aLog: TmsLog);
 end;//TmsLineF

implementation

// TmsLineF

procedure TmsLineF.ToLog(aLog: TmsLog);
begin
 aLog.ToLog('dump line');
end;

end.
