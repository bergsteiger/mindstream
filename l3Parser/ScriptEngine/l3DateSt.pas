unit l3DateSt;

{ $Id: l3DateSt.pas,v 1.29 2013/04/19 13:08:17 lulin Exp $ }

// $Log: l3DateSt.pas,v $
// Revision 1.29  2013/04/19 13:08:17  lulin
// - портируем.
//
// Revision 1.28  2013/04/17 14:22:51  lulin
// - портируем.
//
// Revision 1.27  2013/04/10 16:00:33  lulin
// - портируем.
//
// Revision 1.26  2013/04/10 13:59:30  lulin
// - портируем.
//
// Revision 1.25  2013/03/28 14:03:17  lulin
// - портируем.
//
// Revision 1.24  2012/04/17 09:10:31  voba
// - k : 357336245
//
// Revision 1.23  2011/11/10 06:03:17  narry
// Исправление сообщения об ошибке
//
// Revision 1.22  2011/10/17 09:34:21  lulin
// {RequestLink:293896724}.
//
// Revision 1.21  2009/08/04 08:41:55  dinishev
// Не спотыкаемся на формате 'mm/dd/yyyy'
//
// Revision 1.20  2008/01/22 13:29:33  voba
// - bug fix
//
// Revision 1.19  2008/01/16 13:44:33  voba
// no message
//
// Revision 1.18  2008/01/10 14:58:12  voba
// - bug fixx
//
// Revision 1.17  2007/11/01 10:46:04  fireton
// - отвязываем vtGetNearestDayOfWeek от SysUtils (региональных настроек системы)
//
// Revision 1.16  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.15  2007/07/11 13:23:10  fireton
// - корректный парсинг даты в l3StrToDateInterval
//
// Revision 1.14  2007/03/06 14:47:44  fireton
// + function l3StrToDateInterval
//
// Revision 1.13  2007/02/14 16:15:44  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.12  2007/01/16 09:15:45  voba
// - bug fix
//
// Revision 1.11  2007/01/11 10:05:25  voba
// - bug fix
//
// Revision 1.10  2007/01/10 15:07:42  voba
// - bug fix
//
// Revision 1.9  2006/12/13 15:42:20  voba
// - add function MakeHRDateIntervalStr
// - imp lfunction 3DateTimeToString теперь можно управлять регистром отображения месяца в строковом виде (mmmm,  Mmmm,  MMMM )
//
// Revision 1.8  2006/12/11 14:50:12  voba
// - bug fix
//
// Revision 1.7  2006/12/08 15:22:57  voba
// - add  function MakeDateIntervalStr
//
// Revision 1.6  2006/12/01 11:21:51  voba
// - bug fix function  l3TimeToStr
//
// Revision 1.5  2006/02/02 15:26:55  voba
// - add function  l3TimeToStr
//
// Revision 1.4  2005/11/11 15:20:12  voba
// - bug fix FlexStr2DMY
//
// Revision 1.3  2005/05/26 10:45:05  lulin
// - bug fix: в лог не писалось время.
//
// Revision 1.2  2005/05/24 10:02:59  lulin
// - cleanup.
//
// Revision 1.1  2004/12/23 11:28:43  lulin
// - rename unit: vtDateSt -> l3DateSt.
//
// Revision 1.10  2004/08/24 17:05:50  voba
// - add vtDateTimeToString - перенес из SysUtils и доделал
//
// Revision 1.9  2003/06/19 09:03:27  voba
// - add функции работы с диапазоном дат
//
// Revision 1.8  2003/04/19 11:24:49  law
// - new file: vtDefine.inc.
//
// Revision 1.7  2002/04/09 14:54:12  voba
// -improvement :  для функции преобразования даты в строку межно задать формат
//
// Revision 1.6  2001/11/05 16:19:59  voba
// no message
//
// Revision 1.5  2001/09/21 09:58:56  law
// - cleanup.
//
// Revision 1.4  2001/02/20 13:24:25  voba
// no message
//
// Revision 1.3  2000/12/19 15:13:56  voba
// no message
//
// Revision 1.2  2000/12/15 15:36:29  law
// - вставлены директивы Log.
//

