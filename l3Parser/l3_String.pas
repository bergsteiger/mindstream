unit l3_String;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3_String -                 }
{ Начат: 18.01.2008 15:56 }
{ $Id: l3_String.pas,v 1.35 2015/08/25 12:03:24 lulin Exp $ }

// $Log: l3_String.pas,v $
// Revision 1.35  2015/08/25 12:03:24  lulin
// - нельзя так CodePage чистить. Впрочем я так и думал.
//
// Revision 1.34  2015/08/25 10:25:59  lulin
// {RequestLink:606127914}.
//
// Revision 1.33  2015/08/24 16:45:20  lulin
// {RequestLink:606118757}.
//
// Revision 1.32  2014/03/07 11:42:44  lulin
// - вычищаем ненужное.
//
// Revision 1.31  2013/07/01 06:12:21  lulin
// - чистка кода.
//
// Revision 1.30  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.29  2013/03/28 17:25:05  lulin
// - портируем.
//
// Revision 1.28  2013/03/28 16:13:50  lulin
// - портируем.
//
// Revision 1.27  2012/09/14 13:56:00  kostitsin
// опечатку поправил
//
// Revision 1.26  2011/12/20 13:34:14  fireton
// - fix: очень странный AV если aCount был меньше нуля
//
// Revision 1.25  2011/09/26 10:45:52  lulin
// {RequestLink:287220465}.
//
// Revision 1.24  2011/09/23 14:16:37  lulin
// {RequestLink:217681331}.
//
// Revision 1.23  2010/11/30 11:47:14  lulin
// {RequestLink:228688602}.
// - борьба с предупреждениями.
//
// Revision 1.22  2010/04/26 12:10:53  lulin
// {RequestLink:206504616}.
// - перерисовал диаграмму.
// - спрятал локальные процедуры.
//
// Revision 1.21  2010/04/26 11:45:30  lulin
// {RequestLink:206504616}.
// - учитываем удаление пробелов в начале строки.
//
// Revision 1.20  2010/04/26 11:33:17  lulin
// {RequestLink:206504616}.
// - информируем об удалении символов, при удалении двойных пробелов.
//
// Revision 1.19  2010/04/26 11:21:06  lulin
// {RequestLink:206504616}.
// - информируем об удалении символов, при удалении двойных пробелов.
//
// Revision 1.18  2010/02/25 13:46:02  lulin
// - избавляемся от ненужного и вредного параметра, доставшегося в наследство от ошибок молодости.
//
// Revision 1.17  2010/02/24 18:16:05  lulin
// - избавляемся от ненужного и вредного параметра, доставшегося в наследство от ошибок молодости.
//
// Revision 1.16  2010/02/24 16:45:27  lulin
// - чистка кода.
//
// Revision 1.15  2009/12/14 12:50:59  lulin
// - на всякий случай оставляем закомментированный старый код.
//
// Revision 1.14  2009/12/14 12:38:57  lulin
// - убираем лишние телодвижения при вставке подстроки.
//
// Revision 1.13  2009/12/14 09:17:00  lulin
// - типа оптимизация.
//
// Revision 1.12  2009/07/23 08:15:07  lulin
// - вычищаем ненужное использование процессора операций.
//
// Revision 1.11  2009/07/21 14:36:12  lulin
// - убираем поддержку IUnknown со строк.
//
// Revision 1.10  2009/07/16 12:08:15  lulin
// - уменьшаем строки, за счёт уменьшения кодировки.
//
// Revision 1.9  2008/12/18 14:42:50  lulin
// - <K>: 132222370.
//
// Revision 1.8  2008/12/18 12:39:03  lulin
// - <K>: 132222370. Поддерживаем работу с кодировкой TatarOEM.
//
// Revision 1.7  2008/12/15 16:06:19  lulin
// - <K>: 131137753.
//
// Revision 1.6  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.5  2008/06/27 19:43:09  lulin
// - bug fix: _1251 + _1251 (0) не давали в сумме Unicode.
//
// Revision 1.4  2008/02/12 10:31:25  lulin
// - избавляемся от излишнего метода на базовом классе.
//
// Revision 1.3  2008/02/05 18:55:11  lulin
// - запрещаем напрямую устанавливать буфер строке.
//
// Revision 1.2  2008/02/05 13:09:16  lulin
// - базовая строка переехала в отжельный файл.
//
// Revision 1.1  2008/01/18 13:26:17  lulin
// - <TDN>: 16.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types,
  l3IID,
  l3PrimString,
  l3CustomString
  ;

