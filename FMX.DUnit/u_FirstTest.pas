unit u_FirstTest;

interface

uses
  TestFrameWork
  ;

type
  TFirstTest = class(TTestCase)
   published
    procedure DoIt;
    procedure OtherDoIt;
  end;//TFirstTest

implementation

procedure TFirstTest.DoIt;
begin
 Check(true);
end;

procedure TFirstTest.OtherDoIt;
begin
 Check(True);
end;

initialization
 TestFramework.RegisterTest(TFirstTest.Suite);
end.

