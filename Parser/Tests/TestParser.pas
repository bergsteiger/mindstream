unit TestParser;

interface

uses
 TestFramework
 , l3Parser
 , uNewParser
 , SysUtils
 ;

// Тесты будут номероваться согласно пунктам в статье
// https://bitbucket.org/lulinalex/mindstream/wiki/%D0%A1%D1%82%D0%B0%D1%82%D1%8C%D0%B8%20%D0%BD%D0%B0%20%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%BC/%D0%A3%D1%81%D1%82%D1%80%D0%BE%D0%B9%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%88%D0%B8%D0%BD%D1%8B/%D0%9E%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%82%D0%B0%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B2

type
 TSomeProcedure = reference to procedure(aParser: TNewParser);

 TestTParser = class(TTestCase)
 private
  procedure DoIt(const aFileName: String;
                              const aLambda: TSomeProcedure);
  function FileName: string;
 published
  procedure TestCreate;
  procedure FirstTest;
  procedure Test_3_1;
  procedure Test_3_2;
  procedure Test_3_3;
  procedure Test_3_4;
  procedure Test_3_5;
  procedure Test_3_6;
  // Simple token
  procedure Test_4_1;
  procedure Test_4_2;
  procedure Test_4_3;
  procedure Test_4_4;
  procedure Test_4_5;

  // Comment //
  procedure Test_5;
  procedure Test_5_0_1;
  procedure Test_5_0_2;
  procedure Test_5_0_3;
  procedure Test_5_0_4;
  procedure Test_5_1;

  // Comennt // and /* */
  procedure Test_6_1;
  procedure Test_6_2;
  procedure Test_6_3;
  procedure Test_6_4;
  procedure Test_6_5;
  procedure Test_6_6;
  procedure Test_6_7;
  procedure Test_6_8;
  procedure Test_6_9;
  procedure Test_6_10;
  procedure Test_6_11;
  procedure Test_6_12;
  procedure Test_6_13;
  procedure Test_6_14;
  procedure Test_6_15;
  procedure Test_6_16;

  // Boolean
  procedure Test_7;
  procedure Test_7_1;
  procedure Test_7_2;

  procedure Test_8;

  // StringTests
  procedure Test_10_1;
  procedure Test_10_2;
  procedure Test_10_3;
  procedure Test_10_4;
  procedure Test_10_5;
  procedure Test_10_6;

  // SymbolTests
  procedure Test_12_1;
  procedure Test_12_1_1;
  procedure Test_12_1_2;
  procedure Test_12_2;
  procedure Test_12_3;
  procedure Test_12_4;
  procedure Test_12_5;
  procedure Test_12_6;
  procedure Test_12_7;
  procedure Test_12_8;
  procedure Test_12_9;
  procedure Test_12_10;
  procedure Test_12_11;
  procedure Test_12_12;
  procedure Test_12_13;

  // Quotes in string
  procedure Test_13_1;
  procedure Test_13_2;
  procedure Test_13_3;
  procedure Test_13_4;
  procedure Test_13_5;
  procedure Test_13_6;

  // Dec numbers
  procedure Test_15_1;
  procedure Test_15_2;
  procedure Test_15_3;
  procedure Test_15_4;
  procedure Test_15_5;
  procedure Test_15_6;

  // Dec negative numbers
  procedure Test_16_1;
  procedure Test_16_2;
  procedure Test_16_3;
  procedure Test_16_4;
  procedure Test_16_5;
  procedure Test_16_6;

  // Hex numbers
  procedure Test_17_1;
  procedure Test_17_2;
  procedure Test_17_3;
  procedure Test_17_4;
  procedure Test_17_5;
  procedure Test_17_6;
  procedure Test_17_7;
  procedure Test_17_8;
  procedure Test_17_9;

  // Symbols in hex
  procedure Test_18_1;
  procedure Test_18_2;
  procedure Test_18_3;
  procedure Test_18_4;
  procedure Test_18_5;
  procedure Test_18_6;
  procedure Test_18_7;
  procedure Test_18_8;

  // Identifiers
  procedure Test_19_1;
  procedure Test_19_2;
  procedure Test_19_3;
  procedure Test_19_4;
  procedure Test_19_5;
  procedure Test_19_6;
 end;

