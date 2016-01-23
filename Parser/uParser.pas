unit uParser;

interface

uses
 Classes;

type
 TscriptTokenType = (ttUnknown, ttString, ttToken, ttEOF, ttBoolean);

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
 , System.Character
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

 // Удаляем все комментарии из строки l_Line
 {$Region 'DeleteComments'}
 procedure DeleteComments;
 var
  l_CharCount : Integer;

  // Удаляет все символы после //
  {$Region 'DeleteLineComment'}
  procedure DeleteLineComment;
  begin
   if (l_LineCommentPos > 0) then
   begin
    Delete(l_Line, l_LineCommentPos, Length(l_Line) - l_LineCommentPos + 1);
   end; // l_LineCommentPos > 0
  end; // DeleteLineComment
  {$ENDREGION}
  // Удаляет все символы внутри  /* */
  {$Region 'DeleteBlockComment'}
  procedure DeleteBlockComment;
  begin

   f_IsBlockComment := True;

   if (l_BlockCommentPosEnd  > 0) then
    f_IsBlockComment := False
   else
    l_BlockCommentPosEnd := Length(l_Line);

   if l_BlockCommentPosBegin = 0 then
    l_BlockCommentPosBegin := 1;

   if l_BlockCommentPosEnd < l_BlockCommentPosBegin then
   begin
    l_CharCount := l_BlockCommentPosEnd + 2;
    Delete(l_Line, 1, l_CharCount);
   end // l_BlockCommentPosEnd < l_BlockCommentPosBegin
   else
   begin
    l_CharCount := l_BlockCommentPosEnd - l_BlockCommentPosBegin + 2;

    Delete(l_Line, l_BlockCommentPosBegin, l_CharCount);
   end; // else l_BlockCommentPosEnd < l_BlockCommentPosBegin
  end;
  {$ENDREGION}
  // Проверяет есть ли комментарий в строке l_Line
  {$Region 'IsStringHasCommentBegin'}
  function IsStringHasCommentBegin : boolean;
  begin
   Result := False;
   l_LineCommentPos := Pos('//', l_Line);
   l_BlockCommentPosBegin := Pos('/*', l_Line);
   l_BlockCommentPosEnd := Pos('*/', l_Line);

   if (l_LineCommentPos > 0) or (l_BlockCommentPosBegin > 0) then
    Result := True;
  end;
  {$ENDREGION}
 begin
  IsStringHasCommentBegin;

  // Если в строке есть оба признака комментария
  if (l_LineCommentPos > 0) and (l_BlockCommentPosBegin > 0) then
  begin
   if l_LineCommentPos < l_BlockCommentPosBegin then
    DeleteLineComment
   else
    DeleteBlockComment;
  end // (l_LineCommentPos > 0) and (l_BlockCommentPosBegin > 0)
  else
  begin
   if (l_BlockCommentPosBegin > 0) or f_IsBlockComment then
    DeleteBlockComment;

   if l_LineCommentPos > 0 then
    DeleteLineComment;
  end; // else

  // Если в строке есть ещё комментарии запускаем заново удаление
  if IsStringHasCommentBegin then
   DeleteComments;
 end; // DeleteComennts
 {$ENDREGION}

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
 finally
  DeleteComments;
  Result := l_Line;
 end; // try..finally
end;

procedure TScriptParser.NextToken;
const
 cQuote = #39;
 cWhiteSpace = [#32, #9];
 cDoubleQuote = #35;

var
 l_CurrentChar : Char;
 l_IsTokenCompleted : Boolean;

 procedure NextChar;
 begin
  Inc(f_PosInCurrentLine);
 end;

 procedure addCharToToken(l_Char : Char);
 begin
  f_Token := f_Token + l_Char;
 end;

begin
 f_Token := '';
 f_TokenType := ttUnknown;

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
    NextChar
   else
    break;

  if (f_PosInCurrentLine <= Length(f_CurrentLine)) then
   break;
 end; // while true

 // Читаем токен
 l_CurrentChar := f_CurrentLine[f_PosInCurrentLine];

 if l_CurrentChar = '''' then
 begin
  f_TokenType := ttString;
  // TODO STRING
 end
 else // not
 begin
  f_TokenType := ttToken;

  while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
   if (not (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)) then
   begin
    addCharToToken(f_CurrentLine[f_PosInCurrentLine]);
    NextChar;
   end // (not (l_CurrentChar in cWhiteSpace))
   else
    break;

 end; // else

 if (Self.f_TokenType = ttUnknown) then
  if Self.EOF then
   f_TokenType := ttEOF;
end;

function TScriptParser.EOF: Boolean;
begin
 Result := f_EOF AND (f_CurrentLine = '');
end;

end.

