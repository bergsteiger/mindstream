unit msCoreUtils;

interface

procedure msSwap(var A: Extended; var B: Extended); overload;
procedure msSwap(var A: Single; var B: Single); overload;
procedure msSwap(var A: Integer; var B: Integer); overload;

implementation

procedure msSwap(var A: Extended; var B: Extended);
var
 l_Temp : Extended;
begin
 l_Temp := A;
 A := B;
 B := l_Temp;
end;

procedure msSwap(var A: Single; var B: Single);
var
 l_Temp : Single;
begin
 l_Temp := A;
 A := B;
 B := l_Temp;
end;

procedure msSwap(var A: Integer; var B: Integer);
var
 l_Temp : Integer;
begin
 l_Temp := A;
 A := B;
 B := l_Temp;
end;

end.
