unit l3BMSearch;
{* Функции для поиска методом Боера-Мура. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3BMSearch -                }
{ Начат: 01.12.1999 18:27             }
{ $Id: l3BMSearch.pas,v 1.27 2013/05/21 07:58:11 lulin Exp $ }

// $Log: l3BMSearch.pas,v $
// Revision 1.27  2013/05/21 07:58:11  lulin
// - собираем тестовый проект нового генератора под XE3.
//
// Revision 1.26  2013/04/12 16:25:07  lulin
// - отлаживаем под XE3.
//
// Revision 1.25  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.24  2013/03/28 17:25:04  lulin
// - портируем.
//
// Revision 1.23  2011/12/20 13:35:14  fireton
// - предупреждения о правильном использовании поиска без учёта регистра
//
// Revision 1.22  2011/05/18 12:09:16  lulin
// {RequestLink:266409354}.
//
// Revision 1.21  2010/11/24 15:38:51  fireton
// - отформатировал описание алгоритма, а то читать невозможно ж...
//
// Revision 1.20  2010/05/14 11:52:29  lulin
// {RequestLink:211879983}.
//
// Revision 1.19  2010/03/22 18:13:26  voba
// no message
//
// Revision 1.18  2009/02/06 14:21:43  lulin
// - bug fix: преобразовывали не тот буфер.
//
// Revision 1.17  2009/02/05 13:51:48  lulin
// - не передаём ненужный параметр и чистим нужный регистр.
//
// Revision 1.16  2009/02/05 13:28:53  lulin
// - <K>: 125895391. Используем уже посчитанные длины, а не считаем их заново.
//
// Revision 1.15  2009/02/05 13:02:45  lulin
// - <K>: 125895391.
//
// Revision 1.14  2009/02/05 11:58:31  lulin
// - <K>: 125895391. Передаём кодировку, а не флажок.
//
// Revision 1.13  2008/11/26 12:46:50  lulin
// - чистка кода.
//
// Revision 1.12  2008/11/26 10:55:55  lulin
// - добавил описание алгоритма.
//
// Revision 1.11  2008/11/26 10:43:50  oman
// - fix: Под комментариями добавлено описание варианта лечения (К-125895391)
//
// Revision 1.10  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.9  2005/10/11 12:23:35  lulin
// - попытки ускорить функцию поднятия регистра при поиске.
//
// Revision 1.8  2004/08/24 17:02:25  voba
// - revert изменения в проедуре BM-поиска
//
// Revision 1.7  2004/08/19 13:57:52  law
// - bug fix: не проверялось, что длина буфера = 0.
//
// Revision 1.6  2001/10/17 08:07:52  law
// - new lib: начинаем использовать m2.
//
// Revision 1.5  2001/07/26 15:55:03  law
// - comments: xHelpGen.
//
// Revision 1.4  2000/12/15 15:18:59  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types
  ;

// Описания алгоритмов:
// http://ru.wikipedia.org/wiki/%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC_%D0%91%D0%BE%D0%B9%D0%B5%D1%80%D0%B0-%D0%9C%D1%83%D1%80%D0%B0
(*
h1. Описание алгоритма

Сначала строится таблица смещений для искомого шаблона. Совмещается начало текста (строки) и шаблона,
проверка начинается с последнего символа шаблона.

Если последний символ шаблона и соответствующий ему при наложении символ строки не совпадают,
то образец сдвигается относительно строки на величину, полученную из таблицы смещений.
Причём символ берется из строки (а не из шаблона), соответствующий сдвиг находится в таблице.
Производится сдвиг и снова начинается проверка с последнего символа.

Если же символы совпадают, производится сравнение предпоследнего символа шаблона и т. д.
Если все символы шаблона совпали с наложенными символами строки, значит, подстрока найдена, и поиск окончен.
Если же какой-то (не последний) символ шаблона не совпадает с соответствующим символом строки,
шаблон сдвигается на один символ вправо, и снова проверка снова начинается с последнего символа.

Весь алгоритм выполняется до тех пор, пока либо не будет найдено вхождение искомого образца,
либо не будет достигнут конец строки.

h1. Построение таблицы

В таблице хранится величина сдвига для каждого символа в шаблоне.
Величина сдвига определяется из тех соображений, что он должен быть максимально возможным,
но таким, чтобы не пропустить вхождение искомого шаблона.

Таблица содержит список всех символов в шаблоне. В соответствие каждому символу ставится
его порядковый номер, считая с конца строки. Если символ встречается несколько раз,
то используется самое правое вхождение.

*)
// http://alglib.sources.ru/searching/bmh.php