type
  Tl3_String = class(Tl3CustomString)
   {*! Класс реализующий строки с собственным методом хранения данных. }
    private
    // internal fields
      f_String   : Tl3WStrCast;
    protected
    // property methods
      procedure pm_SetLen(Value: Long);
        override;
        {-}
      procedure DoSetCodePage(Value: Long);
        override;
        {-}
      function  pm_GetStSize: Long;
      procedure pm_SetStSize(Value: Long);
        {-}
    protected
    // internal methods
      function  GetAsPCharLen: Tl3WString;
        override;
        {-}
      procedure DoSetAsPCharLen(const Value: Tl3PCharLen);
        override;
        {-}
      procedure Release;
        override;
        {-}
    public
    // public methods
      constructor Make(const aSt: Tl3WString; Link: Bool = false);
        overload;
        virtual;
        {* - создает новую строку как копию aSt. }
      constructor Make(S: Tl3CustomString);
        overload;
        virtual;
        {* - создает новую строку как копию S. }
      constructor Make(aCodePage: Long);
        overload;
        {* - создает новую строку c кодировкой aCodePage. }
      procedure  LinkSt(const aSt: Tl3WString);
        {* - устанавливает значение строки в aSt без копирования данных и распределения памяти. }
      procedure Append(const aSt: Tl3WString; aRepeat: Long = 1);
        override;
        {-}
      procedure NotifyInsertion(aPos: Integer;
                                aLen: Integer);
        virtual;
      procedure NotifyDeletion(aPos: Integer;
                               aLen: Integer);
        virtual;
      procedure Insert(const aSt       : Tl3WString;
                       aPos            : Long;
                       aRepeat         : Long = 1);
        override;
        {-}
      function  JoinWith(P: Tl3PrimString): Long;
        override;
        {-}
      function  Shrink(Anchor: Long): Bool;
        {-}
      function  Delete(aPos, aCount: Long): PAnsiChar;
        override;
        {-}
      procedure Clear;
        override;
        {* - очищает строку. }
      procedure LTrim;
        override;
        {-}
      function  ReplaceNonReadable: Tl3CustomString;
       override;
         {* - заменяет "нечитаемые" символы пробелами. }
      function  DeleteDoubleSpace: Tl3CustomString;
        override;
        {-}
      procedure RPad2(L: Long; Ch: AnsiChar);
        {* - добавляет к строке справа символы Ch до длины L. }
      function  Offset(Delta: Long): Tl3CustomString;
        override;
        {-}
      class function IsCacheable: Bool;
        override;
        {-}
      procedure BeforeAddToCache;
        override;
        {-}
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
    public
    // public properties
       property Ch;
         default;
         {-}
       property _CodePage: SmallInt
         write f_String.SCodePage;
         {-}
       property StSize: Long
         read pm_GetStSize
         write pm_SetStSize;
         {* - размер буфера строки, может быть больше _Len. }
  end;//Tl3_String
  Rl3_String = class of Tl3_String;

implementation

uses
  SysUtils,
  
  l3Chars,
  l3MinMax,
  l3String,
  l3Memory,
  l3InternalInterfaces,
  l3StringAdapter,
  l3Utils,
  l3StringEx,
  l3Base
  ;

// start class Tl3_String 

constructor Tl3_String.Make(const aSt: Tl3WString; Link: Bool = false);
  {virtual;}
  {overload;}
  {-}
begin
 Create;
 f_String.SCodePage := aSt.SCodePage;
 if not l3IsNil(aSt) then
 begin
  if Link then
   LinkSt(aSt)
  else
   DoSetAsPCharLen(Tl3PCharLen(aSt));
 end;//not l3IsNil(aSt)
end;

constructor Tl3_String.Make(aCodePage: Long);
  //overload;
  {* - создает новую строку c кодировкой aCodePage. }
begin
 Create;
 f_String.SCodePage := aCodePage; 
end;

constructor Tl3_String.Make(S: Tl3CustomString);
  {virtual;}
  {overload;}
  {-}
