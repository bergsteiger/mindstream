unit l3Utils;
{* Сервисные функции библиотеки L3. }

{ Библиотека "Эверест" }
{ Автор: Люлин А.В.    }
{ Модуль: l3Utils - описание оптимизированных утилит работы с памятью}
{ DLL: l3Utils.dll (*) }
{ Начат: 12.12.1996    }
{ $Id: l3Utils.pas,v 1.38 2015/04/14 14:02:28 lulin Exp $ }

// $Log: l3Utils.pas,v $
// Revision 1.38  2015/04/14 14:02:28  lulin
// - перерисовываем.
//
// Revision 1.37  2014/10/29 13:05:57  lukyanets
// Ставим сообщение в очередь
//
// Revision 1.36  2014/10/13 06:49:51  lukyanets
// Переносим функции на более низкий уровень
//
// Revision 1.35  2014/03/06 08:47:56  dinishev
// {Requestlink:518433388}
//
// Revision 1.34  2013/03/28 15:09:44  lulin
// - портируем.
//
// Revision 1.33  2013/03/28 14:03:17  lulin
// - портируем.
//
// Revision 1.32  2012/04/20 14:59:00  lulin
// {RequestLink:283610570}
//
// Revision 1.31  2012/03/27 14:42:33  lulin
// - выделяем общую часть.
//
// Revision 1.30  2011/11/16 08:36:37  fireton
// - выкидываем l3GetClipboardByFormatName из консольных приложений
//
// Revision 1.29  2011/11/15 09:38:52  lulin
// - вставляем костыль к неправильной зависимости.
//
// Revision 1.28  2011/11/14 14:04:48  lulin
// {RequestLink:297712959}
//
// Revision 1.27  2010/04/26 12:10:53  lulin
// {RequestLink:206504616}.
// - перерисовал диаграмму.
// - спрятал локальные процедуры.
//
// Revision 1.26  2009/04/28 06:50:34  voba
// - function l3IsWordDelim переехали в l3String
//
// Revision 1.25  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.24  2007/03/16 14:47:31  lulin
// - cleanup.
//
// Revision 1.23  2006/12/10 12:58:25  lulin
// - удалены ненужные процедуры.
//
// Revision 1.22  2005/08/25 05:33:58  mmorozov
// new: полезные функции для работы с Tl3Bool;
//
// Revision 1.21  2004/05/12 12:33:47  law
// - bug fix: поправлена нарезка на строки Unicode-параграфов.
//
// Revision 1.20  2004/05/12 12:05:52  law
// - bug fix: исправлена недоделка со вставкой строки в Unicode-строки.
//
// Revision 1.19  2004/05/11 16:54:13  law
// - bug fix: поправлена недоделка с удалением символов из Unicode-строк.
//
// Revision 1.18  2004/04/21 10:58:35  law
// - cleanup: из l3String вычистил все, что относилось к Win16.
//
// Revision 1.17  2004/04/19 13:31:05  law
// - bug fix: боремся с неправильным форматированием Unicode-строк.
//
// Revision 1.16  2003/06/16 15:51:18  law
// - new behavior: изменена логика l3IsWordDelim (попытка оптимизации по времени).
//
// Revision 1.15  2003/04/15 13:45:02  law
// - change: код модуля l3List перенесен в l3Base.
//
// Revision 1.14  2002/07/29 10:44:53  law
// - new bahavior: добавлен еще один разделитель.
//
// Revision 1.13  2002/04/15 12:19:32  law
// - new behavior: изменена логика l3IsWordDelim.
//
// Revision 1.12  2002/03/21 12:11:00  law
// - new behavior: добавлены еще разделители слов.
//
// Revision 1.11  2002/03/12 09:32:19  law
// - new behavior: l3IsWordDelim еще несколько символов определяет как разделители слов.
//
// Revision 1.10  2002/03/07 08:40:47  law
// - new behavior: добавлено еще два разделителя.
//
// Revision 1.9  2002/03/06 14:54:37  law
// - new behavior: немного изменена функция определения разделителя.
//
// Revision 1.8  2002/02/20 15:42:44  law
// - new behavior: '_' теперь тоже разделитель слов.
//
// Revision 1.7  2002/02/11 16:24:10  law
// - rename proc: evIsWordDelim -> l3IsWordDelim.
//
// Revision 1.6  2002/02/11 13:40:03  law
// - new behavior: изменен алгоритм перенесения слов по слогам.
//
// Revision 1.5  2002/02/05 15:40:16  law
// - bug fix: переносы в таблицах (..\Everest\_TestSet\Export\NSRC\2.evd).
//
// Revision 1.4  2001/08/31 08:50:08  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.3  2001/08/29 15:36:27  law
// - cleanup: удалены ненужные зависимости от Orpheus и SysTools.
//
// Revision 1.2  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.1  2001/08/28 12:55:13  law
// - rename unit: evUtils -> l3Utils.
//
// Revision 1.12  2001/04/12 13:17:24  law
// - new behavior: добавлено имя для формата _cf_hDrop.
//
// Revision 1.11  2001/04/05 09:13:46  law
// - cleanup: убраны ненужные процедуры, оставшиеся от 16-ти битной платформы.
//
// Revision 1.10  2001/04/05 08:57:36  law
// - cleanup: использование модулей WinTypes и WinProcs заменен на Windows.
//
// Revision 1.9  2001/02/02 15:23:41  voba
// - bug fix: учитывается кодировка CP_OEMLite как CP_OEM.
//
// Revision 1.8  2000/12/15 15:10:33  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  Windows,
  SysUtils,
  
  l3Types
  ;


