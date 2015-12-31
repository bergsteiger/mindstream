unit uParser;

interface

uses
 Classes;

type
 TscriptTokenType = (ttUnknown, ttString, ttToken, ttEOF);

type
 TScriptParser = class
 private
  f_Stream: TStream;
  f_EOF: Boolean;
  f_CurrentLine: String;
  f_PosInCurrentLine: Integer;
  f_Token: String;
  f_TokenType: TscriptTokenType;
  f_CurrentLineNumber: Integer;
  f_IsBlockComment: Boolean;
 protected
  function ReadLn: String;
 protected
  function GetChar(out aChar: AnsiChar): Boolean;
 public
  constructor Create(const aStream: TStream); overload;
  constructor Create(const aFileName: String); overload;
  destructor Destroy; override;

  function EOF: Boolean;
  { * - Достигнут конец входного потока. }
  procedure NextToken;
  { * - Выбрать следующий токен из входного потока. }
 public
  property TokenString: String read f_Token;
  { * - текущий токен. }
  property TokenType: TscriptTokenType read f_TokenType;
  { * - тип текущего токена. }
 end; // TscriptParser

implementation

uses
 System.SysUtils
{$IFDEF TestParser}
  ,
 Testing.Engine
{$ENDIF TestParser}
  ;

type
 TscriptParserContainer = class
 private
  f_Parser: TScriptParser;
 private
  function Get_TokenType: TscriptTokenType;
  function Get_TokenString: String;
  function Get_CurrentLineNumber: Integer;
  procedure NextToken;
  { * - Выбрать следующий токен из входного потока. }
 public
  constructor Create(aParser: TScriptParser);
  destructor Destroy; override;
 end; // TscriptParserContainer

constructor TscriptParserContainer.Create(aParser: TScriptParser);
begin
 Assert(aParser <> nil);
 inherited Create;
 f_Parser := aParser;
end;

destructor TscriptParserContainer.Destroy;
begin
 FreeAndNil(f_Parser);
 inherited;
end;

function TscriptParserContainer.Get_TokenType: TscriptTokenType;
begin
 Result := f_Parser.TokenType;
end;

function TscriptParserContainer.Get_TokenString: String;
begin
 Result := f_Parser.TokenString;
end;

function TscriptParserContainer.Get_CurrentLineNumber: Integer;
begin
 Result := f_Parser.f_CurrentLineNumber;
end;

procedure TscriptParserContainer.NextToken;
{ * - Выбрать следующий токен из входного потока. }
begin
 f_Parser.NextToken;
end;

// TscriptParser

constructor TScriptParser.Create(const aStream: TStream);
begin
 inherited Create;
 f_PosInCurrentLine := 1;
 f_EOF := false;
 f_Stream := aStream;
end;

constructor TScriptParser.Create(const aFileName: String);
var
 l_FileName: String;
begin
 l_FileName := aFileName;
 if (ExtractFilePath(l_FileName) = '') then
  l_FileName := ExtractFilePath(ParamStr(0)) + '\' + l_FileName;
 Create(TFileStream.Create(l_FileName, fmOpenRead));
end;

destructor TScriptParser.Destroy;
begin
 FreeAndNil(f_Stream);
 inherited;
end;

function TScriptParser.GetChar(out aChar: AnsiChar): Boolean;
begin
 if (f_Stream.Read(aChar, SizeOf(aChar)) = SizeOf(aChar)) then
 begin
  Result := true;
 end
 else
  Result := false;
end;