type
 Tl3SearchFunc = function(const aStr : Tl3WString;
                          const BT   : Tl3BMTable;
                          const aSubStr : Tl3WString;
                          var Pos : Cardinal) : Boolean;
procedure BMMakeTable(MatchString : PAnsiChar; var BT : Tl3BMTable; aLen: Integer);
  {* - Build a Boyer-Moore link table. }
function l3SearchStr(const aStr : Tl3WString;
                     const BT   : Tl3BMTable;
                     const aSubStr : Tl3WString;
                     var Pos : Cardinal) : Boolean;

  {* - Use the Boyer-Moore search method to search a buffer for a string. }
// ВНИМАНИЕ! Для успешного поиска без учёта регистра подстрока (aSubStr) должна быть в ВЕРХНЕМ РЕГИСТРЕ!
// И таблица (BT) должна быть построена для этой строки в верхнем регистре!
function l3SearchStrUC(const aStr : Tl3WString;
                       const BT   : Tl3BMTable;
                       const aSubStr : Tl3WString;
                       var Pos : Cardinal): Boolean;
  {* - Use the Boyer-Moore search method to search a buffer for a string. This
       search is not case sensitive. }

implementation

uses
  Windows,

  SysUtils,
 
  l3Chars,
  l3String,
  l3StringEx,
  l3UnicodeBMSearch,

  m2XLtLib
  ;

(*
procedure boyer_moore(const haystack: string; const needle: string; var result: byte);
var
        i, j, k      : byte;
        needle_len   : byte;
        haystack_len : byte;
        needle_table : array[char] of byte;
begin
 
needle_len := length(needle);
haystack_len := length(haystack);
 
if needle_len < haystack_len then
begin
        for i := 0 to 255 do
                needle_table[chr(i)] := needle_len;
        for i := 1 to needle_len-1 do
                needle_table[needle[i]] := needle_len-i;
 
        i := needle_len;
        j := i;
        while (j > 0) and (i <= haystack_len) do
        begin
                j := needle_len; k := i;
                while (j > 0) and (haystack[k] = needle[j]) do
                begin
                        dec(k);
                        dec(j);
                end;
                i := i + needle_table[haystack[i]];
        end;
 
        if k > haystack_len - needle_len then
                result := 0
        else
                result := k + 1;
 
end
else
        result := 0;
end;
*)  

procedure BMMakeTable(MatchString : PAnsiChar; var BT : Tl3BMTable; aLen: Integer); register;
                       {eax}                      {edx}             {ecx}
  {Build Boyer-Moore link table}
asm
  push  esi             { Save registers because they will be changed }
  push  edi
  push  ebx

  cld                   { Ensure forward string ops }
  mov   edi, eax        { _Move EAX to ESI & EDI }
  mov   esi, eax
(*  xor   eax, eax        { Zero EAX }
  or    ecx, -1
  repne scasb           { Search for null terminator }
  not   ecx
  dec   ecx             { ECX is length of search string }*)
  cmp   ecx, 0FFh       { If ECX > 255, force to 255 }
  jbe   @@1
  mov   ecx, 0FFh

