unit msLineCrossTest;

interface

uses
 msLoggedTest
 ;

type
 TmsLineCrossTest = class(TmsLoggedTest)
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
