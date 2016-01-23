unit uNewParser;
interface

uses
 Classes
 ,SysUtils
 ;

type
 TscriptTokenType = (ttUnknown, ttString, ttToken, ttEOF, ttBoolean);

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
begin

end;

function TScriptParser.ReadUnknownToken: String;
begin

end;

end.
