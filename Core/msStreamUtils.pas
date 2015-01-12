unit msStreamUtils;

interface

uses
 System.Classes
 ;

procedure msStripHeader(aStream : TStream; aHeaderBegin : AnsiChar);

function msCompareStreams(const aStream1, aStream2: TStream; aHeaderBegin : AnsiChar = #0): Boolean;

function msCompareFiles(const aStream1, aStream2: String; aHeaderBegin : AnsiChar = #0): Boolean;

implementation

uses
 System.SysUtils,
 Math
 ;

procedure msStripHeader(aStream : TStream; aHeaderBegin : AnsiChar);
var
 l_Ch : AnsiChar;
 l_Pos : Integer;
begin
 l_Pos := 0;
 with aStream do
 begin
  while (Position < Size) do
  begin
   Read(l_Ch, 1);
   if (l_Ch <> aHeaderBegin) then
    break;
   while (Position < Size) and (l_Ch <> #10) do
    Read(l_Ch, 1);
   l_Pos := Position;
  end;//Position < Size
  Position := l_Pos;
 end;//with aStream
end;

function msCompareStreams(const aStream1, aStream2: TStream; aHeaderBegin : AnsiChar = #0): Boolean;
 //overload;
 {* - сравнивает побайтово два потока. }
const
 l3ParseBufSize = 1024 * 1024;
var
 l_Size  : Integer;
 l_Read  : Integer;
 l_Buff1 : PAnsiChar;
 l_Buff2 : PAnsiChar;
begin
 if (aStream1 = aStream2) then
  Result := true
 else
 begin
  if (aHeaderBegin <> #0) then
  begin
   msStripHeader(aStream1, aHeaderBegin);
   msStripHeader(aStream2, aHeaderBegin);
  end;//aHeaderBegin <> #0
  Result := false;
  if (aStream1 <> nil) AND (aStream2 <> nil) then
  begin
   l_Size := aStream1.Size - aStream1.Position;
   if (l_Size = aStream2.Size - aStream2.Position) then
   begin
    if (l_Size > 0) then
    begin
     l_Size := Min(l_Size, l3ParseBufSize);
     GetMem(l_Buff1, l_Size);
     try
      GetMem(l_Buff2, l_Size);
      try
       while true do
       begin
        l_Read := aStream1.Read(l_Buff1^, l_Size);
        if (l_Read <> aStream2.Read(l_Buff2^, l_Size)) then
         Exit; // - что-то не то с длинной
        if (l_Read = 0) then
        begin
         // - закончили читать
         Result := true;
         break;
        end;//l_Read = 0
        if not CompareMem(l_Buff1, l_Buff2, l_Size) then
         break;
         // - содержимое различается
       end;//while true
      finally
       FreeMem(l_Buff2);
      end;//try..finally
     finally
      FreeMem(l_Buff1);
     end;//try..finally
    end//l_Size > 0
    else
     Result := true;
   end;//l_Size = aStream2.Size
  end;//aStream1 <> nil
 end;//aStream1 = aStream2
end;

function msCompareFiles(const aStream1, aStream2: String; aHeaderBegin : AnsiChar = #0): Boolean;
 {* - сравнивает побайтово два файла. }
var
 l_S1 : TStream;
 l_S2 : TStream;
begin
 l_S1 := TFileStream.Create(aStream1, fmOpenRead);
 try
  l_S2 := TFileStream.Create(aStream2, fmOpenRead);
  try
   Result := msCompareStreams(l_S1, l_S2, aHeaderBegin);
  finally
   FreeAndNil(l_S2);
  end;//try..finally
 finally
  FreeAndNil(l_S1);
 end;//try..finally
end;

end.