implementation

uses
 uTypes
 ;

procedure TestTParser.DoIt(const aFileName: String;
                           const aLambda: TSomeProcedure);
var
 l_Parser: TNewParser;
begin
 l_Parser := TNewParser.Create(aFileName);
 try
  aLambda(l_Parser);

  l_Parser.NextToken;
  CheckTrue(l_Parser.EOF);
 finally
  FreeAndNil(l_Parser);
 end;
end;

function TestTParser.FileName: string;
begin
 Result := Name + '.txt';
end;

procedure TestTParser.FirstTest;
begin
 Check(True);
end;

procedure TestTParser.TestCreate;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   Check(true);
  end);
end;

procedure TestTParser.Test_3_1;
begin
 //   a#
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'a#') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_3_2;
begin
 //
 //   a#
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'a#') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_3_3;
begin
 //
 //   a#
 //	b#
 //

 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a#') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'b#') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_3_4;
begin
 //
 //   a#
 //b#
 //

 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a#') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'b#') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_3_5;
begin
//
//   a#'	q
//b#
//

 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a#' + CQuote + cTab + 'q' + cCRLF +
                                    'b#' + cCRLF +
                                    cTab + cCRLF) and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_3_6;
begin
//
//   a#'	q
//b#
//' a#
//
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a#' + CQuote + cTab + 'q' +
                                    cCRLF + 'b#' + cCRLF + cQuote) and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a#')  and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_4_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'C') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_4_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;

   CheckTrue((aParser.TokenString = '+') and
             (aParser.TokenType = l3_ttSymbol));
 end);
end;

procedure TestTParser.Test_4_3;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'B+') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_4_4;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A+') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_4_5;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));
 end);
end;

procedure TestTParser.Test_5_0_1;
begin
 {
 A+B
 /2/ A+B
 }
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '/2/') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_5_0_2;
begin
 {
 A+B
 /2/ 'A+B // qwe
 'A
 }
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '/2/') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + 'A+B // qwe' + cCRLF +
                                    cQuote + 'A') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_5_0_3;
begin
 {
 A+B
 /2/ A+B // qwe
 'A
 }
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '/2/') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + 'A') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_5_0_4;
begin
 {
 / a
 }
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cSlash) and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_5;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_5_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A+B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'AA') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'AA') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'AA') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'BB') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_3;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'AA') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'BB') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_4;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'AA') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_5;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_6;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_7;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_8;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_9;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_10;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '*/') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_11;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_12;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'C') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_13;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'C') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_14;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_15;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_6_16;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_7;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'false') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_7_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'false') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_7_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'B') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'false') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_8;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'true') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_10_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'abc') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_10_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'abc d') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_10_3;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'ab' + #13#10 + 'c') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_10_4;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'ab'#13#10'qwe qwe'#13#10'qwe qwe'#13#10'c') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_10_5;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'abc') and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'token') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'abc') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_10_6;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'abc') and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'cba') and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'zxc') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12#13#14) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_1_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12) and
             (aParser.TokenType = l3_ttString));
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'a') and
             (aParser.TokenType = l3_ttSymbol));
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #13#14) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_1_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue(aParser.TokenType = l3_ttUnknown);
  end);
end;

procedure TestTParser.Test_12_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12#13#14'a') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_3;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12#13#14'ab') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_4;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12#13#14'ab'#15) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_5;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12#13#14'ab'#15'cd') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_6;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = #12#13'abc'#13#10'def'#14#15) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_7;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = ' ') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_8;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_9;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;

   CheckTrue((aParser.TokenString = '!') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_10;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13) and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = #10) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_11;
begin
 // #2Z #13'a'
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '#2Z') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13 + 'a') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_12;
begin
// #2Z #13'a' #0
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '#2Z') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13 + 'a') and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = #0) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_12_13;
begin
 //#32 #2Z'Qqwe<CRLF>23 121212#$a #13#10'
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #32) and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '#2Z' + '''' + 'Qqwe'#13#10'23 121212#$a #13#10' + '''') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_13_1;
begin
 //''''
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_13_2;
begin
 //''''''
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + cQuote) and
             (aParser.TokenType = l3_ttString));
  end);
