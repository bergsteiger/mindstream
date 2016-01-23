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

procedure TScriptParser.NextChar;
begin
 Inc(f_PosInUnknown);
end;

procedure TScriptParser.NextToken;
var
 l_Token : String;
begin
 f_TokenType := ttUnknown;
 f_UnknownToken := ReadUnknownToken;

 f_Token := f_UnknownToken;

 if f_Token <> f_UnknownToken then
 begin
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
 l_IsOpenQute : Boolean;
begin
 l_Buffer := '';
 l_IsOpenQute := False;

 while GetChar(l_Char) do
 begin
  if not l_IsOpenQute then
  begin
   if l_Char in cWhiteSpace then
    if (Length(l_Buffer) > 0) then
     Break
    else
     Continue;
  end;

  if not l_IsOpenQute then
  begin
   if l_Char = #13 then
    if GetChar(l_Char) then
     if l_Char = #10 then
     begin
      if (Length(l_Buffer) > 0) then
       Break
      else
      Continue
     end
     else
      Assert(false, 'Not character LF after character CR')
     else
      Assert(false, 'End of file, after character CR');
  end;

  if l_Char = cQuote then
   l_IsOpenQute := not l_IsOpenQute;

  l_Buffer := l_Buffer + l_Char;
 end;

 f_EOF := True;
 Result := l_Buffer;
end;

end.
