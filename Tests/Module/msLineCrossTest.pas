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
 TestFrameWork
 ;

procedure TmsLineCrossTest.DoIt;
begin
 CheckTrue(false);
end;

initialization
 TestFramework.RegisterTest(TmsLineCrossTest.Suite);
end.
