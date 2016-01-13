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

 // Определяем многострочность строки
 {$REGION 'IsTokenMultiLineString'}
 function IsTokenMultiLineString : boolean;
 // Делаем проверку ttString на многострочность
 var
  l_LastChar : char;
 begin
  Result := False;
  l_LastChar := #0;

  if f_CurrentLine <> '' then
   l_LastChar := f_CurrentLine[Length(f_CurrentLine)];

  if (f_TokenType = ttString) and
     (l_LastChar <> cQuote) then
   Result := True;
 end;
 {$ENDREGION}

 // Определяем что за тип у токена ttToken
 {$Region 'ExamineToken'}
 procedure ExamineToken;
  function IsBooleanToken : Boolean;
  begin
   Result := False;

   if (TokenString = 'false') or
      (TokenString = 'true') then
    Result := True;
  end;

  function IsStringToken(const aToken: String) : Boolean;
  var
   l_Pos : Integer;
   l_CharInPos : Char;
   l_Str,
   l_Buffer,
   l_ResultToken : String;

  function ExistNextChar : boolean;
  begin
   Result := False;
   Result := l_Pos + 1 <= Length(l_Str);
  end;

  function NextCharIsDigit : boolean;
  var
   l_Ch : Char;
  begin
   Result := False;
   l_Ch := l_Str[l_Pos + 1];
   Result := l_Ch.IsDigit;
  end;

  procedure AddCharToResultToken;
  begin
   l_ResultToken := l_ResultToken + Chr(StrToInt(l_Buffer));
   l_Buffer := '';
  end;

  // IsStringTokenBegin
  begin
   Result := True;
   l_Buffer := '';
   l_ResultToken := '';
   l_Pos := 1;
   l_Str := aToken;
   try
    repeat
     l_CharInPos := l_Str[l_Pos];
     if l_CharInPos = '#' then
     begin
      if l_Buffer <> '' then
       AddCharToResultToken;

      if ExistNextChar then
       If NextCharIsDigit then
        Inc(l_Pos);
     end // l_Str[l_Pos]='#'
     else
      if l_CharInPos.IsDigit then
      begin
       l_Buffer := l_Buffer + l_CharInPos;
       Inc(l_Pos);
      end;
    until l_Pos > Length(l_Str); // l_Pos < Length(l_Str)

    if l_Buffer <> '' then
     AddCharToResultToken;

   finally
    if Result then
     f_Token := l_ResultToken;
   end;

  end;// IsStringToken
 begin
  if TokenType = ttToken then
  begin
   if IsBooleanToken then
   begin
    f_TokenType := ttBoolean;
    Exit;
   end // IsBooleanToken
   else if IsStringToken(f_Token) then
   begin
    f_TokenType := ttString;
    Exit;
   end // IsStringToken(f_Token)
  end
 end;
 {$ENDREGION}

 function IsStringDelimiter : boolean;
 begin
  Result := False;
  Result := (f_CurrentLine[f_PosInCurrentLine] = cQuote);
 end;
begin
 // Если не многострочный стринг обнуляем токен
 if IsTokenMultiLineString then
  f_Token := f_Token + #13#10
 else
 begin
  f_Token := '';
  f_TokenType := ttUnknown;
 end;

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
  if IsStringDelimiter or
     (TokenType = ttString) then
  begin
   f_TokenType := ttString;

   if IsStringDelimiter then
    Inc(f_PosInCurrentLine);

   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if not IsStringDelimiter then
    begin
     f_Token := f_Token + f_CurrentLine[f_PosInCurrentLine];
     Inc(f_PosInCurrentLine);
    end // (f_CurrentLine[f_PosInCurrentLine] <> cQuote)
    else
    begin
     Inc(f_PosInCurrentLine);
     break;
    end; // else
  end // (f_CurrentLine[f_PosInCurrentLine] = cQuote)
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
  if IsTokenMultiLineString then
   NextToken;

  ExamineToken;

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

