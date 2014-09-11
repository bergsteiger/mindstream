unit u_FirstTest;

interface

uses
  TestFrameWork
  ;

type
  TFirstTest = class(TTestCase)
   published
    procedure DoIt;
  end;//TFirstTest

implementation

procedure TFirstTest.DoIt;
begin
 Check(true);
end;

initialization
 TestFramework.RegisterTest(TFirstTest.Suite);
end.