function  l3MakeWord(Lo, Hi: sInt8): Word;
  {* - делает Word из двух байтов. }

function  l3FindNextLine(const aStr : Tl3PCharLen; WrapCol : Integer; anIgnoreSemicolon: Integer = 0): Integer;
  {* - находит следующую строку в строковом буфере. }

(*procedure l3DeleteSubString(S : PAnsiChar; SLen, Count, Pos : Integer);
  {* - Delete Cound characters from S starting at Pos. }
  {-Заимствовано из OvcEditU - edDeleteSubString}

procedure l3DeleteSubStringW(S : PWideChar; SLen, Count, Pos : Integer);
  {-}*)

function l3PadChPrim(S : PAnsiChar; C : Char; Len : Integer) : PAnsiChar;
  {* - Return S padded with C to length Len. }
  {-Заимствовано из OvcEditU - edPadChPrim}

function l3PadChPrimW(S : PWideChar; C : WideChar; Len : Integer): PWideChar;
  {-}

function l3PadPrim(S : PAnsiChar; Len : Integer) : PAnsiChar;
  {* - Return a string right-padded to length len with blanks. }
  {-Заимствовано из OvcEditU - edPadPrim}
function l3PadPrimW(S : PWideChar; Len : Integer) : PWideChar;
  {-}

function l3UpdateInsertion(Pos, InsPos, InsLen: Long; First: Bool): Long;
  {* - возвращет значение Pos после вставки InsLen в позицию InsPos. }

function l3UpdateDeletion(Pos, DelPos, DelLen: Long; First: Bool): Long;
  {* - возвращет значение Pos после удаления DelLen с позиции DelPos. }

function l3ScanToEnd(P : PAnsiChar; Len : Word) : Word;
  {* - Return position of end of para P. }

function l3ClipboardFormatName(aFormat: Tl3ClipboardFormat): string;
  {* - возвращает название формата буфера обмена. }

{$IfNDef nsTool}
{$IfNDef l3ConsoleApp}
function l3GetClipboardByFormatName(const aName : String): Cardinal;
  {* - возвращает формата буфера обмена по его названию. }
{$EndIf l3ConsoleApp}
{$EndIf nsTool}  

procedure l3FillStruct(var Dest; Count : Cardinal; var Filler; FillerSize : Cardinal);
  {* - fill memory with a variable sized filler. }

