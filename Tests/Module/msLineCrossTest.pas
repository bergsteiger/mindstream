unit msLineCrossTest;

interface

uses
 msLoggedTest,
 msLineF
 ;

type
 TmsLineCrossTest = class(TmsLoggedTest)
 private
  f_L1 : TmsLineF;
  f_L2 : TmsLineF;
 published
  procedure DoIt;
 end;//TmsLineCrossTest

implementation

uses
 TestFrameWork,

 FMX.DUnit.msLog
 ;

procedure TmsLineCrossTest.DoIt;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  begin
   aLog.ToLog('failed');
  end
 );
end;

initialization
 TestFramework.RegisterTest(TmsLineCrossTest.Suite);
end.