{$I l3Define.inc }
{$WriteableConst On}

interface

uses
  l3Date
  ;

const
  DayString : array[TStDayType] of String[12] =
            ('Воскресенье','Понедельник', 'Вторник', 'Среда', 'Четверг',
                'Пятница', 'Суббота');

  DayShortString : array[TStDayType] of String[3] =
                   ('Вс','Пн','Вт','Ср','Чт','Пт','Сб');

  MonthString : array[1..12] of String[9] = (
    'Январь', 'Февраль' , 'Март', 'Апрель', 'Май', 'Июнь',
    'Июль',  'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');

 Procedure FlexStr2DMY(DateStr : PAnsiChar; DStrLen : Word; Var Day, Month, Year : Word);
 Function  FlexStr2Date(const DateStr: AnsiString): TDateTime;
 Function  FlexStr2StDate(const DateStr: AnsiString): TStDate;
 Function  FlexStrLen2StDate(DateStr : PAnsiChar; Len : Word): TStDate;
 Function  GetMonthNameR(aMonth : Byte) : AnsiString;
 function  NormalizeDate(Const DtStr : AnsiString) : AnsiString;

 function  l3DateTimeToStr(aDate : TDateTime; const aFormat: AnsiString = '') : AnsiString;
 function  l3DateToStr(aDate : TDateTime; const aFormat: AnsiString = '') : AnsiString;
   overload;
 function  l3DateToStr(aDate : TstDate; const aFormat: AnsiString = '') : AnsiString;
   overload;

 function  l3TimeToStr(aTime : TstDate; const aFormat: AnsiString = '') : AnsiString;

 function  vtGetNearestDayOfWeek(aDayOfWeek : TStDayType; MayBeNow : Boolean = true) : TDateTime;

 function MakeDateBoundsStr(aLowBound, aHighBound : TStDate) : AnsiString; overload;
 //function MakeDateBoundsStr(aDateBounds : Tl3DateBounds) : AnsiString;     overload;
  {- Делает строки вида "с 01.01.2006 по 07.07.2006"}

 function MakeDateIntervalStr(aLowBound, aHighBound : TStDate; aDateSeparator : AnsiChar = '0'{use native separator}) : AnsiString;
  {- Делает строки вида "01.01.2006-07.07.2006","01.2006","2006"}

 function MakeHRDateIntervalStr(aLowBound, aHighBound : TStDate) : AnsiString;

 {- Делает "human readable" строки вида "01-07 января 2006","январь 2006", "январь-март 2006", "2006"}

function l3StrToDateInterval(aDateStr: AnsiString; var StartDate: TStDate; var EndDate: TStDate): Boolean;

 {- превращает строку в диапазон дат}

implementation

uses
  Windows,
  SysUtils,
  l3Base,
  l3String
  ;

 const
  BlankShortDate = 0; {High(Word);}

function  vtGetNearestDayOfWeek(aDayOfWeek : TStDayType; MayBeNow : Boolean = true) : TDateTime;
 begin
  Result := Date + Ord(aDayOfWeek) - Ord(l3Date.DayOfWeek(Date));
  if (Result > Date) or ((Result = Date) and MayBeNow) then Exit;
  Result := Result + 7;
 end;

