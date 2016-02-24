unit uNewParser;
interface

uses
 Classes
 ,SysUtils
 ,l3Parser
 ,uTypes
 ;

Const
 cQuote = #39;
 cTab = #9;
 cSpace = #32;
 cCRLF = #13#10;
 cWhiteSpace = [cSpace, cTab];
 cDoubleQuote = '"';
 cMinus = '-';
 cSlash = '/';
 cAsterics = '*';
 cLeftBracket = '{';
 cRightBracket = '}';

type
 EUnknownToken = Class(Exception);

// TTokenType = (ttUnknown,
//               ttString,
//               ttToken,
//               ttBoolean,
//               ttNumber,
//               ttIdentifier,
//               ttEOF);

{type
 TTokenType = (l3_ttUnknown,
               l3_ttString,
               l3_ttSymbol,
               //ttBoolean,
               l3_ttInteger,
               l3_ttDoubleQuotedString,
               l3_ttEOF);  }
//  Tl3TokenType = (
//                  l3_ttBOF,        {- начало файла}
//                  l3_ttEOF,        {- конец файла}
//                  l3_ttEOL,        {- конец строки}
//                  l3_ttSingleChar, {- единичный (управляющий) символ}
//                  l3_ttSymbol,     {- идентификатор}
//                  l3_ttKeyWord,    {- ключевое слово}
//                  l3_ttString,     {- строка (в кавычках)}
//                  l3_ttInteger,    {- целое число}
//                  l3_ttFloat,      {- вещественное число}
//                  l3_ttComment,    {- комментарий}
//                  l3_ttDoubleQuotedString // - строка в двойных кавычках
//                 );

type
 TNewParser = class
 private
  f_Stream: TStream;
  f_EOF: Boolean;
  f_UnknownToken: String;
  f_PosInUnknown: Integer;
  f_Token: String;
  f_TokenType: Tl3TokenType;
 procedure NextChar;
 // Увеличивает f_PosInCurrentToken на 1
 procedure PrevChar;
 // Уменьшает f_PosInCurrentToken на 1
 procedure GetPrevChar(out aChar: AnsiChar);
 // Возвращает предыдущий символ в aChar
 function CurrentChar : Char;
 protected
  function ReadUnknownToken: String;
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
  property TokenType: Tl3TokenType read f_TokenType;
  { * - тип текущего токена. }
 end; // TscriptParser

implementation

uses
 System.Character
 ;

{ TScriptParser }

constructor TNewParser.Create(const aStream: TStream);
begin
 inherited Create;
 f_PosInUnknown := 1;
 f_EOF := false;
 f_Stream := aStream;
end;

constructor TNewParser.Create(const aFileName: String);
var
 l_FileName: String;
begin
 l_FileName := aFileName;
 if (ExtractFilePath(l_FileName) = '') then
  l_FileName := ExtractFilePath(ParamStr(0)) + '\' + l_FileName;
 Create(TFileStream.Create(l_FileName, fmOpenRead));
end;

function TNewParser.CurrentChar: Char;
begin
 Result := f_UnknownToken[f_PosInUnknown];
end;

destructor TNewParser.Destroy;
begin
 FreeAndNil(f_Stream);
 inherited;
end;

function TNewParser.EOF: Boolean;
begin
 Result := f_EOF AND (f_UnknownToken = '');
end;

function TNewParser.GetChar(out aChar: AnsiChar): Boolean;
begin
 if (f_Stream.Read(aChar, SizeOf(aChar)) = SizeOf(aChar)) then
 begin
  Result := true;
 end
 else
  Result := false;
end;

procedure TNewParser.GetPrevChar(out aChar: AnsiChar);
begin
 // Надо ли тут делать проверку на то что это возможно первый символ?
 f_Stream.Position := f_Stream.Position - SizeOf(aChar) - SizeOf(aChar);
 GetChar(aChar);
end;

procedure TNewParser.NextChar;
begin
 Inc(f_PosInUnknown);
end;

procedure TNewParser.PrevChar;
begin
 Dec(f_PosInUnknown);
end;

