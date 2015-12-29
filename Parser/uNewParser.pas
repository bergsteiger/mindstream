unit uNewParser;

interface

uses
  Classes;

type
  TTokenType = (ttUnknown, ttToken, ttString, ttStringComment, ttBoolean, ttNumber, ttIdent);

type
  TNewParser = class
  private
    f_Stream: TFileStream;
    f_EOF: Boolean;
    f_CurrentLine: String;
    f_PosInCurrentLine: integer;
  public
    function GetChar(out aChar: AnsiChar) : boolean;
    constructor Create(const aStream: TFileStream); overload;
    constructor Create(const aFileName: String); overload;
    destructor Destroy; override;
    function EOF: Boolean;
    { * - Достигнут конец входного потока. }
  end; // TNewParser

implementation

uses
  System.SysUtils;

{ TNewParser }

constructor TNewParser.Create(const aStream: TFileStream);
begin
  inherited Create;
  f_PosInCurrentLine := 1;
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

destructor TNewParser.Destroy;
begin
  FreeAndNil(f_Stream);
  inherited;
end;

function TNewParser.EOF: Boolean;
begin
  Result := f_EOF AND (f_CurrentLine = '');
end;

function TNewParser.GetChar(out aChar: AnsiChar): boolean;
begin
  Result := False;
end;

end.