procedure l3DateTimeToString(var Result: AnsiString; const Format: AnsiString; DateTime: TDateTime);
var
  BufPos, AppendLevel: Integer;
  Buffer: array[0..255] of AnsiChar;

  procedure AppendChars(P: PAnsiChar; Count: Integer);
  var
    N: Integer;
  begin
    N := SizeOf(Buffer) - BufPos;
    if N > Count then N := Count;
    if N <> 0 then l3Move(P[0], Buffer[BufPos], N);
    Inc(BufPos, N);
  end;

  procedure AppendString(const S: AnsiString);
  begin
    AppendChars(PAnsiChar(S), Length(S));
  end;

  procedure AppendNumber(Number, Digits: Integer);
  const
    Format: array[0..3] of AnsiChar = '%.*d';
  var
    NumBuf: array[0..15] of AnsiChar;
  begin
    AppendChars(NumBuf, FormatBuf(NumBuf, SizeOf(NumBuf), Format,
      SizeOf(Format), [Digits, Number]));
  end;

  procedure AppendFormat(Format: PAnsiChar);
  var
    Starter, Token, LastToken, lRealToken: AnsiChar;
    DateDecoded, TimeDecoded, Use12HourClock,
    BetweenQuotes: Boolean;
    P: PAnsiChar;
    Count: Integer;
    Year, Month, Day, Hour, Min, Sec, MSec, H: Word;
    lMonthCase : (mcUpper, mcUpperFirst, mcLower);


    procedure GetCount;
    var
      P : PAnsiChar;
    begin
      P := Format;
      while UpCase(Format^) = lRealToken do
       Inc(Format);
      Count := Format - P + 1;
      if (Count > 2) and (Token = 'M') then
       if Starter = 'M' then
        if P^ = 'M' then
         lMonthCase := mcUpper
        else
         lMonthCase := mcUpperFirst
       else
        lMonthCase := mcLower;
    end;

    procedure GetDate;
    begin
      if not DateDecoded then
      begin
        DecodeDate(DateTime, Year, Month, Day);
        DateDecoded := True;
      end;
    end;

    procedure GetTime;
    begin
      if not TimeDecoded then
      begin
        DecodeTime(DateTime, Hour, Min, Sec, MSec);
        TimeDecoded := True;
      end;
    end;

    function ConvertEraString(const Count: Integer) : AnsiString;
    var
      FormatStr: AnsiString;
      SystemTime: TSystemTime;
      Buffer: array[Byte] of AnsiChar;
      P: PAnsiChar;
    begin
      Result := '';
      with SystemTime do
      begin
        wYear  := Year;
        wMonth := Month;
        wDay   := Day;
      end;

      FormatStr := 'gg';
      if GetDateFormatA(GetThreadLocale, DATE_USE_ALT_CALENDAR, @SystemTime,
        PAnsiChar(FormatStr), Buffer, SizeOf(Buffer)) <> 0 then
      begin
        Result := Buffer;
        if Count = 1 then
        begin
          case SysLocale.PriLangID of
            LANG_JAPANESE:
              Result := Copy(Result, 1, CharToBytelen(Result, 1));
            LANG_CHINESE:
              if (SysLocale.SubLangID = SUBLANG_CHINESE_TRADITIONAL)
                and (ByteToCharLen(Result, Length(Result)) = 4) then
              begin
                P := Buffer + CharToByteIndex(Result, 3) - 1;
                SetString(Result, P, CharToByteLen(P, 2));
              end;
          end;
        end;
      end;
    end;

    function ConvertYearString(const Count: Integer): AnsiString;
    var
      FormatStr: AnsiString;
      SystemTime: TSystemTime;
      Buffer: array[Byte] of AnsiChar;
    begin
      Result := '';
      with SystemTime do
      begin
        wYear  := Year;
        wMonth := Month;
        wDay   := Day;
      end;

      if Count <= 2 then
        FormatStr := 'yy' // avoid Win95 bug.
      else
        FormatStr := 'yyyy';

      if GetDateFormatA(GetThreadLocale, DATE_USE_ALT_CALENDAR, @SystemTime,
        PAnsiChar(FormatStr), Buffer, SizeOf(Buffer)) <> 0 then
      begin
        Result := Buffer;
        if (Count = 1) and (Result[1] = '0') then
          Result := Copy(Result, 2, Length(Result)-1);
      end;
    end;

 function GetLongMonthNames(aMonth : word) : AnsiString;
 begin
  if (BufPos > 0) then
   Result := GetMonthNameR(aMonth)
  else
   Result := MonthString[aMonth];

  case lMonthCase of
   mcUpper :
    CharUpperBuffA(PAnsiChar(Result), Length(Result));
   mcUpperFirst :
    begin
     CharLowerBuffA(PAnsiChar(Result), Length(Result));
     CharUpperBuffA(PAnsiChar(Result), 1);
    end;
   mcLower :
    CharLowerBuffA(PAnsiChar(Result), Length(Result));
  end;
 end;

  begin
    if (Format <> nil) and (AppendLevel < 2) then
    begin
      Inc(AppendLevel);
      LastToken := ' ';
      DateDecoded := False;
      TimeDecoded := False;
      Use12HourClock := False;
      while Format^ <> #0 do
      begin
        Starter := Format^;
        Format := StrNextChar(Format);
        if Starter in LeadBytes then
        begin
          LastToken := ' ';
          Continue;
        end;
        Token := Starter;
        if Token in ['a'..'z'] then Dec(Token, 32);
        lRealToken := Token;
        if Token in ['A'..'Z'] then
        begin
          if (Token = 'M') and (LastToken = 'H') then Token := 'N';
          LastToken := Token;
        end;
        case Token of
          'Y':
            begin
              GetCount;
              GetDate;
              if Count <= 2 then
                AppendNumber(Year mod 100, 2) else
                AppendNumber(Year, 4);
            end;
          'G':
            begin
              GetCount;
              GetDate;
              AppendString(ConvertEraString(Count));
            end;
          'E':
            begin
              GetCount;
              GetDate;
              AppendString(ConvertYearString(Count));
            end;
          'M':
            begin
              GetCount;
              GetDate;
              case Count of
                1, 2: AppendNumber(Month, Count);
                3: {$IfDef XE3}assert(false);{$Else}AppendString(ShortMonthNames[Month]);{$EndIf}
              else
                AppendString(GetLongMonthNames(Month));
              end;
            end;
          'D':
            begin
              GetCount;
              case Count of
                1, 2:
                  begin
                    GetDate;
                    AppendNumber(Day, Count);
                  end;
                3: {$IfDef XE3}assert(false);{$Else}AppendString(ShortDayNames[DayOfWeek(DateTime)]);{$EndIf}
                4: {$IfDef XE3}assert(false);{$Else}AppendString(LongDayNames[DayOfWeek(DateTime)]);{$EndIf}
                5: {$IfDef XE3}assert(false);{$Else}AppendFormat(PAnsiChar(ShortDateFormat));{$EndIf}
              else
                {$IfDef XE3}assert(false);{$Else}AppendFormat(PAnsiChar(LongDateFormat));{$EndIf}
              end;
            end;
          'H':
            begin
              GetCount;
              GetTime;
              BetweenQuotes := False;
              P := Format;
              while P^ <> #0 do
              begin
                if P^ in LeadBytes then
                begin
                  P := StrNextChar(P);
                  Continue;
                end;
                case P^ of
                  'A', 'a':
                    if not BetweenQuotes then
                    begin
                      if ( (StrLIComp(P, 'AM/PM', 5) = 0)
                        or (StrLIComp(P, 'A/P',   3) = 0)
                        or (StrLIComp(P, 'AMPM',  4) = 0) ) then
                        Use12HourClock := True;
                      Break;
                    end;
                  'H', 'h':
                    Break;
                  '''', '"': BetweenQuotes := not BetweenQuotes;
                end;
                Inc(P);
              end;
              H := Hour;
              if Use12HourClock then
                if H = 0 then H := 12 else if H > 12 then Dec(H, 12);
              if Count > 2 then Count := 2;
              AppendNumber(H, Count);
            end;
          'N':
            begin
              GetCount;
              GetTime;
              if Count > 2 then Count := 2;
              AppendNumber(Min, Count);
            end;
          'S':
            begin
              GetCount;
              GetTime;
              if Count > 2 then Count := 2;
              AppendNumber(Sec, Count);
            end;
          'T':
            begin
              GetCount;
              if Count = 1 then
                {$IfDef XE3}assert(false){$Else}AppendFormat(PAnsiChar(ShortTimeFormat)){$EndIf}
              else
                {$IfDef XE3}assert(false);{$Else}AppendFormat(PAnsiChar(LongTimeFormat));{$EndIf}
            end;
          'Z':
            begin
              GetCount;
              GetTime;
              if Count > 3 then Count := 3;
              AppendNumber(MSec, Count);
            end;
          'A':
            begin
              GetTime;
              P := Format - 1;
              if StrLIComp(P, 'AM/PM', 5) = 0 then
              begin
                if Hour >= 12 then Inc(P, 3);
                AppendChars(P, 2);
                Inc(Format, 4);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'A/P', 3) = 0 then
              begin
                if Hour >= 12 then Inc(P, 2);
                AppendChars(P, 1);
                Inc(Format, 2);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'AMPM', 4) = 0 then
              begin
                if Hour < 12 then
                  {$IfDef XE3}assert(false){$Else}AppendString(TimeAMString){$EndIf}
                else
                  {$IfDef XE3}assert(false);{$Else}AppendString(TimePMString);{$EndIf}
                Inc(Format, 3);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'AAAA', 4) = 0 then
              begin
                GetDate;
                {$IfDef XE3}assert(false);{$Else}AppendString(LongDayNames[DayOfWeek(DateTime)]);{$EndIf}
                Inc(Format, 3);
              end else
              if StrLIComp(P, 'AAA', 3) = 0 then
              begin
                GetDate;
                {$IfDef XE3}assert(false);{$Else}AppendString(ShortDayNames[DayOfWeek(DateTime)]);{$EndIf}
                Inc(Format, 2);
              end else
              AppendChars(@Starter, 1);
            end;
          'C':
            begin
              GetCount;
              {$IfDef XE3}assert(false);{$Else}AppendFormat(PAnsiChar(ShortDateFormat));{$EndIf}
              GetTime;
              if (Hour <> 0) or (Min <> 0) or (Sec <> 0) then
              begin
                AppendChars(' ', 1);
                {$IfDef XE3}assert(false);{$Else}AppendFormat(PAnsiChar(LongTimeFormat));{$EndIf}
              end;
            end;
          '/':
            if {$IfDef XE3}FormatSettings.{$EndIf}DateSeparator <> #0 then
              AppendChars(@{$IfDef XE3}FormatSettings.{$EndIf}DateSeparator, 1);
          ':':
            if {$IfDef XE3}FormatSettings.{$EndIf}TimeSeparator <> #0 then
              AppendChars(@{$IfDef XE3}FormatSettings.{$EndIf}TimeSeparator, 1);
          '''', '"':
            begin
              P := Format;
              while (Format^ <> #0) and (Format^ <> Starter) do
              begin
                if Format^ in LeadBytes then
                  Format := StrNextChar(Format)
                else
                  Inc(Format);
              end;
              AppendChars(P, Format - P);
              if Format^ <> #0 then Inc(Format);
            end;
        else
          AppendChars(@Starter, 1);
        end;
      end;
      Dec(AppendLevel);
    end;
  end;

begin
  BufPos := 0;
  AppendLevel := 0;
  if Format <> '' then AppendFormat(PAnsiChar(Format)) else AppendFormat('C');
  SetString(Result, Buffer, BufPos);
end;

function l3DateTimeToStr(aDate : TDateTime; const aFormat: AnsiString = ''): AnsiString;
begin
 if (aFormat = '') then
  l3DateTimeToString(Result, 'dd/mm/yyyy hh:nn:ss', aDate)
 else
  l3DateTimeToString(Result, aFormat, aDate);
end;

function l3DateToStr(aDate : TDateTime; const aFormat: AnsiString = '') : AnsiString;
begin
 If (aDate = NullDate) or (aDate = BadDateTime) then
  Result := ''
 else
 begin
  if (aFormat = '') then
   l3DateTimeToString(Result, {$IfDef XE3}FormatSettings.{$EndIf}ShortDateFormat, aDate)
  else
   l3DateTimeToString(Result, aFormat, aDate);
 end;//(aDate = NullDate) or (aDate = BadDateTime)
end;

function l3DateToStr(aDate : TstDate; const aFormat: AnsiString = '') : AnsiString;
begin
 Result := l3DateToStr(StDateToDateTime(aDate), aFormat);
end;

function  l3TimeToStr(aTime : TstDate; const aFormat: AnsiString = '') : AnsiString;
begin
 if (aFormat = '') then
  l3DateTimeToString(Result, {$IfDef XE3}FormatSettings.{$EndIf}ShortTimeFormat,  frac(aTime/SecondsInDay))
 else
  l3DateTimeToString(Result, aFormat,  frac(aTime/SecondsInDay));
end;

 procedure FlexStr2DMY(DateStr : PAnsiChar; DStrLen : Word; Var Day, Month, Year : Word);
 var
  I : Integer;
  S : String[4];

  procedure GetNumeric;
  begin
   {SkipSpace;}
   While (I < DStrLen) and Not (DateStr[I] in ['0'..'9']) do Inc(I);
   If (I >= DStrLen) then Exit;

   S := '';
   While (I < DStrLen) and (DateStr[I] in ['0'..'9']) do
   begin
    S := S + DateStr[I];
    Inc(I);
   end;
  If (I >= DStrLen) then Exit;
  end;

 begin
  Day := 1;
  Month := 1;
  Year := 1900;
  if DStrLen = 0 then DStrLen := StrLen(DateStr);
  if DStrLen = 0 then
   raise EConvertError.CreateFmt('Convert "%s" to date error.', [DateStr]);
  Try
   I := 0;
   GetNumeric;
   Day := StrToInt(S);
   GetNumeric;
   Month := StrToInt(S);
   if Month > 12 then
   begin
    Month := Day;
    Day := StrToInt(S);
   end;
   GetNumeric;
   Year := StrToInt(S);
  except
   raise EConvertError.CreateFmt('Convert "%s" to date error.', [DateStr]);
  end;
 end;

function FlexStr2Date(const DateStr: AnsiString): TDateTime;
 Var
  D, M, Y : Word;
 begin
  if (DateStr = '') then
   Result := NullDate
  else
  begin
   FlexStr2DMY(@DateStr[1], Length(DateStr), D, M, Y);
   Result:=EncodeDate(Y,M,D);
  end;//DateStr = ''
 end;

Function FlexStr2StDate(const DateStr: AnsiString): TStDate;
 Var
  D, M, Y : Word;
 Begin
  FlexStr2DMY(@DateStr[1], Length(DateStr), D, M, Y);
  Result:=DMYtoStDate(D, M, Y);
 end;

Function FlexStrLen2StDate(DateStr : PAnsiChar; Len : Word): TStDate;
 Var
  D, M, Y : Word;
 Begin
  FlexStr2DMY(DateStr, Len, D, M, Y);
  Result:=DMYtoStDate(D, M, Y);
 end;

function GetMonthNameR(aMonth : Byte) : AnsiString;
begin
 Result:=MonthString[aMonth];
 if (SysLocale.PriLangID = LANG_RUSSIAN) then
  if aMonth in [3,8] then
   Result := Result + 'а'
  else
   Result[Length(Result)]:='я';
end;

procedure PresetStr;
 var
  ID : TStDayType;
  I  : Byte;
 begin
  for ID:=Sunday to Saturday do
  begin
   DayString[ID][Byte(DayString[ID][0])+1]:=#0;
   DayShortString[ID][Byte(DayShortString[ID][0])+1]:=#0;
  end;
  for I := 1 to 12 do
   MonthString[I][Byte(MonthString[I][0])+1]:=#0;
 end;

function NormalizeDate(Const DtStr : AnsiString) : AnsiString;
 var
  I     : Integer;
  cnt   : Integer;
  Part  : Integer;
 begin
  Result:='';
  If Length(DtStr) = 0 then Exit;
  Cnt := 0;
  Part := 1;
  for I := 1 to Length(DtStr) do
  begin
   If (DtStr[I] in ['0'..'9']) then
   begin
    If (Cnt < 2) or ((Cnt < 4) and (Part=3)) then
    begin
     Result:=Result+DtStr[I];
     Inc(Cnt);
    end
    else
    begin
     If Part = 3 then Exit
     else
     begin
      Result:=Result+{$IfDef XE3}FormatSettings.{$EndIf}DateSeparator+DtStr[I];
      Inc(Part);
      Cnt:=1;
     end;
    end;
   end
   else
    If Part = 3 then exit
    else
     If Cnt > 0 then
     begin
      Result := Result + {$IfDef XE3}FormatSettings.{$EndIf}DateSeparator;
      Inc(Part);
      Cnt := 0;
     end;
   end;
 end;

function MakeDateBoundsStr(aLowBound, aHighBound : TStDate) : AnsiString;
begin
 if aLowBound > 1 then
 begin
  Result := 'c ' + l3DateToStr(aLowBound);
  If aHighBound < MaxDate then
   Result := Result + ' ';
 end;

 If aHighBound < MaxDate then
  Result := Result + 'по ' + l3DateToStr(aHighBound);
end;

//function MakeDateBoundsStr(aDateBounds : Tl3DateBounds) : AnsiString;
//begin
// with aDateBounds do
//  Result := MakeDateBoundsStr(Low, High);
//end;

function MakeDateIntervalStr(aLowBound, aHighBound : TStDate; aDateSeparator : AnsiChar = '0') : AnsiString;

 function ReplaceDateSeparator(const aFormatStr : AnsiString; aDateSeparator : AnsiChar) : AnsiString;
 begin
  Result := aFormatStr;
  if aDateSeparator = '0' then Exit;
  l3Replace(Result, [AnsiChar(SysUtils.{$IfDef XE3}FormatSettings.{$EndIf}DateSeparator)], aDateSeparator);
 end;

var
 D1, M1, Y1,
 D2, M2, Y2 : Integer;
begin
 if aLowBound <= 0 then
  Result := ''
 else
  if aLowBound = aHighBound then
   Result := ReplaceDateSeparator(l3DateToStr(aLowBound, 'dd/mm/yyyy'), aDateSeparator)
  else
  begin
   StDateToDMY(aLowBound,  D1, M1, Y1);
   StDateToDMY(aHighBound, D2, M2, Y2);
   if (Y1 = Y2) and (M1 = M2) and (D1 = 1) and (D2 = l3Date.DaysInMonth(M2, Y2)) then
    Result := ReplaceDateSeparator(l3DateToStr(aLowBound, 'mm/yyyy'), aDateSeparator)
   else
   if (Y1 = Y2) and (M1 = 1) and (M2 = 12) and (D1 = 1) and (D2 = 31) then
    Result := Format('%d', [Y1])
   else
    Result := Format('%s-%s', [ReplaceDateSeparator(l3DateToStr(aLowBound, 'dd/mm/yyyy'), aDateSeparator),
                               ReplaceDateSeparator(l3DateToStr(aHighBound, 'dd/mm/yyyy'), aDateSeparator)]);
  end;
end;

function MakeHRDateIntervalStr(aLowBound, aHighBound : TStDate) : AnsiString;
var
 D1, M1, Y1,
 D2, M2, Y2 : Integer;
begin
if aLowBound <= 0 then
  Result := ''
 else
  if aLowBound = aHighBound then
   Result := l3DateToStr(aLowBound, 'dd mmmm yyyy')
  else
  begin
   StDateToDMY(aLowBound,  D1, M1, Y1);
   StDateToDMY(aHighBound, D2, M2, Y2);
   if (Y1 = Y2) and (D1 = 1) and (D2 = l3Date.DaysInMonth(M2, Y2)) then
   begin
    if (M1 = 1) and (M2 = 12) then
     Result := Format('%d', [Y1])
    else
    if (M1 = M2) then
     Result := l3DateToStr(aLowBound, 'mmmm yyyy')
    else
     Result := l3DateToStr(aLowBound, 'mmmm') + '-' + l3DateToStr(aHighBound, 'mmmm yyyy');
   end
   else
   if (Y1 = Y2) and (M1 = M2) then
    Result := Format('%d-%s', [D1, l3DateToStr(aHighBound, 'dd mmmm yyyy')])
   else
    Result := Format('%s - %s', [l3DateToStr(aLowBound, 'dd mmmm yyyy'),
                               l3DateToStr(aHighBound, 'dd mmmm yyyy')]);
  end;
end;

function l3StrToDateInterval(aDateStr: AnsiString; var StartDate: TStDate; var EndDate: TStDate): Boolean;
var
 l_Y1, l_M1, l_D1 : Integer;
 l_Y2, l_M2, l_D2 : Integer;
 l_DashPos: Integer;

 procedure l_ParseDate(const aInStr: AnsiString; var Y, M, D: Integer);
 const
  cDateConverError = 'Ошибка преобразования даты';
 var
  l_Pos       : Integer;
  l_PartCount : Integer;
  l_Temp      : AnsiString;
  l_CurChar   : AnsiChar;

  procedure ll_StoreValue;
  begin
   case l_PartCount of
    0 : Y := StrToInt(l_Temp);
    1 : begin
         M := Y;
         Y := StrToInt(l_Temp);
        end;
    2 : begin
         D := M;
         M := Y;
         Y := StrToInt(l_Temp);
        end;
    else
     raise EConvertError.Create(cDateConverError);
   end;
   Inc(l_PartCount);
   l_Temp := '';
  end;

 begin
  if aInStr = '' then
   Exit;
  l_Pos := 1;
  l_Temp := '';
  l_PartCount := 0;
  while l_Pos <= Length(aInStr) do
  begin
   l_CurChar := aInStr[l_Pos];
   case l_CurChar of
    '0'..'9' : l_Temp := l_Temp + l_CurChar;
    '/','.'  : ll_StoreValue;
   else
    raise EConvertError.Create(cDateConverError);
   end;
   Inc(l_Pos);
  end;
  if l_Temp <> '' then
   ll_StoreValue;
 end;

begin
 Result := False;
 l_Y1 := -1; l_M1 := -1; l_D1 := -1;
 l_Y2 := -1; l_M2 := -1; l_D2 := -1;
 l_DashPos := Pos('-', aDateStr);
 try
  if l_DashPos > 0 then
  begin
   l_ParseDate(Copy(aDateStr, 1, l_DashPos-1), l_Y1, l_M1, l_D1);
   l_ParseDate(Copy(aDateStr, l_DashPos+1, MaxInt), l_Y2, l_M2, l_D2);
  end
  else
   l_ParseDate(aDateStr, l_Y1, l_M1, l_D1);
 except
  Exit; // ошибка преобразовании даты
 end;

 // заполняем неуказанные поля
 if (l_Y1 = -1) or ((l_Y2=-1) and (l_DashPos > 0)) then
  Exit; // делать здесь нечего, нам передали какую-то хрень
 if l_Y2 = -1 then
  l_Y2 := l_Y1;

 if (l_M2 = -1) then
  if (l_DashPos > 0) or (l_M1 = -1) then
   l_M2 := 12
  else
   l_M2 := l_M1;
 if l_M1 = -1 then
  l_M1 := 1; // если месяц не указан, то это январь

 if (l_D2 = -1) then
  if (l_DashPos > 0) or (l_D1 = -1) then
   l_D2 := DaysInMonth(l_M2, l_Y2)
  else
   l_D2 := l_D1;
 if l_D1 = -1 then
  l_D1 := 1;

 l_Y1 := ExpandYear(l_Y1);
 l_Y2 := ExpandYear(l_Y2);
 StartDate := DMYtoStDate(l_D1, l_M1, l_Y1);
 EndDate   := DMYtoStDate(l_D2, l_M2, l_Y2);
 Result := True;
end;

Initialization
 PresetStr;
end.


