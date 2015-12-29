unit TestParser;

interface

uses
  TestFramework
  , uParser
  , SysUtils
  ;

  // Тесты будут номероваться согласно пунктам в статье
  // https://bitbucket.org/lulinalex/mindstream/wiki/%D0%A1%D1%82%D0%B0%D1%82%D1%8C%D0%B8%20%D0%BD%D0%B0%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%BC/%D0%A3%D1%81%D1%82%D1%80%D0%BE%D0%B9%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%88%D0%B8%D0%BD%D1%8B/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%82%D0%B0%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B2

type
  TestTParser = class(TTestCase)
  published
    procedure TestCreate;
    procedure FirstTest;
    procedure Test_4_1;
  end;

implementation

procedure TestTParser.FirstTest;
begin
  Check(True);
end;

procedure TestTParser.TestCreate;
var
  l_Parser : TScriptParser;
begin
  l_Parser := TScriptParser.Create('Test_4_1.txt');

  CheckFalse(l_Parser.EOF);

  FreeAndNil(l_Parser);
end;

procedure TestTParser.Test_4_1;
var
  l_Parser : TScriptParser;
  l_Char : AnsiChar;
begin
  l_Parser := TScriptParser.Create('Test_4_1.txt');

  l_Parser.NextToken;

  CheckTrue(l_Parser.TokenString = 'A');

  FreeAndNil(l_Parser);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTParser.Suite);
end.