@@1:
  mov   ch, cl          { Duplicate CL in CH }
  mov   eax, ecx        { Fill each byte in EAX with length }
  shl   eax, 16
  mov   ax, cx
  mov   edi, edx        { Point to the table }
  mov   ecx, 64         { Fill table bytes with length }
  rep   stosd
  cmp   al, 1           { If length >= 1, we're done }
  jbe   @@MTDone
  mov   edi, edx        { Reset EDI to beginning of table }
  xor   ebx, ebx        { Zero EBX }
  mov   cl, al          { Restore CL to length of string }
  dec   ecx

@@MTNext:
  lodsb                 { Load table with positions of letters }
  mov   bl, al          { That exist in the search string }
  mov   [edi+ebx], cl
  loop  @@MTNext

@@MTDone:
  pop   ebx             { Restore registers }
  pop   edi
  pop   esi
end;

function BMSearch(var Buffer; // eax
                  BufLength : Cardinal; // edx
                  const BT : Tl3BMTable;  // ecx
                  MatchString : PAnsiChar;
                  var Pos : Cardinal;
                  //aCodePage : Integer;
                  MatchStringLen: Cardinal) : Boolean; register;
var
  BufPtr : Pointer;
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx

  or    edx, edx
  jz    @@BMSNotFound

  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BufLength to EBX } // - нахуй не надо и комментарий неправильный //видимо надо, без этого циклится когда "без учета регистра" (@@BMSNext:)

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
//  mov   edi, MatchString    { Set EDI to beginning of MatchString }
(*  or    ecx, -1             { We will be counting down }
  repne scasb               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString }*)
  mov   ecx, MatchStringLen
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

  cmp   dl, 1               { Check to see if we have a trivial case }
  ja    @@BMSInit           { If Length(MatchString) > 1 do BM search }
  jb    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

  mov   al,[esi]            { If Length(MatchString) = 1 do a REPNE SCASB }
  mov   ebx, edi
  repne scasb
  jne   @@BMSNotFound       { No match during REP SCASB }
  dec   edi                 { Found, calculate position }
  sub   edi, ebx
  mov   esi, Pos            { Set position in Pos }
  mov   [esi], edi
  mov   eax, 1              { Set result to True }
  jmp   @@BMSDone           { We're done }

@@BMSInit:
  dec   edx                 { Set up for BM Search }
  add   esi, edx            { Set ESI to end of MatchString }
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dh, [esi]           { Set DH to character we'll be looking for }
  dec   esi                 { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
  mov   al, [ebx+eax]       { Look up skip distance from table }
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   al, [edi]           { _Move character from buffer into AL for comparison }
  cmp   dh, al              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  dec   edi
  xor   ecx, ecx            { Zero ECX }
  mov   cl, dl              { _Move Length(MatchString) to ECX }
  repe  cmpsb               { Compare MatchString to buffer }
  je    @@BMSFound          { If equal, string is found }

  mov   al, dl              { _Move Length(MatchString) to AL }
  sub   al, cl              { Calculate offset that string didn't match }
  add   esi, eax            { _Move ESI back to end of MatchString }
  add   edi, eax            { _Move EDI to pre-string compare location }
  inc   edi
  mov   al, dh              { _Move character back to AL }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to start of match }
  mov   edx, BufPtr         { _Move pointer to buffer into EDX }
  sub   edi, edx            { Calculate position of match }
  mov   eax, edi
  inc   eax
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;

(*
Попытки бороться с K-125895391
Измененные добавленные строки выделены >>
удаленные <<

function BMSearch(var Buffer; // eax
                  BufLength : Cardinal; // edx
                  const BT : Tl3BMTable;  // ecx
                  MatchString : PAnsiChar;
                  var Pos : Cardinal;
                  aCodePage : Integer) : Boolean; register;
var
  BufPtr : Pointer;
>>  MatchLen: Cardinal;
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx

  or    edx, edx
  jz    @@BMSNotFound

  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BufLength to EBX } // - нахуй не надо и комментарий неправильный //видимо надо, без этого циклится когда "без учета регистра" (@@BMSNext:)

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasb               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

>>  cmp   edx, 1               { Check to see if we have a trivial case }
<<  cmp   dl, 1               { Check to see if we have a trivial case }
  ja    @@BMSInit           { If Length(MatchString) > 1 do BM search }
  jb    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

  mov   al,[esi]            { If Length(MatchString) = 1 do a REPNE SCASB }
  mov   ebx, edi
  repne scasb
  jne   @@BMSNotFound       { No match during REP SCASB }
  dec   edi                 { Found, calculate position }
  sub   edi, ebx
  mov   esi, Pos            { Set position in Pos }
  mov   [esi], edi
  mov   eax, 1              { Set result to True }
  jmp   @@BMSDone           { We're done }

@@BMSInit:
  dec   edx                 { Set up for BM Search }
>>  mov   MatchLen, edx       { Save MatchLen }
  add   esi, edx            { Set ESI to end of MatchString }
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dh, [esi]           { Set DH to character we'll be looking for }
  dec   esi                 { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
  mov   al, [ebx+eax]       { Look up skip distance from table }
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   al, [edi]           { _Move character from buffer into AL for comparison }
  cmp   dh, al              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  dec   edi
  xor   ecx, ecx            { Zero ECX }
>>  mov   ecx, MatchLen       { _Move Length(MatchString) to ECX }
<<  mov   cl, dl              { _Move Length(MatchString) to ECX }
  repe  cmpsb               { Compare MatchString to buffer }
  je    @@BMSFound          { If equal, string is found }

>>  mov   eax, MatchLen       { _Move Length(MatchString) to AL }
>>  sub   eax, ecx            { Calculate offset that string didn't match }
<<  mov   al, dl              { _Move Length(MatchString) to AL }
<<  sub   al, cl              { Calculate offset that string didn't match }
  add   esi, eax            { _Move ESI back to end of MatchString }
  add   edi, eax            { _Move EDI to pre-string compare location }
  inc   edi
  mov   al, dh              { _Move character back to AL }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to start of match }
  mov   edx, BufPtr         { _Move pointer to buffer into EDX }
  sub   edi, edx            { Calculate position of match }
  mov   eax, edi
  inc   eax
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;
*)

function evUpcase(L         : Byte;
                  aCodePage : Integer): LongInt;
 register;
begin
 if l3IsOEM(aCodePage) then
  Result := Longint(PAnsiChar(GVersionArray[Cm2XLTOEM2Upper].RSeed08)[L])
 else
 if l3IsANSI(aCodePage) OR
    (aCodePage = CP_WesternWin) then // западноевропейские буквы проапкейсятся неправильно, но их пока и нету, зато есть строки без русских букв, которым и присваивается CP_WesternWin
  Result := Longint(PAnsiChar(GVersionArray[Cm2XLTANSI2Upper].RSeed08)[L])
 else
 begin
  Case aCodePage of
   cp_Tatar:
    CharUpperBuffA(@L, 1);
   cp_Unicode:
    //CharUpperBuffW(PWideChar(aStr), aLen);
    Assert(false);
   cp_TatarOEM:
    ; // - не преобразуем
   else
    Assert(false);
  end;//Case aCodePage
  Result := L;
 end;//l3IsANSI(aCodePage)
end;

function BMSearchUC(var Buffer; BufLength : Cardinal; const BT : Tl3BMTable;
  MatchString : PAnsiChar; var Pos : Cardinal; aCodePage : Integer) : Boolean; register;
  {- Case-insensitive search of Buffer for MatchString. Return indicates
     success or failure.  Assumes MatchString is already raised to
     uppercase (PRIOR to creating the table) -}
var
  BufPtr : Pointer;
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx

  or    edx, edx
  jz    @@BMSNotFound

  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BufLength to EBX } // комментарий неправильный

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasb               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

  or    dl, dl              { Check to see if we have a trivial case }
  jz    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

@@BMSInit:
  dec   edx                 { Set up for BM Search }
  add   esi, edx            { Set ESI to end of MatchString }
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dh, [esi]           { Set DH to character we'll be looking for }
  dec   esi                 { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
  mov   al, [ebx+eax]       { Look up skip distance from table }
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   al, [edi]           { _Move character from buffer into AL for comparison }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  mov   edx, aCodePage
  cld
  call  evUpcase
  {call  CharUpper}
  {&&& $$$ &&&}
  std
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  cmp   dh, al              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  dec   edi
  xor   ecx, ecx            { Zero ECX }
  mov   cl, dl              { _Move Length(MatchString) to ECX }
  jecxz @@BMSFound          { If ECX is zero, string is found }

@@StringComp:
  mov   al, [edi]           { Get char from buffer }
  dec   edi                 { Dec buffer index }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  mov   edx, aCodePage
  cld
  call  evUpcase
  {call  CharUpper}
  {&&& $$$ &&&}
  std
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  mov   ah, al              { _Move buffer char to AH }
  lodsb                     { Get MatchString char }
  cmp   ah, al              { Compare }
  loope @@StringComp        { OK?  Get next character }
  je    @@BMSFound          { Matched! }

  xor   ah, ah              { Zero AH }
  mov   al, dl              { _Move Length(MatchString) to AL }
  sub   al, cl              { Calculate offset that string didn't match }
  add   esi, eax            { _Move ESI back to end of MatchString }
  add   edi, eax            { _Move EDI to pre-string compare location }
  inc   edi
  mov   al, dh              { _Move character back to AL }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to start of match }
  mov   edx, BufPtr         { _Move pointer to buffer into EDX }
  sub   edi, edx            { Calculate position of match }
  mov   eax, edi
  inc   eax
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;

(*
Попытки бороться с K-125895391
добавленные строки выделены >>
удаленные <<

function BMSearchUC(var Buffer; BufLength : Cardinal; const BT : Tl3BMTable;
  MatchString : PAnsiChar; var Pos : Cardinal; aCodePage : Integer) : Boolean; register;
  {- Case-insensitive search of Buffer for MatchString. Return indicates
     success or failure.  Assumes MatchString is already raised to
     uppercase (PRIOR to creating the table) -}
var
  BufPtr : Pointer;
>>  MatchLen: Cardinal;
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx

  or    edx, edx
  jz    @@BMSNotFound

  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BufLength to EBX } // комментарий неправильный

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasb               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

>>  or    edx, edx            { Check to see if we have a trivial case }
<<  or    dl, dl              { Check to see if we have a trivial case }
  jz    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

@@BMSInit:
  dec   edx                 { Set up for BM Search }
>>  mov   MatchLen, edx       { Save MatchLen }
  add   esi, edx            { Set ESI to end of MatchString }
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dh, [esi]           { Set DH to character we'll be looking for }
  dec   esi                 { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
  mov   al, [ebx+eax]       { Look up skip distance from table }
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   al, [edi]           { _Move character from buffer into AL for comparison }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  mov   edx, aCodePage
  cld
  call  evUpcase
  {call  CharUpper}
  {&&& $$$ &&&}
  std
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  cmp   dh, al              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  dec   edi
  xor   ecx, ecx            { Zero ECX }
>>  mov   ecx, MatchLen       { _Move Length(MatchString) to ECX }
<<  mov   cl, dl              { _Move Length(MatchString) to ECX }
  jecxz @@BMSFound          { If ECX is zero, string is found }

@@StringComp:
  mov   al, [edi]           { Get char from buffer }
  dec   edi                 { Dec buffer index }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  mov   edx, aCodePage
  cld
  call  evUpcase
  {call  CharUpper}
  {&&& $$$ &&&}
  std
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  mov   ah, al              { _Move buffer char to AH }
  lodsb                     { Get MatchString char }
  cmp   ah, al              { Compare }
  loope @@StringComp        { OK?  Get next character }
  je    @@BMSFound          { Matched! }

  xor   ah, ah              { Zero AH }
>>  mov   eax, MatchLen       { _Move Length(MatchString) to AL }
>>  sub   eax, ecx            { Calculate offset that string didn't match }
<<  mov   al, dl              { _Move Length(MatchString) to AL }
<<  sub   al, cl              { Calculate offset that string didn't match }
  add   esi, eax            { _Move ESI back to end of MatchString }
  add   edi, eax            { _Move EDI to pre-string compare location }
  inc   edi
  mov   al, dh              { _Move character back to AL }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to start of match }
  mov   edx, BufPtr         { _Move pointer to buffer into EDX }
  sub   edi, edx            { Calculate position of match }
  mov   eax, edi
  inc   eax
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;

*)

function l3SearchStr(const aStr : Tl3WString;
                     const BT   : Tl3BMTable;
                     const aSubStr : Tl3WString;
                     var Pos : Cardinal): Boolean;
  {* - Use the Boyer-Moore search method to search a buffer for a string. }

  procedure DoUnicode;
  var
   l_UBMS   : TUTBMSearch;
   l_Start  : Integer;
   l_Finish : Integer;
   l_Str    : Tl3Str;
  begin
   if (aSubStr.SCodePage <> CP_Unicode) then
   begin
    l_Str.Init(aSubStr, CP_Unicode);
    try
     Result := l3SearchStr(aStr, BT, l_Str, Pos);
    finally
     l_Str.Clear;
    end;//try..finally
    Exit;
   end;//aSubStr.SCodePage <> CP_Unicode
   Assert(aSubStr.SCodePage = CP_Unicode);
   l_UBMS := TUTBMSearch.Create;
   try
    l_UBMS.FindPrepare(PWideChar(aSubStr.S), [sfSpaceCompress, sfCaseSensitive]);
    Result := l_UBMS.FindAll(PWideChar(aStr.S), aStr.SLen);
    if Result then
    begin
     l_UBMS.GetResult(0, l_Start, l_Finish);
     Pos := l_Start;
    end;//Result
   finally
    FreeAndNil(l_UBMS);
   end;//try..finally
  end;

  procedure DoNonUnicode;
  var
   l_Str    : Tl3Str;
  begin
   if (aSubStr.SCodePage = CP_Unicode) then
   begin
    l_Str.Init(aStr, CP_Unicode);
    try
     Assert(l_Str.SCodePage = CP_Unicode);
     Result := l3SearchStr(l_Str, BT, aSubStr, Pos);
    finally
     l_Str.Clear;
    end;//try..finally
    Exit;
   end;//aSubStr.SCodePage = CP_Unicode
   Assert(aSubStr.SCodePage <> CP_Unicode);
   Result := BMSearch(aStr.S^, aStr.SLen, BT, aSubStr.S, Pos, {aStr.SCodePage, }aSubStr.SLen);
  end;

var
 l_Ptr : PAnsiChar;
 //l_ByteType : TMbcsByteType;
begin
 if l3IsNil(aStr) then
 begin
  Result := false;
  Exit;
 end;//l3IsNil(aStr)
 if (aSubStr.SLen > 255) then
 begin
  Assert(aStr.SCodePage <> CP_Unicode);
  Assert(aSubStr.SCodePage <> CP_Unicode);
  Result := false;
  l_Ptr := StrPos(aStr.S, aSubStr.S);
  while (l_Ptr <> nil) and ((aStr.SLen - Cardinal(l_Ptr - aStr.S)) >= aSubStr.SLen) do
  begin
   //l_ByteType := StrByteType(aStr.S, Integer(l_Ptr-aStr.S));
   if {(l_ByteType <> mbTrailByte) and}
     (CompareStringA(LCID_RUSSIAN, 0, l_Ptr, aSubStr.SLen, aSubStr.S, aSubStr.SLen) = 2) then
   begin
    Pos := Cardinal(l_Ptr - aStr.S);
    Result := true;
    Exit;
   end;//l_ByteType <> mbTrailByte
   //if (l_ByteType = mbLeadByte) then Inc(l_Ptr);
   Inc(l_Ptr);
   l_Ptr := StrPos(l_Ptr, aSubStr.S);
  end;//while
  l_Ptr := nil;
 end//aSubStr.SLen > 255
 else
 if (aStr.SCodePage = CP_Unicode) then
  DoUnicode
 else
  DoNonUnicode;
end;

function l3SearchStrUC(const aStr : Tl3WString;
                       const BT   : Tl3BMTable;
                       const aSubStr : Tl3WString;
                       var Pos : Cardinal): Boolean;
  {* - Use the Boyer-Moore search method to search a buffer for a string. This
       search is not case sensitive. }
var
 l_Ptr : PAnsiChar;
begin
 if (aSubStr.SLen > 255) then
 begin
  Result := false;
  l_Ptr := aStr.S;
  while ((aStr.SLen - Cardinal(l_Ptr - aStr.S)) >= aSubStr.SLen) do
  begin
   if (CompareStringA(LCID_RUSSIAN, NORM_IGNORECASE, l_Ptr, aSubStr.SLen, aSubStr.S, aSubStr.SLen) = 2) then
   begin
    Pos := Cardinal(l_Ptr - aStr.S);
    Result := true;
    Exit;
   end;//CompareString(LCID_RUSSIAN, NORM_IGNORECASE, l_Ptr, aSubStr.SLen, aSubStr.S, aSubStr.SLen) = 2
   Inc(l_Ptr);
  end;//while
 end//aSubStr.SLen > 255
 else
  Result := BMSearchUC(aStr.S^, aStr.SLen, BT, aSubStr.S, Pos, aStr.SCodePage);
end;

end.