procedure TNewParser.NextToken;
var
 l_Token : String;

 procedure AnalyzeToken;
 var
  l_IsQuoteOpen : Boolean;
  f_IsSymbol : Boolean;
  l_SymbBuffer : String;
  l_QuoteCount : Integer;
  l_Number : Integer;
  l_IsDoubleQuote : Boolean;

 function ValidStringChar : Boolean;
 begin
  Result := ((CurrentChar = '#') or
             (CurrentChar = cQuote) or
             (CurrentChar = #0));
 end;

 function IsQuoteClose : Boolean;
 begin
  Result := not l_IsQuoteOpen;
 end;

 procedure AddBufferToToken;
 var
  l_Num : Integer;
 begin
  if TryStrToInt(l_SymbBuffer, l_Num) then
   f_Token := f_Token + (Chr(l_Num))
  else
  begin
   l_SymbBuffer := '';
   raise EUnknownToken.Create('Error Message');
  end;
 end;

 procedure AddCharToBuffer(aChar : Char);
 begin
  l_SymbBuffer := l_SymbBuffer + aChar;
 end;

 function IsNumBegin : Boolean;
 begin
  Result := (CurrentChar.IsDigit or (CurrentChar = cMinus) or (CurrentChar = '$')) and
            (f_Token = '');
 end;

 begin
  l_IsQuoteOpen := False;
  l_IsDoubleQuote := False;

  // Проверка на Boolean, и другие зарезервированные слова
  if (f_UnknownToken = 'false') or (f_UnknownToken = 'true') then
  begin
   f_Token := f_UnknownToken;
   //f_TokenType := ttBoolean;
   f_TokenType := l3_ttSymbol;
   Exit;
  end;

  try
   while f_PosInUnknown <= Length(f_UnknownToken) do
   begin
    // Начало символов
    if (CurrentChar = '#') and (not l_IsQuoteOpen) then
    begin
     f_IsSymbol := True;
     l_SymbBuffer := '';
     f_TokenType := l3_ttString;

     NextChar;
     while not ValidStringChar do
     begin
      AddCharToBuffer(CurrentChar);

      NextChar;
     end;

     AddBufferToToken;
     f_IsSymbol := False;

     Continue;
    end;

    // Начало String
    if CurrentChar = cQuote then
    begin
     l_IsQuoteOpen := not l_IsQuoteOpen;
     f_TokenType := l3_ttString;
     l_QuoteCount := 1;

     NextChar;

     // Проверка на символ полсле строки
     if IsQuoteClose and (not ValidStringChar) then
      raise EUnknownToken.Create('Error Message');

     while CurrentChar = cQuote do
     begin
      l_IsQuoteOpen := not l_IsQuoteOpen;
      Inc(l_QuoteCount);

      // Делим на три, так как ''' дают '
      if (l_QuoteCount div 3) = 1 then
      begin
       NextChar;
       Break;
      end;

      NextChar;
     end;

     // '''' and '''
     if ((l_QuoteCount div 4) = 1) or ((l_QuoteCount div 3) = 1)then
      f_Token := f_Token + cQuote;

     Continue;
    end;

    // Цифры
    if IsNumBegin then
    begin
     if TryStrToInt(f_UnknownToken, l_Number) then
     begin
      f_Token := f_UnknownToken;

      // Приведение числа в dec форму
      if (l_Number = 0) or (CurrentChar = '$') then
       f_Token := IntToStr(l_Number);

      // Если число отрицательное Hex
      if CurrentChar = cMinus then
      begin
       NextChar;
       if CurrentChar = '$' then
        raise EUnknownToken.Create('Error Message');
      end;

      f_TokenType := l3_ttInteger;
      Exit;
     end
     else
      raise EUnknownToken.Create('Error Message')
    end;

    // Идентификатор
    if (CurrentChar = cDoubleQuote) and (not l_IsQuoteOpen) then
    begin
     l_IsDoubleQuote := not l_IsDoubleQuote;

     if not l_IsDoubleQuote then
     begin
      f_TokenType := l3_ttDoubleQuotedString;
     end;
    end;

    // не включаем конец строки в токен
    if (CurrentChar <> #0) then
     f_Token := f_Token + CurrentChar;

    // Проверка на невалидный идентификатор
    if (f_TokenType = l3_ttDoubleQuotedString) and
       (f_Token <> f_UnknownToken) then
     raise EUnknownToken.Create('Error Message');

    NextChar;
   end;
  except
   f_TokenType := l3_ttUnknown;
   Exit;
  end;

  // Если кавычка не закрыта то это ttUnknown
  if l_IsQuoteOpen then
  begin
   f_TokenType := l3_ttUnknown;
   Exit
  end;

  // Финальная проверка
  if not (TokenType in [l3_ttString, l3_ttDoubleQuotedString, l3_ttInteger]) then
   f_TokenType := l3_ttSymbol;
 end; // AnalyzeToken

begin
 f_TokenType := l3_ttUnknown;
 f_UnknownToken := ReadUnknownToken;
 f_PosInUnknown := 1;
 f_Token := '';

 AnalyzeToken;

 if (f_Token <> f_UnknownToken) and
    (TokenType <> l3_ttString) and
    (TokenType <> l3_ttInteger) and
    (TokenType <> l3_ttDoubleQuotedString) then
 begin
  f_Token := f_UnknownToken;
  f_TokenType := l3_ttUnknown;
 end;

 if f_EOF then
  if f_UnknownToken = '' then
   f_TokenType := l3_ttEOF;
end;

function TNewParser.ReadUnknownToken: String;
var
 l_Buffer : String;
 l_Char : AnsiChar;

 l_IsOpenQuote,
 l_IsLineComment,
 l_IsDoubleQuoteOpen,
 l_IsBlockComment : Boolean;
begin
 l_Buffer := '';
 l_IsOpenQuote := False;
 l_IsDoubleQuoteOpen := False;
 l_IsLineComment := False;
 l_IsBlockComment := False;

 while GetChar(l_Char) do
 begin
  if (not l_IsOpenQuote) and (not l_IsDoubleQuoteOpen) then
  begin
   if l_Char = #13 then
    if GetChar(l_Char) then
     if l_Char = #10 then
     begin
      if l_IsLineComment then
       l_IsLineComment := False;

      if (Length(l_Buffer) > 0) then
       Break
      else // (Length(l_Buffer) > 0)
      Continue
     end
     else // l_Char = #10
      Assert(false, 'Not character LF after character CR')

     else // GetChar(l_Char)
      Assert(false, 'End of file, after character CR');

   if l_IsBlockComment then
   begin
    if (l_Char = cAsterics) then
     if GetChar(l_Char) then
      if (l_Char = cSlash) then
      begin
        l_IsBlockComment := False;
        Continue;
      end
      else // (l_Char = cSlash)
      begin
       GetPrevChar(l_Char);
       Continue;
      end
     else // GetChar(l_Char)
      Continue

    else // (l_Char = cAsterics)
     Continue;
   end;

   if l_IsLineComment then
    Continue;

   if l_Char in cWhiteSpace then
    if (Length(l_Buffer) > 0) then
     Break
    else // (Length(l_Buffer) > 0)
     Continue;
  end; // not l_IsOpenQute

  // Кавычка '
  if l_Char = cQuote then
   l_IsOpenQuote := not l_IsOpenQuote;

  // Двойная кавычка "
  if l_Char = cDoubleQuote then
   l_IsDoubleQuoteOpen := not l_IsDoubleQuoteOpen;

  // // and /*
  if (not l_IsOpenQuote) and (not l_IsDoubleQuoteOpen) then
  begin
   if (l_Char = cSlash) then
   begin
    if GetChar(l_Char) then
     if l_Char = cSlash then
     begin
      l_IsLineComment := True;
      Continue;
     end
     else if l_Char = cAsterics then
     begin
      l_IsBlockComment := True;
      Continue;
     end // l_Char = cAsterics
     else
      GetPrevChar(l_Char);
   end; // (l_Char = cSlash)
  end; // (not l_IsOpenQuote)

  l_Buffer := l_Buffer + l_Char;
 end;

 f_EOF := True;
 Result := l_Buffer;
end;

end.
