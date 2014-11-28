unit FirstTest;

interface

uses
  TestFrameWork
  ;

type
  TFirstTest = class(TTestCase)
   published
    procedure DoIt;
//    procedure FailureTest;
    procedure DoItAgain;
  end;//TFirstTest

implementation

uses
  SysUtils
  ;

procedure TFirstTest.DoIt;
begin
 Check(true);
end;

procedure TFirstTest.DoItAgain;
begin
 Check(true);
end;

(*procedure TFirstTest.FailureTest;
begin
 //ExpectedException := ETestFailure;
 Check(False);
end;*)

initialization
 TestFramework.RegisterTest(TFirstTest.Suite);
end.

