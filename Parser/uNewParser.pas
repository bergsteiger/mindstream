unit uNewParser;
interface

uses
 Classes
 ,SysUtils
 ;

type
 TscriptTokenType = (ttUnknown, ttString, ttToken, ttEOF, ttBoolean);

Const
 cQuote = #39;
 cTab = #9;
 cSpace = #32;
 cCRLF = #13#10;
 cWhiteSpace = [cSpace, cTab];
 cDoubleQuote = #35;
 cSlash = '/';
 cAsterics = '*';
 cLeftBracket = '{';
 cRightBracket = '}';

type
 TScriptParser = class
 private
  f_Stream: TStream;
  f_EOF: Boolean;
  f_UnknownToken: String;
  f_PosInUnknown: Integer;
  f_Token: String;
  f_TokenType: TscriptTokenType;
  {f_IsBlockComment: Boolean;
  f_IsString : Boolean;
  f_IsSymbol : Boolean;}
 procedure NextChar;
 // Увеличивает f_PosInCurrentToken на 1
 procedure GoToPrevCharPos(const aChar: AnsiChar);
 function CurrentCharInBuffer : Char;
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
  property TokenType: TscriptTokenType read f_TokenType;
  { * - тип текущего токена. }
 end; // TscriptParser

implementation

uses
 System.Character
 ;

{ TScriptParser }

constructor TScriptParser.Create(const aStream: TStream);
begin
 inherited Create;
 f_PosInUnknown := 1;
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

function TScriptParser.CurrentCharInBuffer: Char;
begin
 Result := f_UnknownToken[f_PosInUnknown];
end;

destructor TScriptParser.Destroy;
begin
 FreeAndNil(f_Stream);
 inherited;
end;

function TScriptParser.EOF: Boolean;
begin
 Result := f_EOF AND (f_UnknownToken = '');
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

procedure TScriptParser.GoToPrevCharPos(const aChar: AnsiChar);
begin
 f_Stream.Position := f_Stream.Position - SizeOf(aChar) - SizeOf(aChar);
end;

procedure TScriptParser.NextChar;
begin
 Inc(f_PosInUnknown);
end;

procedure TScriptParser.NextToken;
var
 l_Token : String;

procedure AnalyzeToken;
var
 l_IsQuoteOpen : Boolean;
begin
 l_IsQuoteOpen := False;

 while f_PosInUnknown <= Length(f_UnknownToken) do
 begin
  // Заглушка
  if (CurrentCharInBuffer = cSlash) or
     (CurrentCharInBuffer = '#') then
   Exit;

  if CurrentCharInBuffer = cQuote then
   l_IsQuoteOpen := not l_IsQuoteOpen;

  f_Token := f_Token + CurrentCharInBuffer;
  NextChar;
 end;

 // Если кавычка не закрыта то это ttUnknown
 if l_IsQuoteOpen then
  Exit
 else
  f_TokenType := ttToken;
end; // AnalyzeToken

begin
 f_TokenType := ttUnknown;
 f_UnknownToken := ReadUnknownToken;
 f_PosInUnknown := 1;
 f_Token := '';

 AnalyzeToken;

 if f_Token <> f_UnknownToken then
 begin
  f_Token := f_UnknownToken;
  f_TokenType := ttUnknown;
 end;

 if f_EOF then
  if f_UnknownToken = '' then
   f_TokenType := ttEOF;
end;

function TScriptParser.ReadUnknownToken: String;
var
 l_Buffer : String;
 l_Char : AnsiChar;

 l_IsOpenQuote,
 l_IsLineComment,
 l_IsBlockComment : Boolean;
begin
 l_Buffer := '';
 l_IsOpenQuote := False;
 l_IsLineComment := False;
 l_IsBlockComment := False;

 while GetChar(l_Char) do
 begin
  if not l_IsOpenQuote then
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
       GoToPrevCharPos(l_Char);
       GetChar(l_Char);
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

  // Кавычка
  if l_Char = cQuote then
   l_IsOpenQuote := not l_IsOpenQuote;

  // // and /*
  if (not l_IsOpenQuote) then
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
     end
     else
     begin
      GoToPrevCharPos(l_Char);
      GetChar(l_Char);
     end;
   end;
  end;

  l_Buffer := l_Buffer + l_Char;
 end;

 f_EOF := True;
 Result := l_Buffer;
end;

end.
