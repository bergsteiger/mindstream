unit Script.Parser;

interface

uses
 Classes,
 Core.Obj,
 Script.Interfaces
 ;

{$IfNDef NoTesting}
 {$Define TestParser}
{$EndIf  NoTesting}

type
 TscriptParser = class(TCoreObject)
  private
   f_Stream : TStream;
   f_EOF : Boolean;
   f_CurrentLine : String;
   f_PosInCurrentLine : Integer;
   f_Token : String;
   f_TokenType : TscriptTokenType;
   f_CurrentLineNumber : Integer;
  protected
   procedure Cleanup; override;
   function ReadLn: String;
  protected
   function GetChar(out aChar: AnsiChar): Boolean;
  public
   constructor Create(const aStream : TStream); overload;
   constructor Create(const aFileName : String); overload;
   class function Make(const aFileName : String): IscriptParser;
    {* - Фабрика интерфейса IscriptParser. }
   function EOF: Boolean;
    {* - Достигнут конец входного потока. }
   procedure NextToken;
    {* - Выбрать следующий токен из входного потока. }
  public
   property TokenString: String
    read f_Token;
    {* - текущий токен. }
   property TokenType: TscriptTokenType
    read f_TokenType;
    {* - тип текущего токена. }
 end;//TscriptParser

implementation

uses
 System.SysUtils
 {$IfDef TestParser}
 ,
 Testing.Engine
 {$EndIf TestParser}
 ;

type
 TscriptParserContainer = class(TCoreInterfacedObject, IscriptParser)
  private
   f_Parser : TscriptParser;
  private
   function Get_TokenType: TscriptTokenType;
   function Get_TokenString: String;
   function Get_CurrentLineNumber: Integer;
   procedure NextToken;
    {* - Выбрать следующий токен из входного потока. }
  protected
   procedure Cleanup; override;
  public
   constructor Create(aParser: TscriptParser);
   class function Make(aParser: TscriptParser): IscriptParser;
 end;//TscriptParserContainer

constructor TscriptParserContainer.Create(aParser: TscriptParser);
begin
 Assert(aParser <> nil);
 inherited Create;
 f_Parser := aParser;
end;

class function TscriptParserContainer.Make(aParser: TscriptParser): IscriptParser;
begin
 Result := TscriptParserContainer.Create(aParser);
end;

procedure TscriptParserContainer.Cleanup;
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
 {* - Выбрать следующий токен из входного потока. }
begin
 f_Parser.NextToken;
end;

// TscriptParser

constructor TscriptParser.Create(const aStream : TStream);
begin
 inherited Create;
 f_PosInCurrentLine := 1;
 f_EOF := false;
 f_Stream := aStream;
end;

constructor TscriptParser.Create(const aFileName : String);
var
 l_FileName : String;
begin
 l_FileName := aFileName;
 if (ExtractFilePath(l_FileName) = '') then
  l_FileName := ExtractFilePath(ParamStr(0)) + '\' + l_FileName;
 Create(TFileStream.Create(l_FileName, fmOpenRead));
end;

class function TscriptParser.Make(const aFileName : String): IscriptParser;
 {* - Фабрика интерфейса IscriptParser. }
begin
 Result := TscriptParserContainer.Make(Self.Create(aFileName));
end;

procedure TscriptParser.Cleanup;
begin
 FreeAndNil(f_Stream);
 inherited;
end;

function TscriptParser.GetChar(out aChar: AnsiChar): Boolean;
begin
 if (f_Stream.Read(aChar, SizeOf(aChar)) = SizeOf(aChar)) then
 begin
  Result := true;
  {$IfDef TestParser}
  TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'GetChar')).PutValue(aChar);
  // - снимаем показания с текущей контрольной точки
  {$EndIf TestParser}
 end
 else
  Result := false;
end;

function TscriptParser.ReadLn: String;
{$IfDef TestParser}
var
 l_Result : AnsiString;
{$EndIf TestParser}
var
 l_Char : AnsiChar;
 l_Line : String;
 l_LineCommentPos : Integer;