function l3BoolCheck(aValue : Tl3Bool; out theValue: Boolean): Boolean;
  {* - проверяет определена ли aValue, если определена, то в theValue возвращает
       значение. }

function l3BoolSet(const aValue : Boolean; out theValue: Tl3Bool): Boolean;
  {* - устанавливает значение для theValue. }

procedure l3BoolReset(out theValue: Tl3Bool);
  {* - сбрасывает значение theValue. }

function l3Encrypt(const aText: AnsiString): AnsiString;
  {* - шифрует пароль. }
function l3Decrypt(const aText: AnsiString): AnsiString;
  {* - расшифровывает пароль. }

function l3CreateStringGUID: String;
  {* - Сделать GUID в виде строки. }

implementation

uses
  l3Chars,
  l3Base

  {$IfNDef nsTool}
  {$IfDef l3ConsoleApp}
  {$Else  l3ConsoleApp}
  ,
  evTypes,

  Forms
  {$EndIf l3ConsoleApp}
  {$EndIf  nsTool}
  ;

procedure l3BoolReset(out theValue: Tl3Bool);
  {* - сбрасывает значение theValue. }
begin
 theValue := l3_bUnknown;
end;

function l3BoolSet(const aValue : Boolean; out theValue: Tl3Bool): Boolean;
  {* - устанавливает значение для theValue. }
begin
 Result := aValue;
 if Result then
  theValue := l3_bTrue
 else
  theValue := l3_bFalse;
end;

function l3BoolCheck(aValue : Tl3Bool; out theValue: Boolean): Boolean;
  {* - проверяет определена ли aValue, если определена, то в theValue возвращает
       значение. }
begin
 if (aValue = l3_bUnknown) then
  Result := false
 else
 begin
  Result := true;
  theValue := (aValue = l3_bTrue);
 end;//aValue = l3_bUnknown
end;

function l3ScanToEnd(P : PAnsiChar; Len : Word) : Word;
  register;
  {-return position of end of para P}
asm
  push   edi            {save}
  push   ebx            {save}

  mov    edi,eax        {edi = P}
  mov    ebx,edi        {save edi}
  mov    ecx,edx        {ecx = Len}
  and    ecx,0FFFFh     {clear high word}
  mov    edx,ecx        {default for exit}
  mov    al, 0Ah
  cld
  jecxz  @@9
  repne  scasb
  jne    @@9
  mov    edx,edi
  sub    edx,ebx        {find difference}
@@9:
  mov    eax,edx

  pop    ebx            {restore}
  pop    edi            {restore}
end;

(*procedure l3DeleteSubString(S : PAnsiChar; SLen, Count, Pos : Integer);
  {-Delete Cound characters from S starting at Pos}
begin
 l3Move(S[Pos + Count], S[Pos], (SLen+1)-(Pos+Count));
end;

procedure l3DeleteSubStringW(S : PWideChar; SLen, Count, Pos : Integer);
  {-Delete Cound characters from S starting at Pos}
begin
 l3Move(S[Pos + Count], S[Pos], ((SLen+1)-(Pos+Count)) * SizeOf(WideChar));
end;*)

function l3UpdateDeletion(Pos, DelPos, DelLen: Long; First: Bool): Long;
  {-возвращет значение Pos после удаления DelLen с позиции DelPos}
begin
 Result := Pos;
 if (Result + Ord(not First) > DelPos) then begin
  if (Result + Ord(not First) < DelPos + DelLen) then
   Result := DelPos-Ord(not First)
  else
   Dec(Result, DelLen);
 end
end;

function l3UpdateInsertion(Pos, InsPos, InsLen: Long; First: Bool): Long;
  {-возвращет значение Pos после вставки InsLen в позицию InsPos}
begin
 if (Pos >= InsPos + Ord(First)) then begin
  Inc(Pos, InsLen);
 end;{Pos >= InsPos}
 Result := Pos;
end;

