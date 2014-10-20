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
    procedure ErrorTest;
    procedure SecondErrorTest;
  end;//TFirstTest

implementation

procedure TSecondTest.DoIt;
begin
 Check(true);
end;

procedure TSecondTest.ErrorTest;
begin
 raise ExceptionClass.Create('Error Message');
end;

procedure TSecondTest.OtherDoIt;
begin
 Check(True);
end;

procedure TSecondTest.SecondErrorTest;
begin
 Check(False);
end;

initialization
 TestFramework.RegisterTest(TSecondTest.Suite);
end.

