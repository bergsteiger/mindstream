unit TestParser;

interface

uses
  TestFramework
  , uParser
  , SysUtils
  ;

  // Тесты будут номероваться согласно

type
  TestTParser = class(TTestCase)
  published
    procedure TestSomeDo;
    procedure FirstTest;
  end;

implementation

procedure TestTParser.FirstTest;
begin
  Check(True);
end;

procedure TestTParser.TestSomeDo;
var
  l_Parser : TscriptParser;
begin
  l_Parser := TscriptParser.Create;

  FreeAndNil(l_Parser);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTParser.Suite);
end.