function l3PadChPrim(S : PAnsiChar; C : Char; Len : Integer) : PAnsiChar;
register;
  {-return S padded with C to length Len}
asm
  push   esi            {save}
  push   edi            {save}
  push   ebx            {save}

  mov    edi,eax        {edi = S}
  mov    esi,eax        {esi = S}
  mov    ebx,ecx        {save Len}

  cld
  xor    eax, eax        {null}
  or     ecx, -1
  repne  scasb           {find null terminator}
  not    ecx             {calc length of S}
  dec    ecx             {backup one character}
  dec    edi
  mov    eax,ebx         {eax = Len}
  sub    eax,ecx         {find difference}
  jbe    @@ExitPoint     {nothing to do}
  mov    ecx,eax         {count of character to add}
  mov    al,dl           {al=C}
  rep    stosb           {add ecx characters}

@@ExitPoint:
  mov    byte ptr [edi],0
  mov    eax,esi

  pop    ebx            {restore}
  pop    edi            {restore}
  pop    esi            {restore}
end;

function l3PadChPrimW(S : PWideChar; C : WideChar; Len : Integer) : PWideChar;
  {-}
register;
  {-return S padded with C to length Len}
asm
  push   esi            {save}
  push   edi            {save}
  push   ebx            {save}

  mov    edi,eax        {edi = S}
  mov    esi,eax        {esi = S}
  mov    ebx,ecx        {save Len}

  cld
  xor    eax, eax        {null}
  or     ecx, -1
  repne  scasw           {find null terminator}
  not    ecx             {calc length of S}
  dec    ecx             {backup one character}
  dec    edi
  mov    eax,ebx         {eax = Len}
  sub    eax,ecx         {find difference}
  jbe    @@ExitPoint     {nothing to do}
  mov    ecx,eax         {count of character to add}
  mov    ax,dx           {al=C}
  rep    stosw           {add ecx characters}

@@ExitPoint:
  mov    word ptr [edi],0
  mov    eax,esi

  pop    ebx            {restore}
  pop    edi            {restore}
  pop    esi            {restore}
end;

function l3PadPrim(S : PAnsiChar; Len : Integer) : PAnsiChar;
  {-Return a string right-padded to length len with blanks}
