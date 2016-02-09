unit uL3ParserVsNewParser;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.SysUtils, Vcl.Graphics, Winapi.Windows, System.Variants,
  Vcl.Dialogs, Vcl.Controls, Vcl.Forms, Winapi.Messages, System.Classes, uMain,
  l3Parser;

type
 TL3ParserVsTNewParser = class(TTestCase)
  private
   function FileName: string;
  published
   procedure First;
   procedure CheckTokenEquals;
   procedure CheckL3Parser;
 end;

implementation

uses
 l3Filer
 , l3Types
 ;
{ TL3ParserVsTNewParser }

const
 cParseOptions = [l3_poCheckKeyWords,
                  l3_poCheckInt,
                  //l3_poCheckFloat,
                  //l3_poCheckHex,
                  //l3_poCheckComment,
                  //l3_poCheckStringBracket,
                  l3_poAddDigits2WordChars,
                  l3_poNullAsEOF];

type
 TTokenRec = record
  rToken : string;
  rTokenType : Tl3TokenType;
 constructor Create(const aToken : string; const aTokenType : Tl3TokenType);
 class operator Equal(const Left, Right : TTokenRec) : Boolean;
 end;

procedure TL3ParserVsTNewParser.First;
begin
 Check(True);
end;

procedure TL3ParserVsTNewParser.CheckL3Parser;
var
 l_Parser : Tl3CustomParser;
 l_Filer : Tl3DosFiler;
 l_TokenType : Tl3TokenType;
 l_Tokens : string;
 l_SR: TSearchRec;
 l_Path : string;

 procedure DoSome(aName: string);
 begin
  l_Tokens := l_Tokens + ' ' + aName;
 end;
begin
 l_Tokens := '';
 l_Path :=  '*.txt';
 if FindFirst(l_Path, faAnyFile, l_SR) = 0 then
 begin
   repeat
     if (l_SR.Attr <> faDirectory) then
     begin
      DoSome(l_SR.Name);
     end;
   until FindNext(l_SR) <> 0;
   FindClose(l_SR.FindHandle);
 end;

{ l_Filer := Tl3DosFiler.Make('Test_18_8.txt');
 l_Parser := Tl3CustomParser.Create;
 l_Filer.Open;
 l_Parser.Filer := l_Filer;
 l_Tokens := ' ';
 l_TokenType := l3_ttBOF;
 try
  while not (l_TokenType = l3_ttEOF) do
  begin
   l_TokenType := l_Parser.NextToken;
   l_Tokens := l_Tokens + '; ' + l_Parser.TokenString;
  end;
 finally
  FreeAndNil(l_Filer);
  FreeAndNil(l_Parser);
 end;
 ShowMessage(l_Tokens);  }
end;

procedure TL3ParserVsTNewParser.CheckTokenEquals;
var
 l_Token1, l_Token2 : TTokenRec;
begin
 l_Token1 := TTokenRec.Create('qwe', l3_ttSymbol);
 l_Token2 := TTokenRec.Create('qwe', l3_ttSymbol);

 Check(l_Token1 = l_Token2);
end;

function TL3ParserVsTNewParser.FileName: string;
begin
 Result := 'test';
end;

{ TTokenRec }

constructor TTokenRec.Create(const aToken: string;
  const aTokenType: Tl3TokenType);
begin
 Self.rToken := aToken;
 Self.rTokenType := aTokenType;
end;

class operator TTokenRec.Equal(const Left, Right: TTokenRec): Boolean;
begin
 Result := False;
 if (Left.rToken = Right.rToken) and (Left.rTokenType = Right.rTokenType) then
  Result := True;
end;

initialization
  // Register any test cases with the test runner
 RegisterTest(TL3ParserVsTNewParser.Suite);
end.