function TScriptParser.ReadLn: String;
var
 l_Char: AnsiChar;
 l_Line: String;
 l_LineCommentPos,
 l_BlockCommentPosBegin,
 l_BlockCommentPosEnd : Integer;

 procedure DeleteComments;
 var
  l_CharCount : Integer;
 begin
  // Коментарий //
  l_LineCommentPos := Pos('//', Result);
  if (l_LineCommentPos > 0) then
  begin
   Delete(Result, l_LineCommentPos, Length(Result) - l_LineCommentPos + 1);
  end; // l_LineCommentPos > 0

  // Коментарий /* */
  l_BlockCommentPosBegin := Pos('/*', Result);
  l_BlockCommentPosEnd := Pos('*/', Result);

  if (l_BlockCommentPosBegin > 0) or f_IsBlockComment then
  begin
   f_IsBlockComment := True;

   if (l_BlockCommentPosEnd  > 0) then
    f_IsBlockComment := False
   else
    l_BlockCommentPosEnd := Length(Result);

   if l_BlockCommentPosBegin = 0 then
    l_BlockCommentPosBegin := 1;

   l_CharCount := l_BlockCommentPosEnd - l_BlockCommentPosBegin + 2;

   Delete(Result, l_BlockCommentPosBegin, l_CharCount);
  end; // (l_BlockCommentPosBegin > 0) or f_IsBlockComment
 end;
begin
 Inc(f_CurrentLineNumber);
 try
  l_Line := '';
  while GetChar(l_Char) do
  begin
   if (l_Char = #13) then
   begin
    if GetChar(l_Char) then
    begin
     if (l_Char = #10) then
     begin
      Result := l_Line;
      Exit;
     end // l_Char = #10
     else
      Assert(false, 'Что-то пошло не так, после символа 13 нет символа 10');
    end // GetChar(l_Char)
    else
     Assert(false, 'Что-то пошло не так, после символа 13 сразу конец файла');
   end; // l_Char = #13
   l_Line := l_Line + l_Char;
  end; // while GetChar(l_Char)
  f_EOF := true;
  Result := l_Line;
 finally
  DeleteComments;
 end; // try..finally
end;

procedure TScriptParser.NextToken;
const
 cQuote = #39;
 cWhiteSpace = [#32, #9];
begin
 f_TokenType := ttUnknown;
 f_Token := '';
 try
  while true do
  begin
   if (f_PosInCurrentLine >= Length(f_CurrentLine)) then
   begin
    // - Типа текущая строка ВСЯ обработана
    f_CurrentLine := '';
    f_PosInCurrentLine := 1;
   end; // f_PosInCurrentLine > Length(f_CurrentLine)

   while (f_CurrentLine = '') do
   begin
    f_CurrentLine := ReadLn;
    if (f_CurrentLine = '') then
     if f_EOF then
      Exit;
   end; // while(f_NextToken = '')

   // Тут пропускаем пустые символы:
   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace) then
     Inc(f_PosInCurrentLine)
    else
     break;
   if (f_PosInCurrentLine <= Length(f_CurrentLine)) then
    break;
  end; // while true

  // Тут накапливаем НЕ пустые символы:
  if (f_CurrentLine[f_PosInCurrentLine] = cQuote) then
  begin
   f_TokenType := ttString;
   Inc(f_PosInCurrentLine);
   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if (f_CurrentLine[f_PosInCurrentLine] <> cQuote) then
    begin
     f_Token := f_Token + f_CurrentLine[f_PosInCurrentLine];
     Inc(f_PosInCurrentLine);
    end // not (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)
    else
    begin
     Inc(f_PosInCurrentLine);
     break;
    end; // f_CurrentLine[f_PosInCurrentLine] <> cQuote
  end // f_CurrentLine[f_PosInCurrentLine] = ''
  else
  begin
   f_TokenType := ttToken;
   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if (not(f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)) then
    begin
     f_Token := f_Token + f_CurrentLine[f_PosInCurrentLine];
     Inc(f_PosInCurrentLine);
    end // not (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)
    else
     break;
  end; // else
 finally
  if (Self.f_TokenType = ttUnknown) then
   if Self.EOF then
    f_TokenType := ttEOF;
 end; // try..finally
end;

function TScriptParser.EOF: Boolean;
begin
 Result := f_EOF AND (f_CurrentLine = '');
end;

end.