begin
 Inc(f_CurrentLineNumber);
 {$IfDef TestParser}
 try
 {$EndIf TestParser}
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
      end//l_Char = #10
      else
       Assert(false, 'Что-то пошло не так, после символа 13 нет символа 10');
     end//GetChar(l_Char)
     else
      Assert(false, 'Что-то пошло не так, после символа 13 сразу конец файла');
    end;//l_Char = #13
    l_Line := l_Line + l_Char;
   end;//while GetChar(l_Char)
   f_EOF := true;
   Result := l_Line;
  finally
   l_LineCommentPos := Pos('//', Result);
   if (l_LineCommentPos > 0) then
   begin
    Delete(Result, l_LineCommentPos, Length(Result) - l_LineCommentPos + 1);
   end;//l_LineCommentPos > 0
  end;//try..finally
 {$IfDef TestParser}
 finally
  TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'ReadLn')).PutValue(Result);
  // - снимаем показания с текущей контрольной точки
 end;//try..finally
 {$EndIf TestParser}
end;

procedure TscriptParser.NextToken;
const
 cQuote = #39;
 cWhiteSpace = [#32,#9];
begin
 f_TokenType := script_ttUnknown;
 f_Token := '';
 try
  while true do
  begin
   if (f_PosInCurrentLine >= Length(f_CurrentLine)) then
   begin
    // - Типа текущая строка ВСЯ обработана
    f_CurrentLine := '';
    f_PosInCurrentLine := 1;
   end;//f_PosInCurrentLine > Length(f_CurrentLine)
   while(f_CurrentLine = '') do
   begin
    f_CurrentLine := ReadLn;
    if (f_CurrentLine = '') then
     if f_EOF then
      Exit;
   end;//while(f_NextToken = '')
   // Тут пропускаем пустые символы:
   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace) then
     Inc(f_PosInCurrentLine)
    else
     break;
   if (f_PosInCurrentLine <= Length(f_CurrentLine)) then
    break;
  end;//while true

  // Тут накапливаем НЕ пустые символы:
  if (f_CurrentLine[f_PosInCurrentLine] = cQuote) then
  begin
   f_TokenType := script_ttString;
   Inc(f_PosInCurrentLine);
   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if (f_CurrentLine[f_PosInCurrentLine] <> cQuote) then
    begin
     f_Token := f_Token + f_CurrentLine[f_PosInCurrentLine];
     Inc(f_PosInCurrentLine);
    end//not (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)
    else
    begin
     Inc(f_PosInCurrentLine);
     break;
    end;//f_CurrentLine[f_PosInCurrentLine] <> cQuote
  end//f_CurrentLine[f_PosInCurrentLine] = ''
  else
  begin
   f_TokenType := script_ttToken;
   while (f_PosInCurrentLine <= Length(f_CurrentLine)) do
    if (not (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)) then
    begin
     f_Token := f_Token + f_CurrentLine[f_PosInCurrentLine];
     Inc(f_PosInCurrentLine);
    end//not (f_CurrentLine[f_PosInCurrentLine] in cWhiteSpace)
    else
     break;
  end;//else
  //f_CurrentLine := '';
 finally
  if (Self.f_TokenType = script_ttUnknown) then
   if Self.EOF then
    f_TokenType := script_ttEOF;
  {$IfDef TestParser}
  case f_TokenType of
   script_ttEOF:
    TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'NextToken')).PutValue('Конец файла');
   script_ttString:
    TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'NextToken')).PutValue('Single quoted string:');
   script_ttToken:
    // - ничего не делаем
    ;
   else
    Assert(false, 'Что-то пошло не так');
  end;//case f_TokenType
  TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'NextToken')).PutValue(f_Token);
  // - снимаем показания с текущей контрольной точки
  {$EndIf TestParser}
 end;//try..finally
end;

function TscriptParser.EOF: Boolean;
begin
 Result := f_EOF AND (f_CurrentLine = '');
end;

end.