begin
 Create;
 AssignString(S);
end;

procedure Tl3_String.Release;
  {override;}
  {-}
begin
 Tl3Ptr(f_String.S).Clear;
 f_String.SLen := 0;
 inherited;
end;

procedure Tl3_String.Clear;
  {-}
var
 l_S : Tl3WString;
begin
 //inherited;
 // - типа оптимизация. Не зовём пустой родительский метод.
 if (f_String.SLen <> 0) then
 begin
  l_S := GetAsPCharLen;
  if (l_S.SCodePage = CP_Unicode) then
   PWideChar(l_S.S)[0] := #0
  else
   l_S.S[0] := #0;
  f_String.SLen := 0;
 end;//l_S.SLen <> 0
(* if (f_String.SCodePage <> CP_ANSI) AND
    (f_String.SCodePage <> CP_OEM) AND
    (f_String.SCodePage <> CP_OEMLite) AND
    (f_String.SCodePage <> CP_Unicode) then
  f_String.SCodePage := CP_ANSI;*)
end;

procedure Tl3_String.LTrim;
  {-}
var
 l_OS : Tl3WString;
 l_NS : Tl3WString;
begin
(* Changing;
 try*)
  l_OS := AsWStr;
  l_NS := l3LTrim(l_OS);
  if not Tl3PCharLen(l_OS).EQ(l_NS) then
  begin
   AsWStr := l_NS;
   NotifyDeletion(0, l_OS.SLen - l_NS.SLen);
  end;//not Tl3PCharLen(l_OS).EQ(l_NS)
