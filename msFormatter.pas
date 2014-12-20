unit msFormatter;

interface

type
 TmsFormatter = class
 public
  class function FormatJson(const aJson: string): string;
 end;

const
 c_Tab = #9;
 c_CRLF = #13#10;

implementation
{ TmsFormatter }
uses
 FMX.Dialogs,
 System.SysUtils;

class function TmsFormatter.FormatJson(const aJson: string): string;
var
 l_ch: Char;
 l_LevelCount: integer;
 l_IsNewLine: Boolean;
 function BuildIdent(aLevel: Integer): string;
 var
  l_Count: Integer;
 begin
  Assert(aLevel > -1);
  Result := '';

  if aLevel=0 then Exit;

  for l_Count := 1 to aLevel do
   Result := Result + c_Tab;
 end;

begin
 Assert(aJson<>'');
 result:= '';
 l_LevelCount := 0;
 l_IsNewLine := True;

 for l_ch in aJson do
 begin
  if l_IsNewLine then Result:= Result + BuildIdent(l_LevelCount);
  l_IsNewLine:= False;

  case l_ch of
   '{' :
   begin
    Result:= Result + l_ch;
    Inc(l_LevelCount);
    Result:= Result + c_CRLF;
    l_IsNewLine:= True;
   end;
   '}' :
   begin
    dec(l_LevelCount);
    Result:= Result + c_CRLF + BuildIdent(l_LevelCount) + l_ch;
   end;
   ',' :
   begin
    Result:= Result + l_ch + c_CRLF;
    l_IsNewLine:= True;
   end;
   ':' :
    Result:= Result + l_ch + ' ';
   else
     Result:= Result + l_ch;
  end;// case l_ch of
 end;// for l_ch in aJson
 Result := UTF8Encode(Result)
end;

end.
