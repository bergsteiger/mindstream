unit u_SecondTest;

interface

uses
  TestFrameWork
  ;

type
  TSecondTest = class(TTestCase)
   published
    procedure DoIt;
    procedure OtherDoIt;
  end;//TFirstTest

implementation

procedure TSecondTest.DoIt;
begin
 Check(true);
end;

procedure TSecondTest.OtherDoIt;
begin
 Check(True);
end;

initialization
 TestFramework.RegisterTest(TSecondTest.Suite);
end.