end;


procedure TestTParser.Test_13_3;
begin
 //'''a'''
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + 'a' + cQuote) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_13_4;
begin
 //'a'''
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a' + cQuote) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_13_5;
begin
 //'''a'
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + 'a') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_13_6;
begin
 //''''''''''''
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + cQuote + cQuote + cQuote) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_15_1;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_15_2;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_15_3;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_15_4;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '20') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_15_5;
begin
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '20') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '200') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_15_6;
begin
//200 a a2 2a
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '200') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a2') and
             (aParser.TokenType = l3_ttSymbol));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2a') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_16_1;
begin
//-1
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-1') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;


procedure TestTParser.Test_16_2;
begin
// -1 -2
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-2') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_16_3;
begin
// -1 -2 -0
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;


procedure TestTParser.Test_16_4;
begin
//-1 -2 -0 -20
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-20') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_16_5;
begin
//-1 -2 -0 -20 -200
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-20') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-200') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_16_6;
begin
//-1 -2 -0 -20 -200 - 2 --- -2a
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-20') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-200') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '---') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-2a') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_17_1;
begin
//$0
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_2;
begin
//$0 $1
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_3;
begin
//$0 $1 $2
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_4;
begin
//$0 $1 $2 $A
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '10') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_5;
begin
//$0 $1 $2 $A $F
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '0') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '1') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '2') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '10') and
             (aParser.TokenType = l3_ttInteger));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '15') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_6;
begin
//$10
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '16') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_7;
begin
//$10
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '255') and
             (aParser.TokenType = l3_ttInteger));
  end);
end;

procedure TestTParser.Test_17_8;
begin
//$ A
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '$') and
             (aParser.TokenType = l3_ttUnknown));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'A') and
             (aParser.TokenType = l3_ttSymbol));
  end);
end;

procedure TestTParser.Test_17_9;
begin
//-$A
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '-$A') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_18_1;
begin
//#$0
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #0) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_2;
begin
//#$A
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #10) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_3;
begin
//#$D
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_4;
begin
//#$D'a'
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13'a') and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_5;
begin
//'a'#$D
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = 'a'#13) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_6;
begin
//''''#$D
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = cQuote + #13) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_7;
begin
//#$D''''
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13 + cQuote) and
             (aParser.TokenType = l3_ttString));
  end);
end;

procedure TestTParser.Test_18_8;
begin
//#$D'''' #$P
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = #13 + cQuote) and
             (aParser.TokenType = l3_ttString));

   aParser.NextToken;
   CheckTrue((aParser.TokenString = '#$P') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

procedure TestTParser.Test_19_1;
begin
//""
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '""') and
             (aParser.TokenType = l3_ttDoubleQuotedString));
  end);
end;

procedure TestTParser.Test_19_2;
begin
//"a"
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '"a"') and
             (aParser.TokenType = l3_ttDoubleQuotedString));
  end);
end;

procedure TestTParser.Test_19_3;
begin
//"ab"
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '"ab"') and
             (aParser.TokenType = l3_ttDoubleQuotedString));
  end);
end;

procedure TestTParser.Test_19_4;
begin
//"a
//b"
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '"a'#13#10'b"') and
             (aParser.TokenType = l3_ttDoubleQuotedString));
  end);
end;

procedure TestTParser.Test_19_5;
begin
//"a
//b
//c"
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '"a'#13#10'b'#13#10'c"') and
             (aParser.TokenType = l3_ttDoubleQuotedString));
  end);
end;

procedure TestTParser.Test_19_6;
begin
//"a
//b
//c"qwe
 DoIt(FileName,
  procedure(aParser: TNewParser)
  begin
   aParser.NextToken;
   CheckTrue((aParser.TokenString = '"a'#13#10'b'#13#10'c"qwe') and
             (aParser.TokenType = l3_ttUnknown));
  end);
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTParser.Suite);

end.