begin
  Result := l3PadChPrim(S, #32, Len);
end;

function l3PadPrimW(S : PWideChar; Len : Integer) : PWideChar;
  {-}
begin
  Result := l3PadChPrimW(S, #32, Len);
end;

function l3MakeWord(Lo, Hi: sInt8): Word;
  {-}
begin
 Tl3MakeWord(Result).Lo := Lo;
 Tl3MakeWord(Result).Hi := Hi;
end;

function _l3FindNextLine(S : PAnsiChar; WrapCol : Integer; anIgnoreSemicolon: Integer) : PAnsiChar; register;
  {-find the start of the next line}
asm
  push   esi            {save}
  push   edi            {save}
  push   ebx            {save}

  mov    ebx,ecx        {save anIgnoreSemicolon}
  mov    esi,eax        {esi = S}
  mov    ecx,edx        {ecx = WrapCol}
  add    esi,ecx        {point to default wrap point}
  mov    edi,esi        {save esi in edi}

  std                   {go backward}
  inc    ecx
  cmp    byte ptr [esi],0 {is default wrap point a null?}
  jne    @@1
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@1:
  lodsb                 {next byte into al}
  cmp    al, cc_Hyphen  {is it a hyphen?}
  ja     @@2
//  je     @@3            {&&& !!! &&&}
  {&&&}
  cmp    al, cc_SoftEnter
  je     @@3
  {je @4}
  {&&&}
  cmp    al,' '         {is it a space?}
  je     @@4
  cmp    al,9           {is it a tab?}
  je     @@4

@@2:
  loop   @@1            {try previous character}
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@3:
  inc    esi            {skip the hyphen}

@@4:
  cld                   {clear direction flag}
  inc    esi            {point to next character}

@@5:
  lodsb                 {next character into al}
  cmp    bl, 1
  jne    @@9
  cmp    al, ';'
  je     @@4
@@9:
  cmp    al,' '         {is it > than a space?}
  ja     @@6            {if so, we're done}
  je     @@5            {if it's a space, keep going}
  cmp    al,9           {if it's a tab, keep going}
  je     @@5            {otherwise, we're done}

@@6:
  dec    esi            {point to previous character}
  mov    eax,esi        {wrap point in eax}

@@7:
  pop    ebx            {restore}
  pop    edi            {restore}
  pop    esi            {restore}
  cld                   {clear direction flag}
end;

function _l3FindNextLineW(S : PWideChar; WrapCol : Integer; anIgnoreSemicolon: Integer) : PWideChar; register;
  {-find the start of the next line}
asm
  push   esi            {save}
  push   edi            {save}
  push   ebx            {save}

  mov    ebx,ecx        {save anIgnoreSemicolon}
  mov    esi,eax        {esi = S}
  mov    ecx,edx        {ecx = WrapCol}
  shl    ecx, 1
  add    esi,ecx        {point to default wrap point}
  mov    ecx,edx        {ecx = WrapCol}
  mov    edi,esi        {save esi in edi}

  std                   {go backward}
  inc    ecx
  cmp    word ptr [esi],0 {is default wrap point a null?}
  jne    @@1
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@1:
  lodsw                 {next byte into al}
  cmp    ax, cc_Hyphen  {is it a hyphen?}
  ja     @@2
//  je     @@3            {&&& !!! &&&}
  {&&&}
  cmp    ax, cc_SoftEnter
  je     @@3
  {je @4}
  {&&&}
  cmp    ax,' '         {is it a space?}
  je     @@4
  cmp    ax,9           {is it a tab?}
  je     @@4

@@2:
  loop   @@1            {try previous character}
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@3:
  add    esi, 2         {skip the hyphen}

@@4:
  cld                   {clear direction flag}
  add    esi, 2         {point to next character}

@@5:
  lodsw                 {next character into al}
  cmp    bl, 1
  jne    @@9
  cmp    ax, ';'
  je     @@4
@@9:
  cmp    ax,' '         {is it > than a space?}
  ja     @@6            {if so, we're done}
  je     @@5            {if it's a space, keep going}
  cmp    ax,9           {if it's a tab, keep going}
  je     @@5            {otherwise, we're done}

@@6:
  sub    esi, 2         {point to previous character}
  mov    eax,esi        {wrap point in eax}

@@7:
  pop    ebx            {restore}
  pop    edi            {restore}
  pop    esi            {restore}
  cld                   {clear direction flag}
end;

function l3FindNextLine(const aStr : Tl3PCharLen; WrapCol : Integer; anIgnoreSemicolon: Integer = 0): Integer;
  {* - находит следующую строку в строковом буфере. }
begin
 if (aStr.SCodePage = CP_Unicode) then
  // - пока по-тупому - вообще-то надо анализировать не разрываем ли мы слово
  Result := _l3FindNextLineW(PWideChar(aStr.S), WrapCol, anIgnoreSemicolon) - PWideChar(aStr.S)
 else
  Result := _l3FindNextLine(aStr.S, WrapCol, anIgnoreSemicolon) - aStr.S;
end;

function l3ClipboardFormatName(aFormat: Tl3ClipboardFormat): string;
var
  Buffer: array[0..255] of Char;
begin
  SetString(Result, Buffer, GetClipboardFormatName(aFormat, Buffer, 255));
  if (Result = EmptyStr) then
    case aFormat of
      CF_BITMAP: Result := 'Bitmap';
      CF_DIB: Result := 'DIB Bitmap';
      CF_DIF: Result := 'DIF';
      CF_METAFILEPICT: Result := 'Metafile Picture';
      CF_ENHMETAFILE: Result := 'Enchanced Metafile';
      CF_OEMTEXT: Result := 'OEM Text';
      CF_PALETTE: Result := 'Palette';
      CF_PENDATA: Result := 'Pen Data';
      CF_RIFF: Result := 'RIFF File';
      CF_SYLK: Result := 'SYLK';
      CF_TEXT: Result := 'Text';
      CF_TIFF: Result := 'Tag Image';
      CF_WAVE: Result := 'Wave';
      CF_Locale: Result := 'Locale';
      CF_UnicodeText: Result := 'Unicode Text';
      CF_hDrop : Result := 'Explorer Files';
    end;
end;

{$IfNDef nsTool}
{$IfDef l3ConsoleApp}
{$Else  l3ConsoleApp}
function l3GetClipboardByFormatName(const aName : String): Cardinal;
  {* - возвращает формата буфера обмена по его названию. }
var
 l_Format     : Tl3ClipboardFormat;
 l_FormatName : string;
begin
 Result := 0;
 if (Screen.ActiveCustomForm <> nil) then
  OpenClipboard(Screen.ActiveCustomForm.Handle)
 else
 if (Screen.ActiveForm <> nil) then
  OpenClipboard(Screen.ActiveForm.Handle)
 else
  Assert(false, 'Нет активной формы'); 
 try
  l_Format := 0;
  repeat
   l_Format := EnumClipboardFormats(l_Format);
   if (l_Format = 0) then
    Break
   else
   begin
    l_FormatName := l3ClipboardFormatName(l_Format);
    if (l_FormatName <> EmptyStr) then
     if (l_FormatName = aName) then
     begin
      Result := l_Format;
      Exit;
     end;//l_FormatName = aName
    if (l_Format = cf_RTF) then
    begin
     l_FormatName := l3ClipboardFormatName(cf_RTFLite);
     if (l_FormatName <> EmptyStr) then
      if (l_FormatName = aName) then
      begin
       Result := cf_RTFLite;
       Exit;
      end;//l_FormatName = aName
    end;//l_Format = cf_RTF
   end;//l_Format = 0
  until False;
 finally
  CloseClipboard;
 end;//try..finally
end;
{$EndIf l3ConsoleApp}
{$EndIf nsTool}

procedure l3FillStruct(var Dest; Count : Cardinal; var Filler; FillerSize : Cardinal);
  register;
  {-}
asm
  or   edx, edx
  jz   @@Exit

  push edi
  push esi
  push ebx
  mov  edi, eax
  mov  ebx, ecx

@@NextStruct:
  mov  esi, ebx
  mov  ecx, FillerSize
  shr  ecx, 1
  rep  movsw
  adc  ecx, ecx
  rep  movsb
  dec  edx
  jnz  @@NextStruct

  pop  ebx
  pop  esi
  pop  edi

@@Exit:
end;

const
  { EncryptConstants }
 C1 = 439;
 C2 = 163;
 cKey = 17732;

function l3Encrypt(const aText: AnsiString): AnsiString;

{$R-}
function lp_Encrypt(const S: ShortString; Key: Word): ShortString;
var
  I: byte;
begin
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := ansichar(byte(S[I]) xor (Key shr 8));
    try
    Key := (byte(Result[I]) + Key) * C1 + C2;
    except
    Key := (byte(Result[I]) + Key) * C1 + C2;
    end;
  end;
end;
{$R+}

begin
 Result := lp_Encrypt(aText, cKey);
end;//DaEncrypt

function l3Decrypt(const aText: AnsiString): AnsiString;

{$R-}
function lp_Decrypt(const S: AnsiString; Key: Word): AnsiString;
var
  I: byte;
begin
 try
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do begin
    Result[I] := ansichar(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
 except
  Result := '';
 end;
end;
{$R+}

begin
 if aText = '' then
  Result := ''
 else
  Result := lp_Decrypt(aText, cKey);
end;//DaDecrypt

function l3CreateStringGUID: String;
var
 l_GUID: TGUID;
begin
 if CreateGUID(l_GUID) = 0 then
  Result := GUIDToString(l_GUID)
 else
  Result := '';
end;

end.