(* finally
  Changed;
 end;//try..finally*)
end;

function Tl3_String.DeleteDoubleSpace: Tl3CustomString;
  {-}
  
 procedure DeleteDoubleSpaceA(St: PAnsiChar; var StLen: Long);
   {-удаляет двойные пробелы}
 var
  I, SI : Long;
 begin//DeleteDoubleSpaceA
  if (St <> nil) AND (StLen > 0) then
  begin
   I:=0;
   while (St[I] <> #0) AND (I < StLen) do
   begin
    if l3IsWhiteSpace(St[I]) then
    begin
     SI:=I;
     repeat
      Inc(I)
     until not l3IsWhiteSpace(St[I]) OR (I = StLen);
     if (I-SI >= 2) then
     begin
      Inc(SI);
      l3Move((St+I)^, (St+SI)^, StLen-I);
      Dec(StLen, I-SI);
      NotifyDeletion(I, I-SI);
      I:=SI;
     end;//I-SI >= 2
    end//l3IsWhiteSpace(St[I])
    else
     Inc(I);
   end;{while..}
  end;//St <> nil
 end;//DeleteDoubleSpaceA

 procedure DeleteDoubleSpaceW(St: PWideChar; var StLen: Long);
   //overload;
 var
  I, SI : Long;
 begin//DeleteDoubleSpaceW
  if (St <> nil) AND (StLen > 0) then
  begin
   I:=0;
   while (St[I] <> #0) AND (I < StLen) do
   begin
    if l3IsWhiteSpaceW(St[I]) then
    begin
     SI:=I;
     repeat
      Inc(I)
     until not l3IsWhiteSpaceW(St[I]) OR (I = StLen);
     if (I-SI >= 2) then
     begin
      Inc(SI);
      l3Move((St+I)^, (St+SI)^, (StLen-I)*2);
      Dec(StLen, I-SI);
      NotifyDeletion(I, I-SI);
      I:=SI;
     end;//I-SI >= 2
    end//l3IsWhiteSpace(St[I])
    else
     Inc(I);
   end;{while..}
  end;//St <> nil
 end;//DeleteDoubleSpaceW

begin
 Result := Self;
(* Changing;
 try*)
  if (f_String.SCodePage <> CP_Unicode) then
  begin
   DeleteDoubleSpaceA(St, f_String.SLen);
   if Empty then
    Clear
   else
    St[f_String.SLen] := #0;
  end//f_String.SCodePage <> CP_Unicode
  else
  begin
   DeleteDoubleSpaceW(PWideChar(St), f_String.SLen);
   if Empty then
    Clear
   else
    PWideChar(St)[f_String.SLen] := #0;
  end;//f_String.SCodePage <> CP_Unicode
(* finally
  Changed;
 end;//try..finally*)
end;

function Tl3_String.ReplaceNonReadable: Tl3CustomString;
  {-}
begin
 Result := Self;
(* Changing;
 try*)
  if (f_String.SCodePage <> CP_Unicode) then
   l3ReplaceNonReadable(St, f_String.SLen)
  else
   Assert(false);
(* finally
  Changed;
 end;//try..finally*)
end;

procedure Tl3_String.RPad2(L: Long; Ch: AnsiChar);
  {-}
begin
 Append(Ch, Max(L - f_String.SLen, 0));
end;

function Tl3_String.Offset(Delta: Long): Tl3CustomString;
  {override;}
  {-}
begin
 Delete(0, Delta);
 Result := Self;
end;

class function Tl3_String.IsCacheable: Bool;
  {override;}
  {-}
begin
 Result := true;
end;

procedure Tl3_String.BeforeAddToCache;
  {override;}
  {-}
begin
 inherited;
 {$IfDef l3NoObjectCache}
 Tl3Ptr(f_String.S).Clear;
 f_String.SLen := 0;
 {$Else  l3NoObjectCache}
 if not Empty then
 begin
  if (f_String.SCodePage = CP_Unicode) then
   PWideChar(GetAsPCharLen.S)^ := #0
  else
   GetAsPCharLen.S^ := #0;
  //Ch[0] := #0;
  f_String.SLen := 0;
 end;//not Empty
 {$EndIf l3NoObjectCache}
 f_String.SCodePage := CP_ANSI;
end;

function Tl3_String.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
begin
 Result.SetOk;
 if IID.EQ(Il3MemoryPool) then
  Il3MemoryPool(Obj) := Tl3StringAdapter.Make(Self)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

function Tl3_String.GetAsPCharLen: Tl3WString;
  //override;
  {-}
begin
 assert(@f_String.Flag = @f_String.S.Flag);
 assert(@f_String.S.Ptr = @f_String.WS.S);
 assert(SizeOf(f_String) = SizeOf(Tl3WString) + SizeOf(Tl3MemoryFlag));
 Result := f_String.WS;
 if (f_String.Flag = l3_mfSmall) then
  Result.S := Tl3Ptr(f_String.S).AsPointer;
end;
  
procedure Tl3_String.DoSetAsPCharLen(const Value: Tl3PCharLen);
  //override;
  {-}
begin
 if l3IsNil(Value) then
  Clear
 else
 begin
  f_String.SCodePage := Value.SCodePage;
  with Tl3Ptr(f_String.S) do
  begin
   if (f_String.SCodePage = CP_Unicode) then
   begin
    f_String.SLen := Write(0, Value.S, Value.SLen * SizeOf(WideChar)) div SizeOf(WideChar);
    Write(f_String.SLen * SizeOf(WideChar), cc_Null, 1);
    Write(f_String.SLen * SizeOf(WideChar) + 1, cc_Null, 1);
   end//f_CodePage = CP_Unicode
   else
   begin
    f_String.SLen := Write(0, Value.S, Value.SLen);
    Write(f_String.SLen, cc_Null, 1);
   end;//f_CodePage = CP_Unicode
  end;//with Tl3Ptr(f_String.S)
 end;//l3IsNil(Value)
 CheckUnicode;
end;

procedure Tl3_String.LinkSt(const aSt: Tl3WString);
  {-}
begin
(* Changing;
 try*)
  l3FreeStringMem(f_String.S);
  f_String.S.Flag := l3_mfLocal;
  f_String.WS := aSt;
(* finally
  Changed;
 end;//try..finally*)
end;

procedure Tl3_String.Append(const aSt: Tl3WString; aRepeat: Long = 1);
  {-}
begin
 Insert(aSt, f_String.SLen, aRepeat);
end;

procedure Tl3_String.NotifyInsertion(aPos: Integer;
                          aLen: Integer);
  //virtual;
begin
 // - ничего не делаем
end;

procedure Tl3_String.NotifyDeletion(aPos: Integer;
                         aLen: Integer);
  //virtual;
begin
 // - ничего не делаем
end;

procedure Tl3_String.Insert(const aSt       : Tl3WString;
                            aPos            : Long;
                            aRepeat         : Long = 1);
  {-}

 procedure lDoInsert(const aSt: Tl3WString);

  procedure _Notify;
  begin//_Notify
   NotifyInsertion(aPos, aSt.SLen);
  end;//_Notify

 var
  NStSize    : Long;
  l_S        : PAnsiChar;
  i          : Long;
  l_CharSize : Integer;
  l_St       : PAnsiChar;
 begin//lDoInsert
  if (f_String.SCodePage = CP_Unicode) then
   l_CharSize := SizeOf(WideChar)
  else
   l_CharSize := SizeOf(AnsiChar);
  if (aPos > f_String.SLen) then
   NStSize := aPos * l_CharSize
  else
   NStSize := f_String.SLen * l_CharSize;
  Inc(NStSize, aSt.SLen * aRepeat * l_CharSize);
  with Tl3Ptr(f_String.S) do
  begin
   SetSize(Succ(NStSize));
   l_St := AsPointer;
   if (f_String.SLen = 0) then
    l_St^ := #0;
  end;//with Tl3Ptr(f_String.S)
  if (aPos > f_String.SLen) then
  begin
   if (l_CharSize = SizeOf(WideChar)) then
    l3PadPrimW(PWideChar(l_St), aPos)
   else
    l3PadPrim(l_St, aPos);
   f_String.SLen := aPos;
  end;//aPos > f_StLen
  l_S := l_St + aPos * l_CharSize;
  l3Move(l_S^, l_S[aSt.SLen * aRepeat * l_CharSize], (Succ(f_String.SLen) - aPos) * l_CharSize);
  for i := 0 to Pred(aRepeat) do
   l3Move(aSt.S^, l_S[i * l_CharSize], aSt.SLen * l_CharSize);
  f_String.SLen := NStSize div l_CharSize;
  _Notify;
 end;//lDoInsert

var
 l_S1 : Tl3Str;
 l_S2 : Tl3Str;
 l_St : Tl3Str;
 l_W  : Tl3WString;
begin
 if not l3IsNil(aSt) AND (aPos >= 0) AND (aRepeat > 0) then
 begin
(*  Changing;
  try*)
   if (f_String.SCodePage = aSt.SCodePage) OR
      (IsANSI AND l3IsANSI(aSt.SCodePage)) OR
      (IsOEM AND l3IsOEM(aSt.SCodePage)) then
    lDoInsert(aSt)
   else
   begin
    l_S1.Init(aSt, f_String.SCodePage);
    try
     if l3Same(l_S1, aSt) then
      lDoInsert(l_S1)
     else
     begin
      l_W := GetAsPCharLen;
      l_S2.Init(l_W, aSt.SCodePage);
      try
       if l3Same(l_S2, l_W) then
       begin
        CodePage := aSt.SCodePage;
        lDoInsert(aSt);
       end//l3Same(l_S2, l_W)
       else
       begin
        if not IsOEM then
        begin
         if not l3IsANSI(aSt.SCodePage) then
          CodePage := CP_Unicode
         else
         if not IsANSI then
          CodePage := CP_Unicode;
        end//not IsOEM
        else
        begin
         if (aSt.SCodePage = CP_Tatar) OR (aSt.SCodePage = CP_TatarOEM) then
          CodePage := CP_Unicode;
        end;//not IsOEM
        l_St.Init(aSt, f_String.SCodePage);
        try
         lDoInsert(l_St);
        finally
         l_St.Clear;
        end;//try..finally
       end;//l3Same(l_S2, l_W)
      finally
       l_S2.Clear;
      end;//try..finally
     end;//l3Same(l_S1, aSt)
    finally
     l_S1.Clear;
    end;//try..finally
   end;//f_String.SCodePage = aSt.SCodePage
   CheckUnicode;
(*  finally
   Changed;
  end;//try..finally*)
 end;//not l3IsNil(aSt)
end;

function Tl3_String.JoinWith(P: Tl3PrimString): Long;
  {override;}
  {-}
begin
 Result := f_String.SLen;
 Append(P.AsWStr);
end;

function Tl3_String.Shrink(Anchor: Long): Bool;
  {-}
begin
 Result := true;
 if not Empty AND (Anchor >= 0) AND (Anchor <= f_String.SLen) then
 begin
(*  Changing;
  try*)
   f_String.SLen := Anchor;
   if (f_String.SLen = 0) then
    Clear
   else
    St[f_String.SLen] := #0;
(*  finally
   Changed;
  end;//try..finally*)
 end;//not Empty 
end;

function Tl3_String.pm_GetStSize: Long;
begin
 Result := Tl3Ptr(f_String.S).GetSize;
end;

procedure Tl3_String.pm_SetStSize(Value: Long);
  {-}
begin
 if (Tl3Ptr(f_String.S).GetSize < Value) then
 begin
  Tl3Ptr(f_String.S).SetSize(Value);
  f_String.SLen := Min(f_String.SLen, Pred(Value));
  // !!! вообще-то для Unicode здесь - проеб !!!
 end;//Tl3Ptr(f_String.S).GetSize < Value
end;

procedure Tl3_String.pm_SetLen(Value: Long);
  {override;}
  {-}
begin
 if (Value <> f_String.SLen) then
 begin
(*  Changing;
  try*)
   if (Value = 0) then
    Clear
   else
   begin
    if (f_String.SCodePage = CP_Unicode) then
    begin
     StSize := Succ(Value) * SizeOf(WideChar);
     f_String.SLen := Value;
     PWideChar(Tl3Ptr(f_String.S).AsPointer)[f_String.SLen] := #0;
    end//f_CodePage = CP_Unicode
    else
    begin
     StSize := Succ(Value);
     f_String.SLen := Value;
     Tl3Ptr(f_String.S).AsPointer[f_String.SLen] := #0;
    end;//f_CodePage = CP_Unicode
   end;//Value <> f_StLen
(*  finally
   Changed;
  end;//try..finally*)
 end;//Value <> f_StLen
end;

procedure Tl3_String.DoSetCodePage(Value: Long);
  {override;}
  {-}
var
 l_tmpStr : Tl3Str;
begin
 if (f_String.SCodePage <> Value) then
 begin
  if Empty then
  begin
   if (Value <> CP_KeepExisting) then
    f_String.SCodePage := Value
  end//Empty
  else
  begin
   l_tmpStr.Init(GetAsPCharLen, Value);
   try
    LinkSt(l_tmpStr);
   except
    l_tmpStr.Clear;
    raise;
   end;//try..except
  end;//Empty
 end;//f_CodePage <> Value
end;

function Tl3_String.Delete(aPos, aCount: Long): PAnsiChar;
  {-}
  
 procedure l3DeleteSubString(S : PAnsiChar; SLen, Count, Pos : Integer);
   {-Delete Cound characters from S starting at Pos}
 begin
  l3Move(S[Pos + Count], S[Pos], (SLen+1)-(Pos+Count));
 end;

 procedure l3DeleteSubStringW(S : PWideChar; SLen, Count, Pos : Integer);
   {-Delete Cound characters from S starting at Pos}
 begin
  l3Move(S[Pos + Count], S[Pos], ((SLen+1)-(Pos+Count)) * SizeOf(WideChar));
 end;

begin
 if (St <> nil) AND (aPos >= 0) AND (aCount > 0) AND (aPos < f_String.SLen) then
 begin
(*  Changing;
  try*)
   if (aPos + aCount >= f_String.SLen) then
   begin
    f_String.SLen := aPos;
    if (f_String.SCodePage = CP_Unicode) then
     Tl3Ptr(f_String.S).Write(aPos * SizeOf(WideChar), cc_Null, SizeOf(WideChar))
    else
     Tl3Ptr(f_String.S).Write(aPos, cc_Null, SizeOf(ANSIChar));
   end//aPos + aCount >= f_StLen
   else
   begin
    if (f_String.SCodePage = CP_Unicode) then
     l3DeleteSubStringW(PWideChar(St), f_String.SLen, aCount, aPos)
    else
     l3DeleteSubString(St, f_String.SLen, aCount, aPos);
    Dec(f_String.SLen, aCount);
   end;//aPos + aCount >= f_StLen
   if (f_String.SLen = 0) then Clear;
(*  finally
   Changed;
  end;//try..finally*)
 end;//St <> nil
 Result := St;
end;

end.

